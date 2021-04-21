#!/usr/bin/env bash

apt-fast install -y make g++

NVM_VERSION='0.37.0'

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh | bash && \
echo ". ~/.nvm/nvm.sh" >> ~/.zshrc

fish -lc "omf i bass nvm"

NODE_VERSION_LTS=14.16.1
NODE_VERSION=16.0.0

cp -f ~/.nvm/nvm.sh ~/.nvm/nvm-tmp.sh && \
echo "nvm install v${NODE_VERSION_LTS}" >> ~/.nvm/nvm-tmp.sh && \
echo "nvm install v${NODE_VERSION}" >> ~/.nvm/nvm-tmp.sh && \
echo "nvm alias 14 ${NODE_VERSION_LTS}" >> ~/.nvm/nvm-tmp.sh && \
echo "nvm alias 16 ${NODE_VERSION}" >> ~/.nvm/nvm-tmp.sh && \
echo "nvm alias default 14" >> ~/.nvm/nvm-tmp.sh && \
echo "nvm use default" >> ~/.nvm/nvm-tmp.sh && \
bash ~/.nvm/nvm-tmp.sh
rm ~/.nvm/nvm-tmp.sh && \
cp /etc/profile /etc/profile.bak && \
echo '. ~/.nvm/nvm.sh' >> /etc/profile

/bin/bash -lc 'npm i -g yarn'
/bin/bash -lc 'yarn global add yrm'
/bin/bash -lc 'yrm use taobao'
