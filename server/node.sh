#!/usr/bin/env bash

apt-fast install -y make g++

NVM_VERSION='0.35.3'

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh | bash && \
echo ". ~/.nvm/nvm.sh" >> ~/.zshrc

fish -lc "omf i bass nvm"

NODE_VERSION_LTS=12.18.3
NODE_VERSION=14.9.0

cp -f ~/.nvm/nvm.sh ~/.nvm/nvm-tmp.sh && \
echo "nvm install v${NODE_VERSION_LTS}" >> ~/.nvm/nvm-tmp.sh && \
echo "nvm install v${NODE_VERSION}" >> ~/.nvm/nvm-tmp.sh && \
echo "nvm alias 12 ${NODE_VERSION_LTS}" >> ~/.nvm/nvm-tmp.sh && \
echo "nvm alias 14 ${NODE_VERSION}" >> ~/.nvm/nvm-tmp.sh && \
echo "nvm alias default 12" >> ~/.nvm/nvm-tmp.sh && \
echo "nvm use default" >> ~/.nvm/nvm-tmp.sh && \
bash ~/.nvm/nvm-tmp.sh
rm ~/.nvm/nvm-tmp.sh && \
cp /etc/profile /etc/profile.bak && \
echo '. ~/.nvm/nvm.sh' >> /etc/profile

/bin/bash -lc 'npm i -g yarn'
/bin/bash -lc 'yarn global add yrm'
/bin/bash -lc 'yrm use taobao'
