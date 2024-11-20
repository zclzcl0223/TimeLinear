export CUDA_VISIBLE_DEVICES=0

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/TimeFITS" ]; then
    mkdir ./log/TimeFITS
fi

if [ ! -d "./log/TimeFITS/ettm1" ]; then
    mkdir ./log/TimeFITS/ettm1
fi

model_name=TimeFITS

H_order=14
seq_len=96
m=1
bs=64


for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types MinuteOfHour HourOfDay DayOfWeek \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTm1.csv \
  --model_id ETTm1_$seq_len'_'96 \
  --model $model_name \
  --data ETTm1 \
  --features M \
  --seq_len $seq_len \
  --pred_len 96 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --train_mode $m \
  --H_order $H_order \
  --base_T 96 \
  --seed $seed \
  --patience 3 \
  --train_epochs 10 \
  --itr 1 \
  --rda 1 \
  --rdb 1 \
  --ksize 5 \
  --beta 0.2 \
  --batch_size $bs \
  --learning_rate 0.01 | tee -a ./log/TimeFITS/ettm1/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types MinuteOfHour HourOfDay \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTm1.csv \
  --model_id ETTm1_$seq_len'_'192 \
  --model $model_name \
  --data ETTm1 \
  --features M \
  --seq_len $seq_len \
  --pred_len 192 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --train_mode $m \
  --H_order $H_order \
  --base_T 96 \
  --seed $seed \
  --patience 3 \
  --train_epochs 10 \
  --itr 1 \
  --rda 1 \
  --rdb 1 \
  --ksize 5 \
  --beta 0.7 \
  --batch_size $bs \
  --learning_rate 0.01 | tee -a ./log/TimeFITS/ettm1/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types MinuteOfHour HourOfDay \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTm1.csv \
  --model_id ETTm1_$seq_len'_'336 \
  --model $model_name \
  --data ETTm1 \
  --features M \
  --seq_len $seq_len \
  --pred_len 336 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --train_mode $m \
  --H_order $H_order \
  --base_T 96 \
  --seed $seed \
  --patience 3 \
  --train_epochs 10 \
  --itr 1 \
  --rda 1 \
  --rdb 1 \
  --ksize 5 \
  --beta 0.2 \
  --batch_size $bs \
  --learning_rate 0.01 | tee -a ./log/TimeFITS/ettm1/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types MinuteOfHour HourOfDay \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTm1.csv \
  --model_id ETTm1_$seq_len'_'720 \
  --model $model_name \
  --data ETTm1 \
  --features M \
  --seq_len $seq_len \
  --pred_len 720 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --train_mode $m \
  --H_order $H_order \
  --base_T 96 \
  --seed $seed \
  --patience 3 \
  --train_epochs 10 \
  --itr 1 \
  --rda 1 \
  --rdb 1 \
  --ksize 5 \
  --beta 0.3 \
  --batch_size $bs \
  --learning_rate 0.01 | tee -a ./log/TimeFITS/ettm1/$seq_len.txt
done
