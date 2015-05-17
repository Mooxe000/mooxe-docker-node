FROM mooxe/base:latest

MAINTAINER FooTearth "footearth@gmail.com"

USER docker
WORKDIR /home/docker

# ENV NODE_VERSION_10 0.10.38
# ENV NODE_VERSION_12 0.12.3

RUN \

  # nvm
  curl https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash && \

  # nvm - zsh support
  echo ". ~/.nvm/nvm.sh" >> ~/.zshrc && \

  # nvm - fish support
  git clone git://github.com/passcod/nvm-fish-wrapper.git ~/.config/fish/nvm-wrapper && \
  echo ". ~/.config/fish/nvm-wrapper/nvm.fish" >> ~/.config/fish/config.fish && \

  # npm
  cp -f ~/.nvm/nvm.sh ~/.nvm/nvm-tmp.sh && \
  echo "nvm install 0.12.3" >> ~/.nvm/nvm-tmp.sh && \
  echo "nvm alias 12 0.12.3" >> ~/.nvm/nvm-tmp.sh && \
  echo "nvm alias default 12" >> ~/.nvm/nvm-tmp.sh && \
  echo "nvm use default" >> ~/.nvm/nvm-tmp.sh && \
  sh ~/.nvm/nvm-tmp.sh && \
  rm ~/.nvm/nvm-tmp.sh
