FROM mooxe/node

RUN apt install -y unzip && \
    curl -fsSL https://deno.land/x/install/install.sh | sh
RUN echo "\n\
export DENO_INSTALL=\"\$HOME/.deno\"\n\
export PATH=\"\$DENO_INSTALL/bin:\$PATH\"\
" >> $HOME/.bashrc
