export CUDA_VISIBLE_DEVICES=1

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/ModernTCN" ]; then
    mkdir ./log/ModernTCN
fi

if [ ! -d "./log/ModernTCN/ecl" ]; then
    mkdir ./log/ModernTCN/ecl
fi

seq_len=96

python -u run.py \
    --time_feature_types HourOfDay DayOfWeek \
    --task_name long_term_forecast \
    --is_training 1 \
    --with_curve 0 \
    --root_path ./dataset/electricity/ \
    --data_path electricity.csv \
    --data custom \
    --model_id ECL_$seq_len'_'96 \
    --model ModernTCN \
    --features M \
    --seq_len 96 \
    --pred_len 96 \
    --ffn_ratio 8 \
    --patch_size 8 \
    --patch_stride 4 \
    --num_blocks 1 \
    --large_size 51 \
    --small_size 5 \
    --dims 64 64 64 64 \
    --head_dropout 0.0 \
    --enc_in 321 \
    --dec_in 321 \
    --c_out 321 \
    --lradj type3 \
    --dropout 0.9 \
    --itr 1 \
    --train_epochs 100 \
    --batch_size 32 \
    --patience 10 \
    --learning_rate 0.0001 \
    --des Exp | tee -a ./log/ModernTCN/ecl/$seq_len.txt

python -u run.py \
    --time_feature_types HourOfDay DayOfWeek \
    --task_name long_term_forecast \
    --is_training 1 \
    --with_curve 0 \
    --root_path ./dataset/electricity/ \
    --data_path electricity.csv \
    --data custom \
    --model_id ECL_$seq_len'_'192 \
    --model ModernTCN \
    --features M \
    --seq_len 96 \
    --pred_len 192 \
    --ffn_ratio 8 \
    --patch_size 8 \
    --patch_stride 4 \
    --num_blocks 1 \
    --large_size 51 \
    --small_size 5 \
    --dims 64 64 64 64 \
    --head_dropout 0.0 \
    --enc_in 321 \
    --dec_in 321 \
    --c_out 321 \
    --lradj type3 \
    --dropout 0.9 \
    --itr 1 \
    --train_epochs 100 \
    --batch_size 32 \
    --patience 10 \
    --learning_rate 0.0001 \
    --des Exp | tee -a ./log/ModernTCN/ecl/$seq_len.txt

python -u run.py \
    --time_feature_types HourOfDay DayOfWeek \
    --task_name long_term_forecast \
    --is_training 1 \
    --with_curve 0 \
    --root_path ./dataset/electricity/ \
    --data_path electricity.csv \
    --data custom \
    --model_id ECL_$seq_len'_'336 \
    --model ModernTCN \
    --features M \
    --seq_len 96 \
    --pred_len 336 \
    --ffn_ratio 8 \
    --patch_size 8 \
    --patch_stride 4 \
    --num_blocks 1 \
    --large_size 51 \
    --small_size 5 \
    --dims 64 64 64 64 \
    --head_dropout 0.0 \
    --enc_in 321 \
    --dec_in 321 \
    --c_out 321 \
    --lradj type3 \
    --dropout 0.9 \
    --itr 1 \
    --train_epochs 100 \
    --batch_size 32 \
    --patience 10 \
    --learning_rate 0.0001 \
    --des Exp | tee -a ./log/ModernTCN/ecl/$seq_len.txt

python -u run.py \
    --time_feature_types HourOfDay DayOfWeek \
    --task_name long_term_forecast \
    --is_training 1 \
    --with_curve 0 \
    --root_path ./dataset/electricity/ \
    --data_path electricity.csv \
    --data custom \
    --model_id ECL_$seq_len'_'720 \
    --model ModernTCN \
    --features M \
    --seq_len 96 \
    --pred_len 720 \
    --ffn_ratio 8 \
    --patch_size 8 \
    --patch_stride 4 \
    --num_blocks 1 \
    --large_size 51 \
    --small_size 5 \
    --dims 64 64 64 64 \
    --head_dropout 0.0 \
    --enc_in 321 \
    --dec_in 321 \
    --c_out 321 \
    --lradj type3 \
    --dropout 0.9 \
    --itr 1 \
    --train_epochs 100 \
    --batch_size 32 \
    --patience 10 \
    --learning_rate 0.0001 \
    --des Exp | tee -a ./log/ModernTCN/ecl/$seq_len.txt
