export CUDA_VISIBLE_DEVICES=0

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/RLinear" ]; then
    mkdir ./log/RLinear
fi

if [ ! -d "./log/RLinear/traffic" ]; then
    mkdir ./log/RLinear/traffic
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
  --root_path ./dataset/traffic/ \
  --data_path traffic.csv \
  --model_id traffic_$seq_len'_'$pred_len \
  --model $model_name \
  --data custom \
  --features M \
  --freq h \
  --seq_len $seq_len \
  --pred_len $pred_len \
  --factor 3 \
  --enc_in 862 \
  --dec_in 862 \
  --c_out 862 \
  --des 'Exp' \
  --batch_size 16 \
  --learning_rate 0.005 \
  --patience 5 \
  --train_epochs 20 \
  --num_workers 10 \
  --dropout 0 \
  --loss mse \
  --seed $seed \
  --itr 1 | tee -a ./log/RLinear/traffic/$seq_len.txt
done
done
done