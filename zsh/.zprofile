# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$PATH:./node_modules/.bin"
export npm_config_prefix="$HOME/.local"

# Add pip installation folder to path
export PATH=$HOME/.local/bin:$HOME/go/bin:$PATH

# add ruby gem executables to path
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
