#!/usr/bin/env bash

apt-fast install -y make g++

NVM_VERSION='0.34.0'

curl -o- https://raw.githubusercontent.com/creationix/nvm/v${NVM_VERSION}/install.sh | bash && \
echo ". ~/.nvm/nvm.sh" >> ~/.zshrc

fish -lc "omf install edc/bass nvm"

NODE_VERSION='12.5.0'

cp -f ~/.nvm/nvm.sh ~/.nvm/nvm-tmp.sh && \
echo "nvm install v${NODE_VERSION}" >> ~/.nvm/nvm-tmp.sh && \
echo "nvm alias 12 ${NODE_VERSION}" >> ~/.nvm/nvm-tmp.sh && \
echo "nvm alias default 12" >> ~/.nvm/nvm-tmp.sh && \
echo "nvm use default" >> ~/.nvm/nvm-tmp.sh && \
sh ~/.nvm/nvm-tmp.sh && \
rm ~/.nvm/nvm-tmp.sh && \
cp /etc/profile /etc/profile.bak && \
echo '. /root/.nvm/nvm.sh' >> /etc/profile
