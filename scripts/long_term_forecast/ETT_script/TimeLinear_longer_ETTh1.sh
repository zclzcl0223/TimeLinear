export CUDA_VISIBLE_DEVICES=0

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/TimeLinear" ]; then
    mkdir ./log/TimeLinear
fi

if [ ! -d "./log/TimeLinear/etth1" ]; then
    mkdir ./log/TimeLinear/etth1
fi

model_name=TimeLinear

for seq_len in 192 336 512
do
for beta in 0.5
do
for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types HourOfDay \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTh1.csv \
  --model_id ETTh1_$seq_len'_'96 \
  --model $model_name \
  --data ETTh1 \
  --features M \
  --freq h \
  --seq_len $seq_len \
  --pred_len 96 \
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
  --dropout 0.0 \
  --loss mse \
  --seed $seed \
  --itr 1 | tee -a ./log/TimeLinear/etth1/$seq_len'_'96.txt
done
done
done

for seq_len in 720
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
  --data_path ETTh1.csv \
  --model_id ETTh1_$seq_len'_'96 \
  --model $model_name \
  --data ETTh1 \
  --features M \
  --freq h \
  --seq_len $seq_len \
  --pred_len 96 \
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
  --dropout 0.0 \
  --loss mse \
  --seed $seed \
  --itr 1 | tee -a ./log/TimeLinear/etth1/$seq_len'_'96.txt
done
done
done
