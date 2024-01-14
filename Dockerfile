# 使用官方的Python镜像作为基础镜像
FROM python:3.12-slim

# 设置工作目录
WORKDIR /app

# 安装node.js 和 npm
RUN apt-get update && \
    apt-get install -y nodejs npm && \
    rm -rf /var/lib/apt/lists/*

# 安装PM2
RUN npm install pm2 -g

# 复制项目文件到容器中（确保你有一个package.json文件和你的应用代码）
COPY . .

# 安装你的Node.js应用程序依赖项
# RUN npm install

# 如果你有Python依赖也可以在这里安装
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple


# 配置环境变量
ENV NODE_ENV production

# 容器启动时运行pm2并启动你的应用
CMD ["pm2-runtime", "start", "ecosystem.config.js"]
