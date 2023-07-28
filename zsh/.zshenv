fpath=("$ZDOTDIR/prompts" "$fpath[@]")
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME=$HOME/.local/state

export HISTFILE="$XDG_STATE_HOME"/zsh/history
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export LESSHISTFILE="$XDG_STATE_HOME"/less/history
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export VIRTUAL_ENV_DISABLE_PROMPT=1
