#!/usr/bin/env bash

apt-fast install -y make g++

NVM_VERSION='0.35.1'

curl -o- https://raw.githubusercontent.com/creationix/nvm/v${NVM_VERSION}/install.sh | bash && \
echo ". ~/.nvm/nvm.sh" >> ~/.zshrc

fish -lc "omf i bass nvm"

NODE_VERSION='13.1.0'

cp -f ~/.nvm/nvm.sh ~/.nvm/nvm-tmp.sh && \
echo "nvm install v${NODE_VERSION}" >> ~/.nvm/nvm-tmp.sh && \
echo "nvm alias 12 ${NODE_VERSION}" >> ~/.nvm/nvm-tmp.sh && \
echo "nvm alias default 12" >> ~/.nvm/nvm-tmp.sh && \
echo "nvm use default" >> ~/.nvm/nvm-tmp.sh && \
bash ~/.nvm/nvm-tmp.sh
rm ~/.nvm/nvm-tmp.sh && \
cp /etc/profile /etc/profile.bak && \
echo '. ~/.nvm/nvm.sh' >> /etc/profile

/bin/bash -lc 'npm i -g yarn'
/bin/bash -lc 'yarn global add yrm'
/bin/bash -lc 'yrm use taobao'
