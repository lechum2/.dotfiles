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
RUN pacman --noconfirm -S gnome-keyring libsecret man-db man-pages dbus


# RUN echo "#%PAM-1.0" > '/etc/pam.d/login'
# RUN echo -en '\n' >> '/etc/pam.d/login'
# RUN echo 'auth       requisite    pam_nologin.so' >> '/etc/pam.d/login'
# RUN echo 'auth       include      system-local-login' >> '/etc/pam.d/login'
# RUN echo 'auth       optional     pam_gnome_keyring.so' >> '/etc/pam.d/login'
# RUN echo 'account    include      system-local-login' >> '/etc/pam.d/login'
# RUN echo 'session    include      system-local-login' >> '/etc/pam.d/login'
# RUN echo 'session    optional     pam_gnome_keyring.so auto_start' >> '/etc/pam.d/login'
# RUN echo 'password   include      system-local-login' >> '/etc/pam.d/login'
# RUN echo -en '\n' >> '/etc/pam.d/login'

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
RUN git clone https://github.com/lechum2/.dotfiles.git
WORKDIR /home/lechu/.dotfiles
RUN stow neovim
RUN stow zsh
RUN stow git
RUN stow ranger
WORKDIR /home/lechu
RUN npm config set strict-ssl false
RUN npm set prefix="$HOME/.local"
RUN npm install --global yarn neovim eslint prettier prettier-plugin-apex @prettier/plugin-xml npm-groovy-lint typescript
RUN /home/lechu/.local/bin/yarn config set "strict-ssl" false

ENV SF_CONTAINER_MODE true
ENV SFDX_CONTAINER_MODE true
ENV SF_USE_GENERIC_UNIX_KEYCHAIN false
ENV SF_DISABLE_TELEMETRY true
ENV NODE_TLS_REJECT_UNAUTHORIZED 0

RUN sf autocomplete
COPY --chown=lechu:lechu sfAuthFiles/* /home/lechu/sfAuthFiles/
# RUN ./.dotfiles/docker/sfRestoreOrgs.sh

RUN nvim --headless +q

ENV SHELL /bin/zsh