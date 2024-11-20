export CUDA_VISIBLE_DEVICES=1

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/TimeModernTCN" ]; then
    mkdir ./log/TimeModernTCN
fi

if [ ! -d "./log/TimeModernTCN/ecl" ]; then
    mkdir ./log/TimeModernTCN/ecl
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
    --model TimeModernTCN \
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
    --rda 1 \
    --rdb 1 \
    --ksize 5 \
    --beta 0.1 \
    --des Exp | tee -a ./log/TimeModernTCN/ecl/$seq_len.txt

python -u run.py \
    --time_feature_types HourOfDay DayOfWeek \
    --task_name long_term_forecast \
    --is_training 1 \
    --with_curve 0 \
    --root_path ./dataset/electricity/ \
    --data_path electricity.csv \
    --data custom \
    --model_id ECL_$seq_len'_'192 \
    --model TimeModernTCN \
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
    --rda 1 \
    --rdb 1 \
    --ksize 5 \
    --beta 0.1 \
    --des Exp | tee -a ./log/TimeModernTCN/ecl/$seq_len.txt

python -u run.py \
    --time_feature_types HourOfDay DayOfWeek SeasonOfYear \
    --task_name long_term_forecast \
    --is_training 1 \
    --with_curve 0 \
    --root_path ./dataset/electricity/ \
    --data_path electricity.csv \
    --data custom \
    --model_id ECL_$seq_len'_'336 \
    --model TimeModernTCN \
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
    --rda 1 \
    --rdb 1 \
    --ksize 5 \
    --beta 0.1 \
    --des Exp | tee -a ./log/TimeModernTCN/ecl/$seq_len.txt

python -u run.py \
    --time_feature_types HourOfDay DayOfWeek SeasonOfYear \
    --task_name long_term_forecast \
    --is_training 1 \
    --with_curve 0 \
    --root_path ./dataset/electricity/ \
    --data_path electricity.csv \
    --data custom \
    --model_id ECL_$seq_len'_'720 \
    --model TimeModernTCN \
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
    --rda 1 \
    --rdb 1 \
    --ksize 5 \
    --beta 0.1 \
    --des Exp | tee -a ./log/TimeModernTCN/ecl/$seq_len.txt
