export CUDA_VISIBLE_DEVICES=1

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/TimesNet" ]; then
    mkdir ./log/TimesNet
fi

if [ ! -d "./log/TimesNet/weather" ]; then
    mkdir ./log/TimesNet/weather
fi

seq_len=96

model_name=TimesNet

for seed in 2020 2021 2022
do
python -u run.py \
  --with_curve 0 \
  --time_feature_types HourOfDay DayOfWeek DayOfMonth DayOfYear \
  --seed $seed \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/weather/ \
  --data_path weather.csv \
  --model_id weather_96_96 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --pred_len 96 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 21 \
  --dec_in 21 \
  --c_out 21 \
  --d_model 32 \
  --d_ff 32 \
  --top_k 5 \
  --des 'Exp' \
  --itr 1 | tee -a ./log/TimesNet/weather/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --with_curve 0 \
  --time_feature_types HourOfDay DayOfWeek DayOfMonth DayOfYear \
  --seed $seed \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/weather/ \
  --data_path weather.csv \
  --model_id weather_96_192 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --pred_len 192 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 21 \
  --dec_in 21 \
  --c_out 21 \
  --d_model 32 \
  --d_ff 32 \
  --top_k 5 \
  --des 'Exp' \
  --itr 1 \
  --train_epochs 1 | tee -a ./log/TimesNet/weather/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --with_curve 0 \
  --time_feature_types HourOfDay DayOfWeek DayOfMonth DayOfYear \
  --seed $seed \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/weather/ \
  --data_path weather.csv \
  --model_id weather_96_336 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --pred_len 336 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 21 \
  --dec_in 21 \
  --c_out 21 \
  --d_model 32 \
  --d_ff 32 \
  --top_k 5 \
  --des 'Exp' \
  --itr 1 | tee -a ./log/TimesNet/weather/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --with_curve 0 \
  --time_feature_types HourOfDay DayOfWeek DayOfMonth DayOfYear \
  --seed $seed \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/weather/ \
  --data_path weather.csv \
  --model_id weather_96_720 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --pred_len 720 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 21 \
  --dec_in 21 \
  --c_out 21 \
  --d_model 32 \
  --d_ff 32 \
  --top_k 5 \
  --des 'Exp' \
  --itr 1 \
  --train_epochs 1 | tee -a ./log/TimesNet/weather/$seq_len.txt
done