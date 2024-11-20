export CUDA_VISIBLE_DEVICES=1

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/TimePatchTST" ]; then
    mkdir ./log/TimePatchTST
fi

if [ ! -d "./log/TimePatchTST/ettm2" ]; then
    mkdir ./log/TimePatchTST/ettm2
fi

model_name=TimePatchTST
seq_len=96

for seed in 2020 2021 2022
do
python -u run.py \
  --with_curve 0 \
  --time_feature_types HourOfDay \
  --seed $seed \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTm2.csv \
  --model_id ETTm2_96_96 \
  --model $model_name \
  --data ETTm2 \
  --features M \
  --seq_len 96 \
  --pred_len 96 \
  --e_layers 3 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --n_heads 16 \
  --batch_size 32 \
  --rda 1 \
  --rdb 1 \
  --ksize 7 \
  --beta 0.3 \
  --itr 1 | tee -a ./log/TimePatchTST/ettm2/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --with_curve 0 \
  --time_feature_types HourOfDay \
  --seed $seed \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTm2.csv \
  --model_id ETTm2_96_192 \
  --model $model_name \
  --data ETTm2 \
  --features M \
  --seq_len 96 \
  --pred_len 192 \
  --e_layers 3 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --n_heads 2 \
  --batch_size 128 \
  --rda 1 \
  --rdb 1 \
  --ksize 3 \
  --beta 0.8 \
  --itr 1 | tee -a ./log/TimePatchTST/ettm2/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --with_curve 0 \
  --time_feature_types MinuteOfHour HourOfDay \
  --seed $seed \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTm2.csv \
  --model_id ETTm2_96_336 \
  --model $model_name \
  --data ETTm2 \
  --features M \
  --seq_len 96 \
  --pred_len 336 \
  --e_layers 1 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --n_heads 4 \
  --batch_size 32 \
  --rda 1 \
  --rdb 1 \
  --ksize 7 \
  --beta 0.3 \
  --itr 1 | tee -a ./log/TimePatchTST/ettm2/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --with_curve 0 \
  --time_feature_types MinuteOfHour HourOfDay \
  --seed $seed \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTm2.csv \
  --model_id ETTm2_96_720 \
  --model $model_name \
  --data ETTm2 \
  --features M \
  --seq_len 96 \
  --pred_len 720 \
  --e_layers 3 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --n_heads 4 \
  --batch_size 128 \
  --rda 1 \
  --rdb 1 \
  --ksize 5 \
  --beta 0.3 \
  --itr 1 | tee -a ./log/TimePatchTST/ettm2/$seq_len.txt
done
