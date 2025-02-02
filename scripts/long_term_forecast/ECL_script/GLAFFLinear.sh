export CUDA_VISIBLE_DEVICES=1

model_name=GLAFFLinear

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/GLAFFLinear" ]; then
    mkdir ./log/GLAFFLinear
fi

if [ ! -d "./log/GLAFFLinear/ecl" ]; then
    mkdir ./log/GLAFFLinear/ecl
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
  --root_path ./dataset/electricity/ \
  --data_path electricity.csv \
  --model_id ECL_96_$pred_len \
  --model $model_name \
  --data custom \
  --features M \
  --freq h \
  --seq_len 96 \
  --pred_len $pred_len \
  --factor 3 \
  --enc_in 321 \
  --dec_in 321 \
  --c_out 321 \
  --des 'Exp' \
  --batch_size 64 \
  --learning_rate 0.001 \
  --train_epochs 10 \
  --num_workers 10 \
  --dropout 0.0 \
  --loss mse \
  --seed $seed \
  --itr 1 | tee -a ./log/GLAFFLinear/ecl/$seq_len.txt
done
done
