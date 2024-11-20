export CUDA_VISIBLE_DEVICES=0

if [ ! -d "./log" ]; then
    mkdir ./log
fi

if [ ! -d "./log/TimeLinear" ]; then
    mkdir ./log/TimeLinear
fi

if [ ! -d "./log/TimeLinear/ecl" ]; then
    mkdir ./log/TimeLinear/ecl
fi
model_name=TimeLinear


for seq_len in 192 336 512
do
for pred_len in 96
do
for beta in 0.1
do
for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types HourOfDay DayOfWeek SeasonOfYear \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/electricity/ \
  --data_path electricity.csv \
  --model_id ECL_$seq_len'_'$pred_len \
  --model $model_name \
  --data custom \
  --features M \
  --freq h \
  --seq_len $seq_len \
  --pred_len $pred_len \
  --factor 3 \
  --enc_in 321 \
  --dec_in 321 \
  --c_out 321 \
  --des 'Exp' \
  --rda 8 \
  --rdb 1 \
  --ksize 5 \
  --beta $beta \
  --learning_rate 0.01 \
  --batch_size 16 \
  --train_epochs 20 \
  --num_workers 10 \
  --dropout 0.0 \
  --loss mse \
  --seed $seed \
  --itr 1 | tee -a ./log/TimeLinear/ecl/$seq_len'_'$pred_len.txt
done
done
done
done

seq_len=720

for pred_len in 96
do
for beta in 0.1
do
for seed in 2020 2021 2022
do
python -u run.py \
  --time_feature_types HourOfDay DayOfWeek SeasonOfYear \
  --task_name long_term_forecast \
  --is_training 1 \
  --with_curve 0 \
  --root_path ./dataset/electricity/ \
  --data_path electricity.csv \
  --model_id ECL_$seq_len'_'$pred_len \
  --model $model_name \
  --data custom \
  --features M \
  --freq h \
  --seq_len $seq_len \
  --pred_len $pred_len \
  --factor 3 \
  --enc_in 321 \
  --dec_in 321 \
  --c_out 321 \
  --des 'Exp' \
  --rda 8 \
  --rdb 1 \
  --ksize 5 \
  --beta $beta \
  --learning_rate 0.005 \
  --batch_size 16 \
  --train_epochs 20 \
  --num_workers 10 \
  --dropout 0.0 \
  --loss mse \
  --seed $seed \
  --itr 1 | tee -a ./log/TimeLinear/ecl/$seq_len'_'$pred_len.txt
done
done
done
