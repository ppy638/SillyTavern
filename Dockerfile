FROM node:18

# 安装 git（防止 clone 报错）
RUN apt update && apt install -y git

# 克隆 SillyTavern 源码
RUN git clone https://github.com/SillyTavern/SillyTavern.git /app

WORKDIR /app

# 创建 data 目录，防止 cookie-secret 报错
RUN mkdir -p /app/data

# 安装依赖
RUN npm install

EXPOSE 8000

# 启动 SillyTavern
CMD ["npm", "start"]
