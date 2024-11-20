export CUDA_VISIBLE_DEVICES=1

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/TimeFITS" ]; then
    mkdir ./log/TimeFITS
fi

if [ ! -d "./log/TimeFITS/etth2" ]; then
    mkdir ./log/TimeFITS/etth2
fi

model_name=TimeFITS

H_order=6
seq_len=96
m=1
bs=64

for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types HourOfDay \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTh2.csv \
  --model_id ETTh2_$seq_len'_'96 \
  --model $model_name \
  --data ETTh2 \
  --features M \
  --seq_len $seq_len \
  --pred_len 96 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --train_mode $m \
  --H_order $H_order \
  --seed $seed \
  --patience 3 \
  --train_epochs 10 \
  --itr 1 \
  --rda 1 \
  --rdb 1 \
  --ksize 5 \
  --beta 0.7 \
  --batch_size $bs \
  --learning_rate 0.01 | tee -a ./log/TimeFITS/etth2/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types HourOfDay MonthOfYear \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTh2.csv \
  --model_id ETTh2_$seq_len'_'192 \
  --model $model_name \
  --data ETTh2 \
  --features M \
  --seq_len $seq_len \
  --pred_len 192 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --train_mode $m \
  --H_order $H_order \
  --seed $seed \
  --patience 3 \
  --train_epochs 10 \
  --itr 1 \
  --rda 1 \
  --rdb 1 \
  --ksize 5 \
  --beta 0.2 \
  --batch_size $bs \
  --learning_rate 0.01 | tee -a ./log/TimeFITS/etth2/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types HourOfDay DayOfWeek MonthOfYear \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTh2.csv \
  --model_id ETTh2_$seq_len'_'336 \
  --model $model_name \
  --data ETTh2 \
  --features M \
  --seq_len $seq_len \
  --pred_len 336 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --train_mode $m \
  --H_order $H_order \
  --seed $seed \
  --patience 3 \
  --train_epochs 10 \
  --itr 1 \
  --rda 1 \
  --rdb 1 \
  --ksize 5 \
  --beta 0.7 \
  --batch_size $bs \
  --learning_rate 0.01 | tee -a ./log/TimeFITS/etth2/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types HourOfDay MonthOfYear SeasonOfYear \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTh2.csv \
  --model_id ETTh2_$seq_len'_'720 \
  --model $model_name \
  --data ETTh2 \
  --features M \
  --seq_len $seq_len \
  --pred_len 720 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --train_mode $m \
  --H_order $H_order \
  --seed $seed \
  --patience 3 \
  --train_epochs 10 \
  --itr 1 \
  --rda 1 \
  --rdb 1 \
  --ksize 5 \
  --beta 0.3 \
  --batch_size $bs \
  --learning_rate 0.01 | tee -a ./log/TimeFITS/etth2/$seq_len.txt
done
