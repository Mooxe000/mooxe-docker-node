FROM mooxe/base:dev

MAINTAINER FooTearth "footearth@gmail.com"

WORKDIR /root

# update
RUN apt-fast update && \
    apt-fast upgrade -y

RUN apt-fast install -y make g++

# nvm
ENV NVM_VERSION 0.34.0
# nvm - zsh spport
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v${NVM_VERSION}/install.sh | bash && \
    echo ". ~/.nvm/nvm.sh" >> ~/.zshrc

    # nvm - fish upport
RUN fish -lc "fisher edc/bass nvm"
# RUN echo "\
# function nvm\n\
#   bass source ~/.nvm/nvm.sh --no-use ';' nvm \$argv\n\
# end" >> ~/.config/fish/config.fish

    # git clone https://github.com/passcod/nvm-fish-wrapper.git ~/.config/fish/nvm-wrapper && \
    # echo ". ~/.config/fish/nvm-wrapper/nvm.fish" >> ~/.config/fish/config.fish

# npm
ENV NODE_VERSION 11.6.0
RUN cp -f ~/.nvm/nvm.sh ~/.nvm/nvm-tmp.sh && \
    echo "nvm install v$NODE_VERSION" >> ~/.nvm/nvm-tmp.sh && \
    echo "nvm alias 10 $NODE_VERSION" >> ~/.nvm/nvm-tmp.sh && \
    echo "nvm alias default 10" >> ~/.nvm/nvm-tmp.sh && \
    echo "nvm use default" >> ~/.nvm/nvm-tmp.sh && \
    sh ~/.nvm/nvm-tmp.sh && \
    rm ~/.nvm/nvm-tmp.sh && \
    cp /etc/profile /etc/profile.bak && \
    echo '. /root/.nvm/nvm.sh' >> /etc/profile

# Yarn
RUN bash -lc "curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -" && \
    bash -lc "echo 'deb https://dl.yarnpkg.com/debian/ stable main' | tee /etc/apt/sources.list.d/yarn.list" && \
    apt-fast install -y apt-transport-https

RUN apt-fast update && apt-fast install --no-install-recommends -y yarn

RUN \
	apt-fast autoremove -y && \
	apt-fast autoclean && \
	rm -rf /var/lib/apt/lists/*

RUN /bin/bash -lc 'npm install -g yarn'

# RUN yarn config set registry https://registry.npm.taobao.org
# global package
# RUN /bin/bash -lc 'npm install -g cnpm \
    #   --registry=https://registry.npm.taobao.org'

# -- npm root -g
# -- yarn global bin
# -- yarn global dir
# NODE_PATH
# PATH

# RUN /bin/bash -lc "yarn config set prefix $(npm root -g)/../../"

# -- --global-folder
# RUN echo "--global-folder \"$(bash -lc 'npm root -g')/../\"" \
#     >> ~/.yarnrc

RUN /bin/bash -lc 'yarn global add yrm'
RUN /bin/bash -lc 'yrm use taobao'

# -- --global-folder
# RUN echo "--global-folder \"$(bash -lc 'npm root -g')/../\"" \
#     >> ~/.yarnrc

RUN /bin/bash -lc 'yarn global add npm yarn'
RUN /bin/bash -lc 'yarn global add node-gyp'

# RUN /bin/bash -lc 'yarn global add node-inspector'
# RUN /bin/bash -lc 'yarn global add pnpm npm-check'

RUN /bin/bash -lc 'yarn global add coffeescript'

# RUN /bin/bash -lc 'yarn global add rollup gulp-cli'
# RUN yarn global add harp

RUN /bin/bash -lc 'yarn global add supervisor nodemon forever pm2'
RUN /bin/bash -lc 'yarn global add serve http-server'
RUN /bin/bash -lc 'yarn global add lerna autod'

# RUN /bin/bash -lc 'yarn global add json-server'
# RUN /bin/bash -lc 'yarn global add now'
