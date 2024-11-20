export CUDA_VISIBLE_DEVICES=0

model_name=GLAFFLinear

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/GLAFFLinear" ]; then
    mkdir ./log/GLAFFLinear
fi

if [ ! -d "./log/GLAFFLinear/weather" ]; then
    mkdir ./log/GLAFFLinear/weather
fi

seq_len=96

for pred_len in 96 192 336 720
do
for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types MonthOfYear DayOfMonth DayOfWeek HourOfDay MinuteOfHour SecondOfMinute \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/weather/ \
  --data_path weather.csv \
  --model_id weather_96_$pred_len \
  --model $model_name \
  --data custom \
  --features M \
  --freq t \
  --seq_len 96 \
  --pred_len $pred_len \
  --factor 3 \
  --enc_in 21 \
  --dec_in 21 \
  --c_out 21 \
  --des 'Exp' \
  --learning_rate 0.001 \
  --batch_size 64 \
  --train_epochs 20 \
  --num_workers 10 \
  --dropout 0.0 \
  --loss mse \
  --seed $seed \
  --itr 1 | tee -a ./log/GLAFFLinear/weather/$seq_len.txt
done
done
