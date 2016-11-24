FROM mooxe/base:latest

MAINTAINER FooTearth "footearth@gmail.com"

WORKDIR /root

# update
RUN aptitude update && \
    aptitude upgrade -y && \
    apt-get autoremove -y

RUN aptitude install -y g++

# nvm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash && \

    # nvm - zsh support
    echo ". ~/.nvm/nvm.sh" >> ~/.zshrc && \

    # nvm - fish support
    git clone https://github.com/passcod/nvm-fish-wrapper.git ~/.config/fish/nvm-wrapper && \
    echo ". ~/.config/fish/nvm-wrapper/nvm.fish" >> ~/.config/fish/config.fish

ENV NODE_VERSION 7.2.0

# npm
RUN cp -f ~/.nvm/nvm.sh ~/.nvm/nvm-tmp.sh && \
    echo "nvm install v$NODE_VERSION" >> ~/.nvm/nvm-tmp.sh && \
    echo "nvm alias 7 $NODE_VERSION" >> ~/.nvm/nvm-tmp.sh && \
    echo "nvm alias default 7" >> ~/.nvm/nvm-tmp.sh && \
    echo "nvm use default" >> ~/.nvm/nvm-tmp.sh && \
    sh ~/.nvm/nvm-tmp.sh && \
    rm ~/.nvm/nvm-tmp.sh && \

    cp /etc/profile /etc/profile.bak && \
    echo '. /root/.nvm/nvm.sh' >> /etc/profile

# global package
RUN /bin/bash -lc 'npm install -g cnpm \
      --registry=https://registry.npm.taobao.org'

RUN /bin/bash -lc 'npm install -g \
      node-gyp'

# RUN /bin/bash -lc 'npm install -g \
#       node-inspector'

RUN /bin/bash -lc 'cnpm install -g \
      pnpm npm-check'

RUN /bin/bash -lc 'cnpm install -g \
      coffee-script \
      gulp-cli http-server'

RUN /bin/bash -lc 'cnpm install -g \
      supervisor nodemon forever pm2'

RUN /bin/bash -lc 'cnpm install -g \
      harp'
