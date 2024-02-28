FROM archlinux
ENV HTTP_PROXY=http://becpx-forti.res.bec.dk:80
ENV HTTPS_PROXY=http://becpx-forti.res.bec.dk:80
ENV NO_PROXY=.bec.dk
RUN echo -e '--insecure' >> .curlrc
RUN pacman -Syu --noconfirm
RUN pacman --noconfirm -S base-devel fzf git jq make neovim nodejs npm openssh ripgrep rustup sl stow stylua sudo tree-sitter-cli wget which yazi zoxide zsh zsh-completions jdk17-openjdk
RUN useradd --create-home --shell /bin/zsh --groups wheel --password '$y$j9T$iVfF8t.mgu3Q4TRULkxnl1$6Uk/fsUyI1MeZCLqKvjRYidfnlxv8dzpasox422ulY2' lechu
# need to edit sodoers (replace root with lechu)
# trust anchor cert1.crt --add certs from proxy
USER lechu
WORKDIR /home/lechu