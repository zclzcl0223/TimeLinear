export CUDA_VISIBLE_DEVICES=0

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/TimePatchTST" ]; then
    mkdir ./log/TimePatchTST
fi

if [ ! -d "./log/TimePatchTST/ecl" ]; then
    mkdir ./log/TimePatchTST/ecl
fi

model_name=TimePatchTST
seq_len=96

for seed in 2020 2021 2022
do
python -u run.py \
  --with_curve 0 \
  --time_feature_types HourOfDay DayOfWeek  \
  --seed $seed \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/electricity/ \
  --data_path electricity.csv \
  --model_id ECL_96_96 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 96 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 321 \
  --dec_in 321 \
  --c_out 321 \
  --des 'Exp' \
  --batch_size 16 \
  --rda 1 \
  --rdb 1 \
  --ksize 5 \
  --beta 0.1 \
  --learning_rate 0.001 \
  --itr 1 | tee -a ./log/TimePatchTST/ecl/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --with_curve 0 \
  --time_feature_types HourOfDay DayOfWeek  \
  --seed $seed \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/electricity/ \
  --data_path electricity.csv \
  --model_id ECL_96_192 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 192 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 321 \
  --dec_in 321 \
  --c_out 321 \
  --des 'Exp' \
  --batch_size 16 \
  --rda 1 \
  --rdb 1 \
  --ksize 5 \
  --beta 0.1 \
  --learning_rate 0.001 \
  --itr 1 | tee -a ./log/TimePatchTST/ecl/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --with_curve 0 \
  --seed $seed \
  --time_feature_types HourOfDay DayOfWeek SeasonOfYear \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/electricity/ \
  --data_path electricity.csv \
  --model_id ECL_96_336 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 336 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 321 \
  --dec_in 321 \
  --c_out 321 \
  --des 'Exp' \
  --batch_size 16 \
  --rda 1 \
  --rdb 1 \
  --ksize 5 \
  --beta 0.1 \
  --learning_rate 0.0005 \
  --itr 1 | tee -a ./log/TimePatchTST/ecl/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --with_curve 0 \
  --seed $seed \
  --time_feature_types HourOfDay DayOfWeek SeasonOfYear \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/electricity/ \
  --data_path electricity.csv \
  --model_id ECL_96_720 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 720 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 321 \
  --dec_in 321 \
  --c_out 321 \
  --des 'Exp' \
  --batch_size 16 \
  --rda 1 \
  --rdb 1 \
  --ksize 5 \
  --beta 0.1 \
  --learning_rate 0.0005 \
  --itr 1 | tee -a ./log/TimePatchTST/ecl/$seq_len.txt
done
