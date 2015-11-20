FROM mooxe/base:latest

MAINTAINER FooTearth "footearth@gmail.com"

ENV NODE_VERSION 5.0.0

WORKDIR /root

# update
RUN aptitude update && \
    aptitude upgrade -y && \
    apt-get autoremove -y

    # nvm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash && \

    # nvm - zsh support
    echo ". ~/.nvm/nvm.sh" >> ~/.zshrc && \

    # nvm - fish support
    git clone https://github.com/passcod/nvm-fish-wrapper.git ~/.config/fish/nvm-wrapper && \
    echo ". ~/.config/fish/nvm-wrapper/nvm.fish" >> ~/.config/fish/config.fish

    # npm
RUN cp -f ~/.nvm/nvm.sh ~/.nvm/nvm-tmp.sh && \
    echo "nvm install $NODE_VERSION" >> ~/.nvm/nvm-tmp.sh && \
    echo "nvm alias 5 $NODE_VERSION" >> ~/.nvm/nvm-tmp.sh && \
    echo "nvm alias default 5" >> ~/.nvm/nvm-tmp.sh && \
    echo "nvm use default" >> ~/.nvm/nvm-tmp.sh && \
    sh ~/.nvm/nvm-tmp.sh && \
    rm ~/.nvm/nvm-tmp.sh && \

    cp /etc/profile /etc/profile.bak && \
    echo '. /root/.nvm/nvm.sh' >> /etc/profile

    # global package
RUN /bin/bash -l -c 'npm install -g cnpm --registry=https://registry.npm.taobao.org' && \
    /bin/bash -l -c 'cnpm install -g \
      coffee-script http-server supervisor nodemon forever pm2 bower gulp-cli'
