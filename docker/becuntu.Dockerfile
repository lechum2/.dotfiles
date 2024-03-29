FROM ubuntu:rolling

ENV HTTP_PROXY=http://becpx-forti.res.bec.dk:80
ENV HTTPS_PROXY=http://becpx-forti.res.bec.dk:80
ENV NO_PROXY=.bec.dk
RUN echo -e '--insecure' >> .curlrc
RUN apt-get update && apt-get --assume-yes upgrade
RUN yes | unminimize
RUN apt-get install --assume-yes curl fzf git jq zsh ripgrep sl stow tree-sitter-cli wget zoxide ranger python3-neovim
RUN apt-get install --assume-yes ruby sudo iputils-ping sed grep man-db manpages manpages-dev manpages-posix manpages-posix-dev

ENV DEBIAN_FRONTEND=noninteractive

# Nodejs lts
RUN curl --insecure -o nodejs.tar.gz https://nodejs.org/dist/v20.11.1/node-v20.11.1-linux-x64.tar.gz
RUN mkdir /usr/local/lib/nodejs \
  && tar xf nodejs.tar.gz -C /usr/local/lib/nodejs/ --strip-components 1 \
  && rm nodejs.tar.gz
ENV PATH=/usr/local/lib/nodejs/bin:$PATH

# Neovim
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
RUN tar -C /opt -xzf nvim-linux64.tar.gz
ENV PATH=/opt/nvim-linux64/bin:$PATH
RUN curl --insecure 'https://ftp.nluug.nl/pub/vim/runtime/spell/pl.utf-8.spl' --create-dirs -o '/opt/nvim-linux64/share/nvim/runtime/spell/pl.utf-8.spl'

# Cleanup
RUN apt-get autoremove --assume-yes \
  && apt-get clean --assume-yes \
  && rm -rf /var/lib/apt/lists/*

ENV SF_CONTAINER_MODE true
ENV SFDX_CONTAINER_MODE true
ENV DEBIAN_FRONTEND=dialog

RUN useradd --create-home --shell /bin/zsh --groups sudo --password '$y$j9T$iVfF8t.mgu3Q4TRULkxnl1$6Uk/fsUyI1MeZCLqKvjRYidfnlxv8dzpasox422ulY2' lechu

ENV SHELL /bin/zsh
USER lechu
WORKDIR /home/lechu
RUN echo -e '--insecure' >> .curlrc
RUN git clone https://github.com/lechum2/.dotfiles.git
WORKDIR /home/lechu/.dotfiles
RUN stow neovim
RUN stow zsh
RUN stow git
RUN stow ranger
WORKDIR /home/lechu
RUN npm config set strict-ssl false
RUN npm set prefix="$HOME/.local"
RUN npm install --global yarn neovim eslint prettier prettier-plugin-apex @prettier/plugin-xml npm-groovy-lint typescript @salesforce/cli
RUN /home/lechu/.local/bin/yarn config set "strict-ssl" false
ENV PATH=/home/lechu/.local/bin:$PATH

RUN sf autocomplete
COPY sfAuthFiles/* /home/lechu/sfAuthFiles/
RUN ./.dotfiles/docker/sfRestoreOrgs.sh

COPY ./.ssh/* /home/lechu/.ssh/
RUN mkdir /home/lechu/workspace
COPY ./workspace/* /home/lechu/workspace/

RUN nvim --headless +q

ENV SHELL /bin/zsh