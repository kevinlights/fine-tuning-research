

question="你是谁？"


python -m mlx_lm generate \
    --model ./mlx_qwen_small \
    --prompt "<|im_start|>user\n${question}<|im_end|>" \
    --max-tokens 100 \
    --ignore-chat-template


# ==========
# user
# 我是来自阿里云的超大规模语言模型，我叫通义千问。
# ==========
# Prompt: 7 tokens, 16.200 tokens-per-sec
# Generation: 20 tokens, 98.705 tokens-per-sec
# Peak memory: 1.065 GB



# python -m mlx_lm generate \
#     --model ./mlx_qwen_small \
#     --adapter-path adapters \
#     --prompt "<|im_start|>user\n${question}<|im_end|>" \
#     --max-tokens 100 \
#     --ignore-chat-template


