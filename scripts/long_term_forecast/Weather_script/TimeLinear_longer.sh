export CUDA_VISIBLE_DEVICES=1

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/TimeLinear" ]; then
    mkdir ./log/TimeLinear
fi

if [ ! -d "./log/TimeLinear/weather" ]; then
    mkdir ./log/TimeLinear/weather
fi

model_name=TimeLinear

for seq_len in 192 336 512 720
do
for pred_len in 96
do
for beta in 0.6
do
for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types MinuteOfHour HourOfDay SeasonOfYear \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/weather/ \
  --data_path weather.csv \
  --model_id weather_$seq_len'_'$pred_len \
  --model $model_name \
  --data custom \
  --features M \
  --freq t \
  --seq_len $seq_len \
  --pred_len $pred_len \
  --factor 3 \
  --enc_in 21 \
  --dec_in 21 \
  --c_out 21 \
  --des 'Exp' \
  --rda 4 \
  --rdb 2 \
  --ksize 3 \
  --beta $beta \
  --learning_rate 0.005 \
  --batch_size 128 \
  --train_epochs 20 \
  --num_workers 10 \
  --dropout 0 \
  --loss mse \
  --seed $seed \
  --itr 1 | tee -a ./log/TimeLinear/weather/$seq_len'_'$pred_len.txt
done
done
done
done
