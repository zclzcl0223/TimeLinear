export CUDA_VISIBLE_DEVICES=1

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/RLinear" ]; then
    mkdir ./log/RLinear
fi

if [ ! -d "./log/RLinear/weather" ]; then
    mkdir ./log/RLinear/weather
fi

model_name=RLinear

for seq_len in 96
do
for pred_len in 96 192 336 720
do
for seed in 2020 2021 2022
do
python -u run.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/weather/ \
  --data_path weather.csv \
  --model_id weather_$seq_len'_'$pred_len \
  --model $model_name \
  --data custom \
  --features M \
  --freq t \
  --seq_len $seq_len \
  --pred_len $pred_len \
  --factor 3 \
  --enc_in 21 \
  --dec_in 21 \
  --c_out 21 \
  --des 'Exp' \
  --learning_rate 0.005 \
  --batch_size 128 \
  --train_epochs 20 \
  --num_workers 10 \
  --dropout 0 \
  --loss mse \
  --seed $seed \
  --itr 1 | tee -a ./log/RLinear/weather/$seq_len.txt
done
done
done
