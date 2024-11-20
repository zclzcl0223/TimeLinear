export CUDA_VISIBLE_DEVICES=1

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/TimeTimesNet" ]; then
    mkdir ./log/TimeTimesNet
fi

if [ ! -d "./log/TimeTimesNet/ettm1" ]; then
    mkdir ./log/TimeTimesNet/ettm1
fi

seq_len=96

model_name=TimeTimesNet


for seed in 2020 2021 2022
do
python -u run.py \
  --with_curve 0 \
  --time_feature_types MinuteOfHour HourOfDay \
  --seed $seed \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTm1.csv \
  --model_id ETTm1_96_96 \
  --model $model_name \
  --data ETTm1 \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 96 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --d_model 64 \
  --d_ff 64 \
  --top_k 5 \
  --rda 1 \
  --rdb 1 \
  --ksize 5 \
  --beta 0.9 \
  --itr 1 | tee -a ./log/TimeTimesNet/ettm1/$seq_len.txt
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
  --data_path ETTm1.csv \
  --model_id ETTm1_96_192 \
  --model $model_name \
  --data ETTm1 \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 192 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --d_model 64 \
  --d_ff 64 \
  --top_k 5 \
  --rda 1 \
  --rdb 1 \
  --ksize 5 \
  --beta 0.7 \
  --itr 1 | tee -a ./log/TimeTimesNet/ettm1/$seq_len.txt
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
  --data_path ETTm1.csv \
  --model_id ETTm1_96_336 \
  --model $model_name \
  --data ETTm1 \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 336 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --d_model 16 \
  --d_ff 32 \
  --top_k 5 \
  --itr 1 \
  --rda 1 \
  --rdb 1 \
  --ksize 5 \
  --beta 0.9 | tee -a ./log/TimeTimesNet/ettm1/$seq_len.txt
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
  --data_path ETTm1.csv \
  --model_id ETTm1_96_720 \
  --model $model_name \
  --data ETTm1 \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 720 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --d_model 16 \
  --d_ff 32 \
  --top_k 5 \
  --rda 1 \
  --rdb 1 \
  --ksize 5 \
  --beta 0.7 \
  --itr 1 | tee -a ./log/TimeTimesNet/ettm1/$seq_len.txt
done
