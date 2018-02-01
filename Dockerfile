FROM mooxe/base:dev

MAINTAINER FooTearth "footearth@gmail.com"

WORKDIR /root

# update
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get autoremove -y

RUN apt-get install -y make g++

# nvm
ENV NVM_VERSION 0.33.8
# nvm - zsh spport
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v${NVM_VERSION}/install.sh | bash && \
    echo ". ~/.nvm/nvm.sh" >> ~/.zshrc

    # nvm - fish upport
RUN fish -lc "fisher edc/bass"
RUN echo "\
function nvm\n\
  bass source ~/.nvm/nvm.sh --no-use ';' nvm \$argv\n\
end" >> ~/.config/fish/config.fish

    # git clone https://github.com/passcod/nvm-fish-wrapper.git ~/.config/fish/nvm-wrapper && \
    # echo ". ~/.config/fish/nvm-wrapper/nvm.fish" >> ~/.config/fish/config.fish

# npm
ENV NODE_VERSION 9.5.0
RUN cp -f ~/.nvm/nvm.sh ~/.nvm/nvm-tmp.sh && \
    echo "nvm install v$NODE_VERSION" >> ~/.nvm/nvm-tmp.sh && \
    echo "nvm alias 9 $NODE_VERSION" >> ~/.nvm/nvm-tmp.sh && \
    echo "nvm alias default 9" >> ~/.nvm/nvm-tmp.sh && \
    echo "nvm use default" >> ~/.nvm/nvm-tmp.sh && \
    sh ~/.nvm/nvm-tmp.sh && \
    rm ~/.nvm/nvm-tmp.sh && \
    cp /etc/profile /etc/profile.bak && \
    echo '. /root/.nvm/nvm.sh' >> /etc/profile

# Yarn
RUN bash -lc "curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -" && \
    bash -lc "echo 'deb https://dl.yarnpkg.com/debian/ stable main' | tee /etc/apt/sources.list.d/yarn.list" && \
    apt-get install -y apt-transport-https

RUN apt-get update && apt-get install -y yarn
RUN /bin/bash -lc 'npm install -g yarn'

# RUN yarn config set registr https://registry.npm.taobao.org
# global package
# RUN /bin/bash -lc 'npm install -g cnpm \
    #   --registry=https://registry.npm.taobao.org'

RUN /bin/bash -lc 'yarn global add yrm'
RUN /bin/bash -lc 'yrm use taobao'

RUN /bin/bash -lc 'yarn global add npm'
RUN /bin/bash -lc 'yarn global add node-gyp'
# RUN yarn global add node-inspector
RUN /bin/bash -lc 'yarn global add pnpm npm-check'
RUN /bin/bash -lc 'yarn global add coffeescript'
RUN /bin/bash -lc 'yarn global add rollup'
RUN /bin/bash -lc 'yarn global add gulp-cli http-server'
RUN /bin/bash -lc 'yarn global add supervisor nodemon forever pm2'
RUN /bin/bash -lc 'yarn global add json-server now'
# RUN yarn global add harp
