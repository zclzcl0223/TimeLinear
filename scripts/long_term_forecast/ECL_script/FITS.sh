export CUDA_VISIBLE_DEVICES=1

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/FITS" ]; then
    mkdir ./log/FITS
fi

if [ ! -d "./log/FITS/ecl" ]; then
    mkdir ./log/FITS/ecl
fi

seq_len=96
model_name=FITS
bs=64
m=1
H_order=6

for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types HourOfDay DayOfWeek \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/electricity/ \
  --data_path electricity.csv \
  --model_id Electricity_$seq_len'_j'96'_H'$H_order \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len $seq_len \
  --pred_len 96 \
  --enc_in 321 \
  --dec_in 321 \
  --c_out 321 \
  --des 'Exp' \
  --train_mode $m \
  --H_order $H_order \
  --seed $seed \
  --patience 3 \
  --train_epochs 10 \
  --itr 1 \
  --batch_size $bs \
  --learning_rate 0.01 | tee -a ./log/FITS/ecl/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types HourOfDay DayOfWeek \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/electricity/ \
  --data_path electricity.csv \
  --model_id Electricity_$seq_len'_j'192'_H'$H_order \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len $seq_len \
  --pred_len 192 \
  --enc_in 321 \
  --dec_in 321 \
  --c_out 321 \
  --des 'Exp' \
  --train_mode $m \
  --H_order $H_order \
  --seed $seed \
  --patience 3 \
  --train_epochs 10 \
  --itr 1 \
  --batch_size $bs \
  --learning_rate 0.01 | tee -a ./log/FITS/ecl/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types HourOfDay DayOfWeek \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/electricity/ \
  --data_path electricity.csv \
  --model_id Electricity_$seq_len'_j'336'_H'$H_order \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len $seq_len \
  --pred_len 336 \
  --enc_in 321 \
  --dec_in 321 \
  --c_out 321 \
  --des 'Exp' \
  --train_mode $m \
  --H_order $H_order \
  --seed $seed \
  --patience 3 \
  --train_epochs 10 \
  --itr 1 \
  --batch_size $bs \
  --learning_rate 0.01 | tee -a ./log/FITS/ecl/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types HourOfDay DayOfWeek \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/electricity/ \
  --data_path electricity.csv \
  --model_id Electricity_$seq_len'_j'720'_H'$H_order \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len $seq_len \
  --pred_len 720 \
  --enc_in 321 \
  --dec_in 321 \
  --c_out 321 \
  --des 'Exp' \
  --train_mode $m \
  --H_order $H_order \
  --seed $seed \
  --patience 3 \
  --train_epochs 10 \
  --itr 1 \
  --batch_size $bs \
  --learning_rate 0.01 | tee -a ./log/FITS/ecl/$seq_len.txt
done
