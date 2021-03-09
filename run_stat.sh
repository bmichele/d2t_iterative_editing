#!/bin/bash

DATASET_EVAL="StatNLG"
EXPERIMENT_NAME="train_full_cpu_stat"
DATASET_PATH_EVAL="/Users/micheleb/uniData/corpus_for_michele"
VOCAB_SIZE=100
LMS_DEVICE_DECODING="cpu"
DECODE_AND_EVAL_SPLIT="test"

python3 decode_stat.py \
   --dataset "$DATASET_EVAL" \
   --experiment "$EXPERIMENT_NAME" \
   --dataset_dir "$DATASET_PATH_EVAL" \
   --vocab_size "$VOCAB_SIZE" \
   --lms_device "$LMS_DEVICE_DECODING" \
   --split "$DECODE_AND_EVAL_SPLIT" \
   --no_export
