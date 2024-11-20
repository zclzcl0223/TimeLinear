export CUDA_VISIBLE_DEVICES=1

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/TimeLinear" ]; then
    mkdir ./log/TimeLinear
fi

if [ ! -d "./log/TimeLinear/ettm1" ]; then
    mkdir ./log/TimeLinear/ettm1
fi

model_name=TimeLinear

for seq_len in 96
do
for beta in 0.2
do
for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types MinuteOfHour HourOfDay \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTm1.csv \
  --model_id ETTm1_$seq_len'_'96 \
  --model $model_name \
  --data ETTm1 \
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
  --batch_size 128 \
  --train_epochs 20 \
  --num_workers 10 \
  --dropout 0 \
  --loss mse \
  --seed $seed \
  --itr 1 | tee -a ./log/TimeLinear/ettm1/$seq_len'_'96.txt
done
done
done

for seq_len in 96
do
for beta in 0.7
do
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
  --ksize 5 \
  --beta $beta \
  --learning_rate 0.01 \
  --batch_size 128 \
  --train_epochs 20 \
  --num_workers 10 \
  --dropout 0 \
  --loss mse \
  --seed $seed \
  --itr 1 | tee -a ./log/TimeLinear/ettm1/$seq_len'_'192.txt
done
done
done

for seq_len in 96
do
for beta in 0.2
do
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
  --ksize 5 \
  --beta $beta \
  --learning_rate 0.01 \
  --batch_size 128 \
  --train_epochs 20 \
  --num_workers 10 \
  --dropout 0 \
  --loss mse \
  --seed $seed \
  --itr 1 | tee -a ./log/TimeLinear/ettm1/$seq_len'_'336.txt
done
done
done

for seq_len in 96
do
for beta in 0.3
do
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
  --ksize 5 \
  --beta $beta \
  --learning_rate 0.01 \
  --batch_size 128 \
  --train_epochs 20 \
  --num_workers 10 \
  --dropout 0 \
  --loss mse \
  --seed $seed \
  --itr 1 | tee -a ./log/TimeLinear/ettm1/$seq_len'_'720.txt
done
done
done
