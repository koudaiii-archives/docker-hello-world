# Docker イメージは継承みたいに重ねることができる
# FROM 句はどのイメージを元にしてイメージをビルドするか記述する
FROM debian:jessie

# RUN 句は下記のようにパッケージのインストールなど構築作業に値するものを記述する
RUN apt-get update && \
    apt-get install ruby -y && \
        rm -rf /var/lib/apt/lists/* && \
            gem install bundler --no-ri --no-rdoc

# COPY 句には元のソースコードのファイル/ディレクトリをコンテナイメージの指定ディレクトリにコピーすることを記述する
COPY .  /app

# WORKDIR 句にはコンテナのデフォルトディレクトリを記述する
WORKDIR /app

RUN bundle install

# EXPOSE 句はコンテナ内のどのポートを利用するか記述する
EXPOSE 8080

# CMD 句はコンテナのデフォルト起動コマンドを記述する
CMD ["script/server"]
