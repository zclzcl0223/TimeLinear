export CUDA_VISIBLE_DEVICES=0

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/TimeLinear" ]; then
    mkdir ./log/TimeLinear
fi

if [ ! -d "./log/TimeLinear/traffic" ]; then
    mkdir ./log/TimeLinear/traffic
fi

model_name=TimeLinear

for seq_len in 96
do
for pred_len in 96 192 336 720
do
for beta in 0.3
do
for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types HourOfDay DayOfWeek \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/traffic/ \
  --data_path traffic.csv \
  --model_id traffic_$seq_len'_'$pred_len \
  --model $model_name \
  --data custom \
  --features M \
  --freq h \
  --seq_len $seq_len \
  --pred_len $pred_len \
  --factor 3 \
  --enc_in 862 \
  --dec_in 862 \
  --c_out 862 \
  --des 'Exp' \
  --rda 4 \
  --rdb 1 \
  --ksize 5 \
  --beta $beta \
  --batch_size 16 \
  --learning_rate 0.005 \
  --patience 5 \
  --train_epochs 20 \
  --num_workers 10 \
  --dropout 0 \
  --loss mse \
  --seed $seed \
  --itr 1 | tee -a ./log/TimeLinear/traffic/$seq_len'_'$pred_len.txt
done
done
done
done
