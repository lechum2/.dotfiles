FROM ubuntu:rolling

ENV HTTP_PROXY=http://becpx-forti.res.bec.dk:80
ENV HTTPS_PROXY=http://becpx-forti.res.bec.dk:80
ENV NO_PROXY=.bec.dk
RUN echo -e '--insecure' >> .curlrc
RUN apt-get update && apt-get --assume-yes upgrade
RUN apt-get install --assume-yes curl fzf git jq zsh ripgrep sl stow tree-sitter-cli wget zoxide ranger python3-neovim
RUN apt-get install --assume-yes ruby sudo

ENV DEBIAN_FRONTEND=noninteractive

RUN curl --insecure -o nodejs.tar.gz https://nodejs.org/dist/v20.11.1/node-v20.11.1-linux-x64.tar.gz
RUN mkdir /usr/local/lib/nodejs \
  && tar xf nodejs.tar.gz -C /usr/local/lib/nodejs/ --strip-components 1 \
  && rm nodejs.tar.gz
ENV PATH=/usr/local/lib/nodejs/bin:$PATH

RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
RUN tar -C /opt -xzf nvim-linux64.tar.gz
ENV PATH="$PATH:/opt/nvim-linux64/bin"

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
ENV PATH="$PATH:/home/lechu/.local/bin"

RUN sf autocomplete

RUN nvim --headless +q

ENV SHELL /bin/zsh