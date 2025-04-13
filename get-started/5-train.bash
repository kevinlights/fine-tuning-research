


# python -m mlx_lm lora \
#     --model ./mlx_qwen_small \
#     --data ./data \
#     --train \
#     --batch-size 1 \
#     --num-layers 4\
#     --iters 300  \
#     --fine-tune-type lora \
#     --learning-rate 1e-5 \
#     --steps-per-report 10


# 参数说明：

# --model: MLX 格式的模型路径
# --data: 训练数据目录，需包含 train.jsonl 和 valid.jsonl
# --train: 启用训练模式
# --batch-size: 批次大小，Mac 上建议保持为 1-2。 测试了 mac 大 batch 会导致内存访问模式不够优化。
# --num-layers: LoRA 层数，越小内存占用越少
# --iters: 训练轮次 开始可以尝试 300-1000测试效果
# --fine-tune-type: 使用 LoRA 微调方式
# --learning-rate: 学习率
# --steps-per-report: 每 10 步报告一次训练状态
# 训练完成后会在当前目录生成 adapters 目录，包含训练好的模型权重。



# usage: lora.py [-h] [--model MODEL] [--train] [--data DATA]
#                [--fine-tune-type {lora,dora,full}]
#                [--optimizer {adam,adamw}] [--mask-prompt]
#                [--num-layers NUM_LAYERS] [--batch-size BATCH_SIZE]
#                [--iters ITERS] [--val-batches VAL_BATCHES]
#                [--learning-rate LEARNING_RATE]
#                [--steps-per-report STEPS_PER_REPORT]
#                [--steps-per-eval STEPS_PER_EVAL]
#                [--resume-adapter-file RESUME_ADAPTER_FILE]
#                [--adapter-path ADAPTER_PATH] [--save-every SAVE_EVERY]
#                [--test] [--test-batches TEST_BATCHES]
#                [--max-seq-length MAX_SEQ_LENGTH] [-c CONFIG]
#                [--grad-checkpoint] [--seed SEED]

# LoRA or QLoRA finetuning.

# options:
#   -h, --help            show this help message and exit
#   --model MODEL         The path to the local model directory or Hugging
#                         Face repo.
#   --train               Do training
#   --data DATA           Directory with {train, valid, test}.jsonl files
#                         or the name of a Hugging Face dataset (e.g.,
#                         'mlx-community/wikisql')
#   --fine-tune-type {lora,dora,full}
#                         Type of fine-tuning to perform: lora, dora, or
#                         full.
#   --optimizer {adam,adamw}
#                         Optimizer to use for training: adam or adamw
#   --mask-prompt         Mask the prompt in the loss when training
#   --num-layers NUM_LAYERS
#                         Number of layers to fine-tune. Default is 16, use
#                         -1 for all.
#   --batch-size BATCH_SIZE
#                         Minibatch size.
#   --iters ITERS         Iterations to train for.
#   --val-batches VAL_BATCHES
#                         Number of validation batches, -1 uses the entire
#                         validation set.
#   --learning-rate LEARNING_RATE
#                         Adam learning rate.
#   --steps-per-report STEPS_PER_REPORT
#                         Number of training steps between loss reporting.
#   --steps-per-eval STEPS_PER_EVAL
#                         Number of training steps between validations.
#   --resume-adapter-file RESUME_ADAPTER_FILE
#                         Load path to resume training from the given fine-
#                         tuned weights.
#   --adapter-path ADAPTER_PATH
#                         Save/load path for the fine-tuned weights.
#   --save-every SAVE_EVERY
#                         Save the model every N iterations.
#   --test                Evaluate on the test set after training
#   --test-batches TEST_BATCHES
#                         Number of test set batches, -1 uses the entire
#                         test set.
#   --max-seq-length MAX_SEQ_LENGTH
#                         Maximum sequence length.
#   -c CONFIG, --config CONFIG
#                         A YAML configuration file with the training
#                         options
#   --grad-checkpoint     Use gradient checkpointing to reduce memory use.
#   --seed SEED           The PRNG seed


rm -rf adapters
python -m mlx_lm lora \
    --model ./mlx_qwen_small \
    --data ./data \
    --train \
    --batch-size 2 \
    --num-layers 8\
    --iters 300  \
    --fine-tune-type lora \
    --learning-rate 1e-5 \
    --adapter-path adapters \
    --steps-per-report 10

du -h -d 1

