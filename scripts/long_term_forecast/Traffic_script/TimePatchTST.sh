export CUDA_VISIBLE_DEVICES=1

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/TimePatchTST" ]; then
    mkdir ./log/TimePatchTST
fi

if [ ! -d "./log/TimePatchTST/traffic" ]; then
    mkdir ./log/TimePatchTST/traffic
fi

model_name=TimePatchTST
seq_len=96

for seed in 2020 2021 2022
do
python -u run.py \
  --with_curve 0 \
  --time_feature_types DayOfWeek \
  --seed $seed \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/traffic/ \
  --data_path traffic.csv \
  --model_id traffic_96_96 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 96 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 862 \
  --dec_in 862 \
  --c_out 862 \
  --d_model 512 \
  --d_ff 512 \
  --top_k 5 \
  --rda 4 \
  --rdb 1 \
  --ksize 5 \
  --beta 0.1 \
  --des 'Exp' \
  --batch_size 4 \
  --learning_rate 0.0005 \
  --itr 1 | tee -a ./log/TimePatchTST/traffic/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --with_curve 0 \
  --time_feature_types DayOfWeek \
  --seed $seed \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/traffic/ \
  --data_path traffic.csv \
  --model_id traffic_96_192 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 192 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 862 \
  --dec_in 862 \
  --c_out 862 \
  --d_model 512 \
  --d_ff 512 \
  --top_k 5 \
  --des 'Exp' \
  --rda 4 \
  --rdb 1 \
  --ksize 5 \
  --beta 0.1 \
  --batch_size 4 \
  --learning_rate 0.0005 \
  --itr 1 | tee -a ./log/TimePatchTST/traffic/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --with_curve 0 \
  --time_feature_types DayOfWeek \
  --seed $seed \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/traffic/ \
  --data_path traffic.csv \
  --model_id traffic_96_336 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 336 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 862 \
  --dec_in 862 \
  --c_out 862 \
  --d_model 512 \
  --d_ff 512 \
  --top_k 5 \
  --des 'Exp' \
  --rda 4 \
  --rdb 1 \
  --ksize 5 \
  --beta 0.1 \
  --batch_size 4 \
  --learning_rate 0.0005 \
  --itr 1 | tee -a ./log/TimePatchTST/traffic/$seq_len.txt
done


for seed in 2020 2021 2022
do
python -u run.py \
  --with_curve 0 \
  --time_feature_types DayOfWeek \
  --seed $seed \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/traffic/ \
  --data_path traffic.csv \
  --model_id traffic_96_720 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 720 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 862 \
  --dec_in 862 \
  --c_out 862 \
  --d_model 512 \
  --d_ff 512 \
  --top_k 5 \
  --des 'Exp' \
  --rda 4 \
  --rdb 1 \
  --ksize 5 \
  --beta 0.1 \
  --batch_size 4 \
  --learning_rate 0.0005 \
  --itr 1 | tee -a ./log/TimePatchTST/traffic/$seq_len.txt
done