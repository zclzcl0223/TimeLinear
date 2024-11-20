export CUDA_VISIBLE_DEVICES=1

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/TimeFITS" ]; then
    mkdir ./log/TimeFITS
fi

if [ ! -d "./log/TimeFITS/weather" ]; then
    mkdir ./log/TimeFITS/weather
fi

model_name=TimeFITS

seq_len=96
bs=32

for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types HourOfDay SeasonOfYear \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/weather/ \
  --data_path weather.csv \
  --model_id Weather_$seq_len'_j'96'_H'$H_order \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len $seq_len \
  --pred_len 96 \
  --enc_in 21 \
  --dec_in 21 \
  --c_out 21 \
  --des 'Exp' \
  --train_mode 2 \
  --H_order 12 \
  --base_T 144 \
  --patience 3 \
  --train_epochs 10 \
  --itr 1 \
  --rda 4 \
  --rdb 2 \
  --ksize 3 \
  --beta 0.5 \
  --batch_size $bs \
  --learning_rate 0.01 \
  --seed $seed | tee -a ./log/TimeFITS/weather/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types HourOfDay SeasonOfYear \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/weather/ \
  --data_path weather.csv \
  --model_id Weather_$seq_len'_j'192'_H'$H_order \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len $seq_len \
  --pred_len 192 \
  --enc_in 21 \
  --dec_in 21 \
  --c_out 21 \
  --des 'Exp' \
  --train_mode 1 \
  --H_order 12 \
  --base_T 144 \
  --patience 3 \
  --train_epochs 10 \
  --itr 1 \
  --rda 4 \
  --rdb 2 \
  --ksize 3 \
  --beta 0.5 \
  --batch_size $bs \
  --learning_rate 0.01 \
  --seed $seed | tee -a ./log/TimeFITS/weather/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types HourOfDay SeasonOfYear \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/weather/ \
  --data_path weather.csv \
  --model_id Weather_$seq_len'_j'336'_H'$H_order \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len $seq_len \
  --pred_len 336 \
  --enc_in 21 \
  --dec_in 21 \
  --c_out 21 \
  --des 'Exp' \
  --train_mode 2 \
  --H_order 8 \
  --base_T 144 \
  --patience 3 \
  --train_epochs 10 \
  --itr 1 \
  --rda 4 \
  --rdb 2 \
  --ksize 3 \
  --beta 0.5 \
  --batch_size $bs \
  --learning_rate 0.01 \
  --seed $seed | tee -a ./log/TimeFITS/weather/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types HourOfDay SeasonOfYear \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/weather/ \
  --data_path weather.csv \
  --model_id Weather_$seq_len'_j'720'_H'$H_order \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len $seq_len \
  --pred_len 720 \
  --enc_in 21 \
  --dec_in 21 \
  --c_out 21 \
  --des 'Exp' \
  --train_mode 1 \
  --H_order 12 \
  --base_T 144 \
  --itr 1 \
  --rda 4 \
  --rdb 2 \
  --ksize 3 \
  --beta 0.5 \
  --patience 3 \
  --train_epochs 10 \
  --batch_size $bs \
  --learning_rate 0.01 \
  --seed $seed | tee -a ./log/TimeFITS/weather/$seq_len.txt
done
