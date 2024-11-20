export CUDA_VISIBLE_DEVICES=1

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/TimeModernTCN" ]; then
    mkdir ./log/TimeModernTCN
fi

if [ ! -d "./log/TimeModernTCN/weather" ]; then
    mkdir ./log/TimeModernTCN/weather
fi

seq_len=96

python -u run.py \
    --time_feature_types HourOfDay SeasonOfYear \
    --task_name long_term_forecast \
    --is_training 1 \
    --with_curve 0 \
    --root_path ./dataset/weather/ \
    --data_path weather.csv \
    --data custom \
    --model_id weather_$seq_len'_'96 \
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
    --enc_in 21 \
    --dec_in 21 \
    --c_out 21 \
    --lradj type3 \
    --dropout 0.4 \
    --itr 1 \
    --rda 1 \
    --rdb 1 \
    --ksize 9 \
    --beta 0.4 \
    --train_epochs 100 \
    --batch_size 256 \
    --patience 20 \
    --learning_rate 0.0001 \
    --des Exp | tee -a ./log/TimeModernTCN/weather/$seq_len.txt

python -u run.py \
    --time_feature_types HourOfDay SeasonOfYear \
    --task_name long_term_forecast \
    --is_training 1 \
    --with_curve 0 \
    --root_path ./dataset/weather/ \
    --data_path weather.csv \
    --data custom \
    --model_id weather_$seq_len'_'192 \
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
    --enc_in 21 \
    --dec_in 21 \
    --c_out 21 \
    --lradj type3 \
    --dropout 0.4 \
    --itr 1 \
    --rda 1 \
    --rdb 1 \
    --ksize 9 \
    --beta 0.4 \
    --train_epochs 100 \
    --batch_size 256 \
    --patience 20 \
    --learning_rate 0.0001 \
    --des Exp | tee -a ./log/TimeModernTCN/weather/$seq_len.txt


python -u run.py \
    --time_feature_types HourOfDay SeasonOfYear \
    --task_name long_term_forecast \
    --is_training 1 \
    --with_curve 0 \
    --root_path ./dataset/weather/ \
    --data_path weather.csv \
    --data custom \
    --model_id weather_$seq_len'_'336 \
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
    --enc_in 21 \
    --dec_in 21 \
    --c_out 21 \
    --lradj type3 \
    --dropout 0.4 \
    --itr 1 \
    --rda 1 \
    --rdb 1 \
    --ksize 3 \
    --beta 0.4 \
    --train_epochs 100 \
    --batch_size 512 \
    --patience 20 \
    --learning_rate 0.0001 \
    --des Exp | tee -a ./log/TimeModernTCN/weather/$seq_len.txt


python -u run.py \
    --time_feature_types HourOfDay SeasonOfYear \
    --task_name long_term_forecast \
    --is_training 1 \
    --with_curve 0 \
    --root_path ./dataset/weather/ \
    --data_path weather.csv \
    --data custom \
    --model_id weather_$seq_len'_'720 \
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
    --enc_in 21 \
    --dec_in 21 \
    --c_out 21 \
    --lradj type3 \
    --dropout 0.4 \
    --itr 1 \
    --rda 1 \
    --rdb 1 \
    --ksize 9 \
    --beta 0.4 \
    --train_epochs 100 \
    --batch_size 512 \
    --patience 20 \
    --learning_rate 0.0001 \
    --des Exp | tee -a ./log/TimeModernTCN/weather/$seq_len.txt
