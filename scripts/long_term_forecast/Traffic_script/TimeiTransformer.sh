export CUDA_VISIBLE_DEVICES=1

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/TimeiTransformer" ]; then
    mkdir ./log/TimeiTransformer
fi

if [ ! -d "./log/TimeiTransformer/traffic" ]; then
    mkdir ./log/TimeiTransformer/traffic
fi

model_name=TimeiTransformer

for seed in 2020 2021 2022
do
python -u run.py \
  --seed $seed \
  --task_name long_term_forecast \
  --time_feature_types HourOfDay DayOfWeek \
  --with_curve 0 \
  --is_training 1 \
  --root_path ./dataset/traffic/ \
  --data_path traffic.csv \
  --model_id traffic_96_96 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 0 \
  --pred_len 96 \
  --e_layers 4 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 862 \
  --dec_in 862 \
  --c_out 862 \
  --des 'Exp' \
  --d_model 512 \
  --d_ff 512 \
  --rda 32 \
  --rdb 16 \
  --ksize 3 \
  --beta 0.9 \
  --batch_size 16 \
  --learning_rate 0.001 \
  --num_workers 1 \
  --itr 1 | tee -a ./log/TimeiTransformer/traffic/96.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --seed $seed \
  --task_name long_term_forecast \
  --time_feature_types HourOfDay DayOfWeek \
  --with_curve 0 \
  --is_training 1 \
  --root_path ./dataset/traffic/ \
  --data_path traffic.csv \
  --model_id traffic_96_192 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 0 \
  --pred_len 192 \
  --e_layers 4 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 862 \
  --dec_in 862 \
  --c_out 862 \
  --des 'Exp' \
  --d_model 512 \
  --d_ff 512 \
  --batch_size 16 \
  --learning_rate 0.001 \
  --num_workers 1 \
  --rda 32 \
  --rdb 16 \
  --ksize 3 \
  --beta 0.9 \
  --itr 1 | tee -a ./log/TimeiTransformer/traffic/96.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --seed $seed \
  --task_name long_term_forecast \
  --time_feature_types HourOfDay DayOfWeek \
  --with_curve 0 \
  --is_training 1 \
  --root_path ./dataset/traffic/ \
  --data_path traffic.csv \
  --model_id traffic_96_336 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 0 \
  --pred_len 336 \
  --e_layers 4 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 862 \
  --dec_in 862 \
  --c_out 862 \
  --des 'Exp' \
  --d_model 512 \
  --d_ff 512 \
  --batch_size 16 \
  --learning_rate 0.001 \
  --num_workers 1 \
  --rda 32 \
  --rdb 16 \
  --ksize 3 \
  --beta 0.9 \
  --itr 1 | tee -a ./log/TimeiTransformer/traffic/96.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --seed $seed \
  --task_name long_term_forecast \
  --time_feature_types HourOfDay DayOfWeek \
  --with_curve 0 \
  --is_training 1 \
  --root_path ./dataset/traffic/ \
  --data_path traffic.csv \
  --model_id traffic_96_720 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 0 \
  --pred_len 720 \
  --e_layers 4 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 862 \
  --dec_in 862 \
  --c_out 862 \
  --des 'Exp' \
  --d_model 512 \
  --d_ff 512 \
  --batch_size 16 \
  --learning_rate 0.001 \
  --num_workers 1 \
  --rda 32 \
  --rdb 16 \
  --ksize 3 \
  --beta 0.9 \
  --itr 1 | tee -a ./log/TimeiTransformer/traffic/96.txt
done
