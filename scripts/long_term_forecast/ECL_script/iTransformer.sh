export CUDA_VISIBLE_DEVICES=1

model_name=iTransformer

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/iTransformer" ]; then
    mkdir ./log/iTransformer
fi

if [ ! -d "./log/iTransformer/ecl" ]; then
    mkdir ./log/iTransformer/ecl
fi

seq_len=96

for seed in 2020 2021 2022
do
python -u run.py \
  --seed $seed \
  --task_name long_term_forecast \
  --time_feature_types HourOfDay DayOfWeek DayOfMonth DayOfYear \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/electricity/ \
  --data_path electricity.csv \
  --model_id ECL_96_96 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 0 \
  --pred_len 96 \
  --e_layers 3 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 321 \
  --dec_in 321 \
  --c_out 321 \
  --des 'Exp' \
  --d_model 512 \
  --d_ff 512 \
  --batch_size 16 \
  --num_workers 1 \
  --learning_rate 0.0005 \
  --itr 1 | tee -a ./log/iTransformer/ecl/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --seed $seed \
  --task_name long_term_forecast \
  --time_feature_types HourOfDay DayOfWeek DayOfMonth DayOfYear \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/electricity/ \
  --data_path electricity.csv \
  --model_id ECL_96_192 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 0 \
  --pred_len 192 \
  --e_layers 3 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 321 \
  --dec_in 321 \
  --c_out 321 \
  --des 'Exp' \
  --d_model 512 \
  --d_ff 512 \
  --batch_size 16 \
  --num_workers 1 \
  --learning_rate 0.0005 \
  --itr 1 | tee -a ./log/iTransformer/ecl/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --seed $seed \
  --task_name long_term_forecast \
  --time_feature_types HourOfDay DayOfWeek DayOfMonth DayOfYear \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/electricity/ \
  --data_path electricity.csv \
  --model_id ECL_96_336 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 0 \
  --pred_len 336 \
  --e_layers 3 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 321 \
  --dec_in 321 \
  --c_out 321 \
  --des 'Exp' \
  --d_model 512 \
  --d_ff 512 \
  --batch_size 16 \
  --num_workers 1 \
  --learning_rate 0.0005 \
  --itr 1 | tee -a ./log/iTransformer/ecl/$seq_len.txt
done

for seed in 2020 2021 2022
do
python -u run.py \
  --seed $seed \
  --task_name long_term_forecast \
  --time_feature_types HourOfDay DayOfWeek DayOfMonth DayOfYear \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/electricity/ \
  --data_path electricity.csv \
  --model_id ECL_96_720 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 0 \
  --pred_len 720 \
  --e_layers 3 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 321 \
  --dec_in 321 \
  --c_out 321 \
  --des 'Exp' \
  --d_model 512 \
  --d_ff 512 \
  --batch_size 16 \
  --num_workers 1 \
  --learning_rate 0.0005 \
  --itr 1 | tee -a ./log/iTransformer/ecl/$seq_len.txt
done
