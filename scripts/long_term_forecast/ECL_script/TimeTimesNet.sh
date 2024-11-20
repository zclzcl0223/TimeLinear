export CUDA_VISIBLE_DEVICES=1

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/TimeTimesNet" ]; then
    mkdir ./log/TimeTimesNet
fi

if [ ! -d "./log/TimeTimesNet/ecl" ]; then
    mkdir ./log/TimeTimesNet/ecl
fi

seq_len=96

model_name=TimeTimesNet


for seed in 2020 2021 2022
do
python -u run.py \
  --with_curve 0 \
  --time_feature_types HourOfDay DayOfWeek \
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
  --pred_len 96 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 321 \
  --dec_in 321 \
  --c_out 321 \
  --d_model 256 \
  --d_ff 512 \
  --top_k 5 \
  --des 'Exp' \
  --rda 1 \
  --rdb 1 \
  --ksize 7 \
  --beta 0.1 \
  --itr 1 | tee -a ./log/TimeTimesNet/ecl/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --with_curve 0 \
  --time_feature_types HourOfDay DayOfWeek \
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
  --pred_len 192 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 321 \
  --dec_in 321 \
  --c_out 321 \
  --d_model 256 \
  --d_ff 512 \
  --top_k 5 \
  --des 'Exp' \
  --rda 1 \
  --rdb 1 \
  --ksize 7 \
  --beta 0.1 \
  --itr 1 | tee -a ./log/TimeTimesNet/ecl/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --with_curve 0 \
  --time_feature_types HourOfDay DayOfWeek \
  --seed $seed \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/electricity/ \
  --data_path electricity.csv \
  --model_id ECL_96_336 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --pred_len 336 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 321 \
  --dec_in 321 \
  --c_out 321 \
  --d_model 256 \
  --d_ff 512 \
  --top_k 5 \
  --des 'Exp' \
  --rda 1 \
  --rdb 1 \
  --ksize 7 \
  --beta 0.2 \
  --itr 1 | tee -a ./log/TimeTimesNet/ecl/$seq_len.txt
done


for seed in 2020 2021 2022
do
python -u run.py \
  --with_curve 0 \
  --time_feature_types HourOfDay DayOfWeek \
  --seed $seed \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/electricity/ \
  --data_path electricity.csv \
  --model_id ECL_96_720 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --pred_len 720 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 321 \
  --dec_in 321 \
  --c_out 321 \
  --d_model 256 \
  --d_ff 512 \
  --top_k 5 \
  --des 'Exp' \
  --rda 1 \
  --rdb 1 \
  --ksize 7 \
  --beta 0.2 \
  --itr 1 | tee -a ./log/TimeTimesNet/ecl/$seq_len.txt
done
