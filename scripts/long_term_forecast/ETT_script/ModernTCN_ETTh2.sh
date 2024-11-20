export CUDA_VISIBLE_DEVICES=1

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/ModernTCN" ]; then
    mkdir ./log/ModernTCN
fi

if [ ! -d "./log/ModernTCN/etth2" ]; then
    mkdir ./log/ModernTCN/etth2
fi

seq_len=96

python -u run.py \
    --time_feature_types HourOfDay \
    --task_name long_term_forecast \
    --is_training 1 \
    --with_curve 0 \
    --root_path ./dataset/ETT-small/ \
    --data_path ETTh2.csv \
    --data ETTh2 \
    --model_id ETTh2_$seq_len'_'96 \
    --model ModernTCN \
    --features M \
    --seq_len 96 \
    --pred_len 96 \
    --ffn_ratio 1 \
    --patch_size 8 \
    --patch_stride 4 \
    --num_blocks 1 \
    --large_size 51 \
    --small_size 5 \
    --dims 64 64 64 64 \
    --head_dropout 0.0 \
    --enc_in 7 \
    --dec_in 7 \
    --c_out 7 \
    --dropout 0.3 \
    --itr 1 \
    --train_epochs 100 \
    --batch_size 512 \
    --patience 20 \
    --learning_rate 0.0001 \
    --des Exp \
    --lradj type3 | tee -a ./log/ModernTCN/etth2/$seq_len.txt

python -u run.py \
    --time_feature_types HourOfDay \
    --task_name long_term_forecast \
    --is_training 1 \
    --with_curve 0 \
    --root_path ./dataset/ETT-small/ \
    --data_path ETTh2.csv \
    --data ETTh2 \
    --model_id ETTh2_$seq_len'_'192 \
    --model ModernTCN \
    --features M \
    --seq_len 96 \
    --pred_len 192 \
    --ffn_ratio 1 \
    --patch_size 8 \
    --patch_stride 4 \
    --num_blocks 1 \
    --large_size 51 \
    --small_size 5 \
    --dims 64 64 64 64 \
    --head_dropout 0.0 \
    --enc_in 7 \
    --dec_in 7 \
    --c_out 7 \
    --dropout 0.3 \
    --itr 1 \
    --train_epochs 100 \
    --batch_size 512 \
    --patience 20 \
    --learning_rate 0.0001 \
    --des Exp \
    --lradj type3 | tee -a ./log/ModernTCN/etth2/$seq_len.txt

python -u run.py \
    --time_feature_types HourOfDay \
    --task_name long_term_forecast \
    --is_training 1 \
    --with_curve 0 \
    --root_path ./dataset/ETT-small/ \
    --data_path ETTh2.csv \
    --data ETTh2 \
    --model_id ETTh2_$seq_len'_'336 \
    --model ModernTCN \
    --features M \
    --seq_len 96 \
    --pred_len 336 \
    --ffn_ratio 1 \
    --patch_size 8 \
    --patch_stride 4 \
    --num_blocks 1 \
    --large_size 51 \
    --small_size 5 \
    --dims 64 64 64 64 \
    --head_dropout 0.0 \
    --enc_in 7 \
    --dec_in 7 \
    --c_out 7 \
    --dropout 0.3 \
    --itr 1 \
    --train_epochs 100 \
    --batch_size 512 \
    --patience 20 \
    --learning_rate 0.0001 \
    --des Exp \
    --lradj type3 | tee -a ./log/ModernTCN/etth2/$seq_len.txt

python -u run.py \
    --time_feature_types HourOfDay \
    --task_name long_term_forecast \
    --is_training 1 \
    --with_curve 0 \
    --root_path ./dataset/ETT-small/ \
    --data_path ETTh2.csv \
    --data ETTh2 \
    --model_id ETTh2_$seq_len'_'720 \
    --model ModernTCN \
    --features M \
    --seq_len 96 \
    --pred_len 720 \
    --ffn_ratio 1 \
    --patch_size 8 \
    --patch_stride 4 \
    --num_blocks 1 \
    --large_size 51 \
    --small_size 5 \
    --dims 64 64 64 64 \
    --head_dropout 0.5 \
    --enc_in 7 \
    --dec_in 7 \
    --c_out 7 \
    --dropout 0.8 \
    --itr 1 \
    --train_epochs 100 \
    --batch_size 512 \
    --patience 20 \
    --learning_rate 0.0001 \
    --des Exp \
    --lradj type3 | tee -a ./log/ModernTCN/etth2/$seq_len.txt
