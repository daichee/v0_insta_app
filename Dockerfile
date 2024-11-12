FROM node:18

# 必要なツールのインストール
RUN apt-get update && apt-get install -y \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Vercel CLIのインストール
RUN npm install -g vercel

# アプリケーションディレクトリを作成
WORKDIR /usr/src/app

# パッケージ関連ファイルをコピー
COPY package*.json ./

# 依存関係をインストール
RUN npm install

# アプリケーションのソースをコピー
COPY . .

# アプリケーションのポートを公開
EXPOSE 3000

# 開発サーバーを起動
CMD ["npm", "run", "dev"]