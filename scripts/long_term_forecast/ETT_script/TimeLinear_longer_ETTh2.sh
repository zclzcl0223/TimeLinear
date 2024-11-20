export CUDA_VISIBLE_DEVICES=0

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/TimeLinear" ]; then
    mkdir ./log/TimeLinear
fi

if [ ! -d "./log/TimeLinear/etth2" ]; then
    mkdir ./log/TimeLinear/etth2
fi

model_name=TimeLinear

for seq_len in 192 336 512 720
do
for beta in 0.2
do
for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types HourOfDay \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTh2.csv \
  --model_id ETTh2_$seq_len'_'96 \
  --model $model_name \
  --data ETTh2 \
  --features M \
  --freq h \
  --seq_len $seq_len \
  --pred_len 96 \
  --factor 3 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --rda 1 \
  --rdb 1 \
  --ksize 3 \
  --beta $beta \
  --learning_rate 0.01 \
  --batch_size 128 \
  --train_epochs 20 \
  --num_workers 10 \
  --dropout 0.0 \
  --loss mse \
  --seed $seed \
  --itr 1 | tee -a ./log/TimeLinear/etth2/$seq_len'_'96.txt
done
done
done
