import torch
import torch.nn as nn
import torch.nn.functional as F
from layers.Invertible import RevIN
from layers.GLAFF import Plugin


class Model(nn.Module):
    def __init__(self, args):
        super(Model, self).__init__()
        self.task_name = args.task_name
        self.seq_len = args.seq_len
        self.args = args
        if self.task_name == 'classification' or self.task_name == 'anomaly_detection' or self.task_name == 'imputation':
            self.pred_len = args.seq_len
        else:
            self.pred_len = args.pred_len      

        self.dropout = nn.Dropout(args.dropout)

        if self.task_name == 'classification':
            self.act = F.gelu
            self.projection = nn.Linear(
                args.enc_in * args.seq_len, args.num_class)

        self.histroy_proj = nn.Linear(self.seq_len, self.pred_len)

        self.plugin = Plugin(args)

    def encoder(self, x, x_mark_enc, y_mark_dec):
        # x: [B, L, D]
        x_enc_copy, x_mark_enc_copy, y_mark_dec_copy = x.clone(), x_mark_enc.clone(), y_mark_dec.clone()
        means = torch.mean(x, dim=1, keepdim=True)
        stdev = torch.sqrt(torch.var(x, dim=1, keepdim=True) + 1e-5)
        x = (x - means) / stdev

        pred = self.histroy_proj(x.transpose(1, 2)).transpose(1, 2)
        pred = pred * stdev + means
        map1 = pred.clone()
        pred, reco, map2 = self.plugin(x_enc_copy, x_mark_enc_copy, map1, y_mark_dec_copy[:, -self.pred_len:, :])

        return pred, reco, map1, map2

    def forecast(self, x_enc, x_mark_enc, y_mark_dec):
        # Encoder
        return self.encoder(x_enc, x_mark_enc, y_mark_dec)

    def imputation(self, x_enc, x_mark_enc):
        # Encoder
        return self.encoder(x_enc, x_mark_enc)

    def anomaly_detection(self, x_enc, x_mark_enc):
        # Encoder
        return self.encoder(x_enc, x_mark_enc)

    def classification(self, x_enc, x_mark_enc):
        # Encoder
        enc_out = self.encoder(x_enc, x_mark_enc)
        # Output
        # (batch_size, seq_length * d_model)
        output = enc_out.reshape(enc_out.shape[0], -1)
        # (batch_size, num_classes)
        output = self.projection(output)
        return output

    def forward(self, x_enc, x_mark_enc, x_dec, y_mark_dec, mask=None):
        if self.task_name == 'long_term_forecast' or self.task_name == 'short_term_forecast':
            dec_out = self.forecast(x_enc, x_mark_enc, y_mark_dec)
            return dec_out  # [B, L, D]
        if self.task_name == 'imputation':
            dec_out = self.imputation(x_enc)
            return dec_out  # [B, L, D]
        if self.task_name == 'anomaly_detection':
            dec_out = self.anomaly_detection(x_enc)
            return dec_out  # [B, L, D]
        if self.task_name == 'classification':
            dec_out = self.classification(x_enc)
            return dec_out  # [B, N]
        return None