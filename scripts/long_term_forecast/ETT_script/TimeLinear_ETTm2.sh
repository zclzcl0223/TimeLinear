export CUDA_VISIBLE_DEVICES=0

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/TimeLinear" ]; then
    mkdir ./log/TimeLinear
fi

if [ ! -d "./log/TimeLinear/ettm2" ]; then
    mkdir ./log/TimeLinear/ettm2
fi

model_name=TimeLinear

for seq_len in 96
do
for beta in 0.4
do
for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types HourOfDay \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTm2.csv \
  --model_id ETTm2_$seq_len'_'96 \
  --model $model_name \
  --data ETTm2 \
  --features M \
  --freq t \
  --seq_len $seq_len \
  --pred_len 96 \
  --factor 3 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --rda 1 \
  --rdb 1 \
  --ksize 7 \
  --beta $beta \
  --learning_rate 0.01 \
  --batch_size 64 \
  --train_epochs 20 \
  --num_workers 10 \
  --dropout 0.0 \
  --loss mse \
  --seed $seed \
  --itr 1 | tee -a ./log/TimeLinear/ettm2/$seq_len'_'96.txt
done
done
done

for seq_len in 96
do
for beta in 0.4
do
for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types HourOfDay \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTm2.csv \
  --model_id ETTm2_$seq_len'_'192 \
  --model $model_name \
  --data ETTm2 \
  --features M \
  --freq t \
  --seq_len $seq_len \
  --pred_len 192 \
  --factor 3 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --rda 1 \
  --rdb 1 \
  --ksize 7 \
  --beta $beta \
  --learning_rate 0.01 \
  --batch_size 64 \
  --train_epochs 20 \
  --num_workers 10 \
  --dropout 0.0 \
  --loss mse \
  --seed $seed \
  --itr 1 | tee -a ./log/TimeLinear/ettm2/$seq_len'_'192.txt
done
done
done

for seq_len in 96
do
for beta in 0.4
do
for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types HourOfDay \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTm2.csv \
  --model_id ETTm2_$seq_len'_'336 \
  --model $model_name \
  --data ETTm2 \
  --features M \
  --freq t \
  --seq_len $seq_len \
  --pred_len 336 \
  --factor 3 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --rda 1 \
  --rdb 1 \
  --ksize 7 \
  --beta $beta \
  --learning_rate 0.01 \
  --batch_size 64 \
  --train_epochs 20 \
  --num_workers 10 \
  --dropout 0.0 \
  --loss mse \
  --seed $seed \
  --itr 1 | tee -a ./log/TimeLinear/ettm2/$seq_len'_'336.txt
done
done
done

for seq_len in 96
do
for beta in 0.1
do
for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types HourOfDay \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTm2.csv \
  --model_id ETTm2_$seq_len'_'720 \
  --model $model_name \
  --data ETTm2 \
  --features M \
  --freq t \
  --seq_len $seq_len \
  --pred_len 720 \
  --factor 3 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --rda 1 \
  --rdb 1 \
  --ksize 7 \
  --beta $beta \
  --learning_rate 0.01 \
  --batch_size 64 \
  --train_epochs 20 \
  --num_workers 10 \
  --dropout 0.0 \
  --loss mse \
  --seed $seed \
  --itr 1 | tee -a ./log/TimeLinear/ettm2/$seq_len'_'720.txt
done
done
done