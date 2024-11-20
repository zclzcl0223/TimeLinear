export CUDA_VISIBLE_DEVICES=1

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/TimePatchTST" ]; then
    mkdir ./log/TimePatchTST
fi

if [ ! -d "./log/TimePatchTST/weather" ]; then
    mkdir ./log/TimePatchTST/weather
fi

model_name=TimePatchTST
seq_len=96

for seed in 2020 2021 2022
do
python -u run.py \
  --with_curve 0 \
  --seed $seed \
  --time_feature_types HourOfDay SeasonOfYear \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/weather/ \
  --data_path weather.csv \
  --model_id weather_96_96 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 96 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 21 \
  --dec_in 21 \
  --c_out 21 \
  --des 'Exp' \
  --itr 1 \
  --rda 1 \
  --rdb 1 \
  --ksize 3 \
  --beta 0.1 \
  --n_heads 4 | tee -a ./log/TimePatchTST/weather/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --with_curve 0 \
  --seed $seed \
  --time_feature_types HourOfDay SeasonOfYear \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/weather/ \
  --data_path weather.csv \
  --model_id weather_96_192 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 192 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 21 \
  --dec_in 21 \
  --c_out 21 \
  --des 'Exp' \
  --itr 1 \
  --rda 1 \
  --rdb 1 \
  --ksize 3 \
  --beta 0.1 \
  --n_heads 16 | tee -a ./log/TimePatchTST/weather/$seq_len.txt
done


for seed in 2020 2021 2022
do
python -u run.py \
  --with_curve 0 \
  --seed $seed \
  --time_feature_types HourOfDay SeasonOfYear \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/weather/ \
  --data_path weather.csv \
  --model_id weather_96_336 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 336 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 21 \
  --dec_in 21 \
  --c_out 21 \
  --des 'Exp' \
  --itr 1 \
  --n_heads 4 \
  --rda 1 \
  --rdb 1 \
  --ksize 3 \
  --beta 0.1 | tee -a ./log/TimePatchTST/weather/$seq_len.txt
done


for seed in 2020 2021 2022
do
python -u run.py \
  --with_curve 0 \
  --seed $seed \
  --time_feature_types HourOfDay SeasonOfYear \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/weather/ \
  --data_path weather.csv \
  --model_id weather_96_720 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 720 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 21 \
  --dec_in 21 \
  --c_out 21 \
  --des 'Exp' \
  --itr 1 \
  --n_heads 4 \
  --rda 1 \
  --rdb 1 \
  --ksize 3 \
  --beta 0.1 | tee -a ./log/TimePatchTST/weather/$seq_len.txt
done
