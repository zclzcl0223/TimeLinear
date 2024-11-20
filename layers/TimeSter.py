import torch
import torch.nn as nn
import torch.nn.functional as F

class TimeSter(nn.Module):
    def __init__(self, time_dim=3, n_variate=7, n_out=7, seq_len=96, pred_len=96, rda=4, rdb=1, ksize=5):
        super(TimeSter, self).__init__()
        self.time_enc = nn.Sequential(
                                      nn.Linear(time_dim, n_variate//rda), 
                                      nn.LayerNorm(n_variate//rda),
                                      nn.ReLU(),
                                      nn.Linear(n_variate//rda, n_variate//rdb), 
                                      nn.LayerNorm(n_variate//rdb),
                                      nn.ReLU(),
                                      nn.Conv1d(in_channels=seq_len, 
                                                out_channels=seq_len, 
                                                kernel_size=ksize, 
                                                padding='same'),
                                      nn.Linear(n_variate//rdb, n_out),
                                      )
        self.time_proj = nn.Linear(seq_len, pred_len)
        
    def forward(self, time_features):
        time_embed = self.time_enc(time_features)
        output = self.time_proj(time_embed.transpose(1, 2)).transpose(1, 2)
        return output