
if ! [ -d "qwen2.5-0.5B-instruct"]; then

#安装依赖
pip install -U huggingface_hub
#设置环境变量
export HF_ENDPOINT=https://hf-mirror.com 
#下载模型，保存至qwen2.5-0.5B目录
huggingface-cli download --resume-download Qwen/Qwen2.5-0.5B-Instruct --local-dir qwen2.5-0.5B-instruct

fi

pip install mlx mlx-lm
