

question="你是谁？"


python -m mlx_lm.generate \
    --model ./fuse_output \
    --prompt "<|im_start|>user\n${question}<|im_end|>" \
    --max-tokens 100 \
    --ignore-chat-template


# ==========

# <|im_start|>assistant
# 我是小智，一个乖巧可爱的AI助手，很高兴能帮助你。
# ==========
# Prompt: 7 tokens, 302.807 tokens-per-sec
# Generation: 21 tokens, 99.643 tokens-per-sec
# Peak memory: 1.071 GB



