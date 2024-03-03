FROM archlinux
ENV HTTP_PROXY=http://becpx-forti.res.bec.dk:80
ENV HTTPS_PROXY=http://becpx-forti.res.bec.dk:80
ENV NO_PROXY=.bec.dk
RUN echo -e '--insecure' >> .curlrc
RUN openssl s_client -servername archlinux.org -connect archlinux.org:443 -showcerts | awk '/-----BEGIN/{f="cert."(n++)} f{print>f} /-----END/{f=""}'
RUN for cert in cert.*; do trust anchor "$cert"; done
RUN pacman -Syu --noconfirm
RUN pacman --noconfirm -S base-devel fzf git jq make neovim nodejs npm openssh ripgrep rustup sl stow stylua sudo tree-sitter-cli wget which yazi zoxide
RUN pacman --noconfirm -S zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions jdk17-openjdk tar

RUN wget https://developer.salesforce.com/media/salesforce-cli/sf/channels/stable/sf-linux-x64.tar.xz
RUN mkdir -p /opt/sf
RUN tar xJf sf-linux-x64.tar.xz -C /opt/sf --strip-components 1
RUN ln -s /opt/sf/bin/sf /usr/bin/sf

RUN useradd --create-home --shell /bin/zsh --groups wheel --password '$y$j9T$iVfF8t.mgu3Q4TRULkxnl1$6Uk/fsUyI1MeZCLqKvjRYidfnlxv8dzpasox422ulY2' lechu
RUN sed -i -- 's/root/lechu/g' /etc/sudoers
USER lechu
WORKDIR /home/lechu
RUN git clone https://github.com/lechum2/.dotfiles.git
WORKDIR /home/lechu/.dotfiles
RUN stow neovim
RUN stow zsh
RUN stow git
RUN stow ranger
