FROM archlinux

ENV HTTP_PROXY=http://becpx-forti.res.bec.dk:80
ENV HTTPS_PROXY=http://becpx-forti.res.bec.dk:80
ENV NO_PROXY=.bec.dk
RUN echo -e '--insecure' >> .curlrc
RUN openssl s_client -servername archlinux.org -connect archlinux.org:443 -showcerts | awk '/-----BEGIN/{f="cert."(n++)} f{print>f} /-----END/{f=""}'
RUN for cert in cert.*; do trust anchor "$cert"; done

RUN pacman -Syu --noconfirm
RUN pacman --noconfirm -S base-devel fzf git jq make neovim nodejs-lts-iron npm openssh ripgrep rustup ruby sl stow stylua sudo tree-sitter-cli wget which yazi zoxide
RUN pacman --noconfirm -S zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions jdk17-openjdk tar unzip python-pip lynx
RUN pacman --noconfirm -S gnome-keyring libsecret man-db man-pages dbus lua-language-server rust-analyzer rustup

# salesforce cli
RUN wget https://developer.salesforce.com/media/salesforce-cli/sf/channels/stable/sf-linux-x64.tar.xz
RUN mkdir -p /opt/sf
RUN tar xJf sf-linux-x64.tar.xz -C /opt/sf --strip-components 1
RUN ln -s /opt/sf/bin/sf /usr/bin/sf

RUN useradd --create-home --shell /bin/zsh --groups wheel --password '$y$j9T$iVfF8t.mgu3Q4TRULkxnl1$6Uk/fsUyI1MeZCLqKvjRYidfnlxv8dzpasox422ulY2' lechu
RUN sed -i -- 's/root/lechu/g' /etc/sudoers

ENV SHELL /bin/zsh
USER lechu
WORKDIR /home/lechu
RUN echo -e '--insecure' >> .curlrc
RUN curl --insecure 'https://ftp.nluug.nl/pub/vim/runtime/spell/pl.utf-8.spl' --create-dirs -o '/home/lechu/.local/share/nvim/site/spell/pl.utf-8.spl'
ADD --keep-git-dir=true --chown=lechu:lechu https://github.com/lechum2/.dotfiles.git /home/lechu/.dotfiles
WORKDIR /home/lechu/.dotfiles
RUN stow neovim
RUN stow editorconfig
RUN stow zsh
RUN stow ranger

RUN git config --global user.name "Sebastian Lech"
RUN git config --global user.email "x9t@bec.dk"
RUN git config --global credential.helper store

# npm
WORKDIR /home/lechu
RUN npm config set strict-ssl false
RUN npm set prefix="$HOME/.local"
RUN ./.dotfiles/npm/install-my-globals.sh
RUN /home/lechu/.local/bin/yarn config set "strict-ssl" false
ENV PATH=/home/lechu/.local/bin:$PATH

ENV SF_CONTAINER_MODE true
ENV SFDX_CONTAINER_MODE true
ENV SF_USE_GENERIC_UNIX_KEYCHAIN true
ENV SF_DISABLE_TELEMETRY true
ENV NODE_TLS_REJECT_UNAUTHORIZED 0

RUN sf autocomplete
COPY --chown=lechu:lechu sfAuthFiles/* /home/lechu/sfAuthFiles/
RUN ./.dotfiles/docker/sfRestoreOrgs.sh

COPY --chown=lechu:lechu --chmod=600 ./.ssh/id_rsa /home/lechu/.ssh/id_rsa
COPY --chown=lechu:lechu --chmod=644 ./.ssh/id_rsa.pub /home/lechu/.ssh/id_rsa.pub
COPY --chown=lechu:lechu --chmod=644 ./.ssh/known_hosts /home/lechu/.ssh/known_hosts
RUN mkdir /home/lechu/workspace
COPY --chown=lechu:lechu ./workspace/ /home/lechu/workspace/

RUN nvim --headless +q

ENTRYPOINT [ "zsh" ]
