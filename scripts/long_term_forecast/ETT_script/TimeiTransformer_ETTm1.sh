export CUDA_VISIBLE_DEVICES=1

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/TimeiTransformer" ]; then
    mkdir ./log/TimeiTransformer
fi

if [ ! -d "./log/TimeiTransformer/ettm1" ]; then
    mkdir ./log/TimeiTransformer/ettm1
fi

model_name=TimeiTransformer
seq_len=96

for seed in 2020 2021 2022
do
python -u run.py \
  --seed $seed \
  --task_name long_term_forecast \
  --time_feature_types MinuteOfHour HourOfDay \
  --with_curve 0 \
  --is_training 1 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTm1.csv \
  --model_id ETTm1_96_96 \
  --model $model_name \
  --data ETTm1 \
  --features M \
  --seq_len 96 \
  --pred_len 96 \
  --e_layers 2 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --d_model 128 \
  --d_ff 128 \
  --rda 1 \
  --rdb 1 \
  --ksize 5 \
  --beta 0.2 \
  --itr 1 | tee -a ./log/TimeiTransformer/ettm1/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --seed $seed \
  --task_name long_term_forecast \
  --time_feature_types MinuteOfHour HourOfDay \
  --with_curve 0 \
  --is_training 1 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTm1.csv \
  --model_id ETTm1_96_192 \
  --model $model_name \
  --data ETTm1 \
  --features M \
  --seq_len 96 \
  --pred_len 192 \
  --e_layers 2 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --d_model 128 \
  --d_ff 128 \
  --rda 1 \
  --rdb 1 \
  --ksize 5 \
  --beta 0.2 \
  --itr 1 | tee -a ./log/TimeiTransformer/ettm1/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --seed $seed \
  --task_name long_term_forecast \
  --time_feature_types MinuteOfHour HourOfDay \
  --with_curve 0 \
  --is_training 1 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTm1.csv \
  --model_id ETTm1_96_336 \
  --model $model_name \
  --data ETTm1 \
  --features M \
  --seq_len 96 \
  --pred_len 336 \
  --e_layers 2 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --d_model 128 \
  --d_ff 128 \
  --rda 1 \
  --rdb 1 \
  --ksize 5 \
  --beta 0.2 \
  --itr 1 | tee -a ./log/TimeiTransformer/ettm1/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --seed $seed \
  --task_name long_term_forecast \
  --time_feature_types MinuteOfHour HourOfDay \
  --with_curve 0 \
  --is_training 1 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTm1.csv \
  --model_id ETTm1_96_720 \
  --model $model_name \
  --data ETTm1 \
  --features M \
  --seq_len 96 \
  --pred_len 720 \
  --e_layers 2 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --d_model 128 \
  --d_ff 128 \
  --rda 1 \
  --rdb 1 \
  --ksize 5 \
  --beta 0.2 \
  --itr 1 | tee -a ./log/TimeiTransformer/ettm1/$seq_len.txt
done
