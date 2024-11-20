export CUDA_VISIBLE_DEVICES=1

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/FITS" ]; then
    mkdir ./log/FITS
fi

if [ ! -d "./log/FITS/traffic" ]; then
    mkdir ./log/FITS/traffic
fi

model_name=FITS

H_order=6
seq_len=96
m=1
bs=64

for seed in 2020 2021 2022
do
python -u run.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/traffic/ \
  --data_path traffic.csv \
  --model_id Traffic_$seq_len'_j'96'_H'$H_order \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len $seq_len \
  --pred_len 96 \
  --enc_in 862 \
  --dec_in 862 \
  --c_out 862 \
  --des 'Exp' \
  --train_mode $m \
  --H_order $H_order \
  --seed $seed \
  --patience 3 \
  --train_epochs 10 \
  --itr 1 \
  --batch_size $bs \
  --learning_rate 0.01 | tee -a ./log/FITS/traffic/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/traffic/ \
  --data_path traffic.csv \
  --model_id Traffic_$seq_len'_j'192'_H'$H_order \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len $seq_len \
  --pred_len 192 \
  --enc_in 862 \
  --dec_in 862 \
  --c_out 862 \
  --des 'Exp' \
  --train_mode $m \
  --H_order $H_order \
  --seed $seed \
  --patience 3 \
  --train_epochs 10 \
  --itr 1 \
  --batch_size $bs \
  --learning_rate 0.01 | tee -a ./log/FITS/traffic/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/traffic/ \
  --data_path traffic.csv \
  --model_id Traffic_$seq_len'_j'336'_H'$H_order \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len $seq_len \
  --pred_len 336 \
  --enc_in 862 \
  --dec_in 862 \
  --c_out 862 \
  --des 'Exp' \
  --train_mode $m \
  --H_order $H_order \
  --seed $seed \
  --patience 3 \
  --train_epochs 10 \
  --itr 1 \
  --batch_size $bs \
  --learning_rate 0.01 | tee -a ./log/FITS/traffic/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/traffic/ \
  --data_path traffic.csv \
  --model_id Traffic_$seq_len'_j'720'_H'$H_order \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len $seq_len \
  --pred_len 720 \
  --enc_in 862 \
  --dec_in 862 \
  --c_out 862 \
  --des 'Exp' \
  --train_mode $m \
  --H_order $H_order \
  --seed $seed \
  --patience 3 \
  --train_epochs 10 \
  --itr 1 \
  --batch_size $bs \
  --learning_rate 0.01 | tee -a ./log/FITS/traffic/$seq_len.txt
done
