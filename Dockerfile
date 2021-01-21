FROM ruby:2.6.3

# 必要なパッケージのインストール
RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs           

# 作業ディレクトリの作成、設定
RUN mkdir /rails-app

#作業ディレクトリを指定している
WORKDIR /rails-app

# ホスト側（ローカル）のGemfileを追加する（ローカルのGemfileは別途事前に作成しておく）
COPY ./Gemfile /rails-app/Gemfile
COPY ./Gemfile.lock /rails-app/Gemfile.lock

# Gemfileのbundle install
RUN bundle install
COPY . /rails-app