# use prompt
if [ -f $ZDOTDIR/.zshprompt ]; then
    source $ZDOTDIR/.zshprompt
fi
# History
setopt histignorealldups sharehistory
setopt HIST_SAVE_NO_DUPS
HISTSIZE=1000
SAVEHIST=1000
# Use emacs keybindings even if our EDITOR is set to vi
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
bindkey -v
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        source "$BASE16_SHELL/profile_helper.sh"
base16_helios
# use vi mode cursor
if [ -f $ZDOTDIR/.vimode.zsh ]; then
	source $ZDOTDIR/.vimode.zsh
fi
# use aliases
if [ -f $ZDOTDIR/.zshalias ]; then
	source $ZDOTDIR/.zshalias
fi
# use completion
if [ -f $ZDOTDIR/.zshcompletion ]; then
	source $ZDOTDIR/.zshcompletion
fi
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

