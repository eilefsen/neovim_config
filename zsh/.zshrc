# git
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '

# Set up the prompt
function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '['`basename $VIRTUAL_ENV`'] '
}
setopt PROMPT_SUBST
# python venv
RPROMPT='%B%F{red}$(virtualenv_info)%f%b'
# time
RPROMPT+="%B%F{blue}[%T]%f%b"
# path 
PROMPT="%B%F{11}%~%f%b "
# Git
PROMPT+='%B%F{red}${vcs_info_msg_0_}%f%b'
# end of prompt
PROMPT+=$'\n'"%B$%b "

# History
setopt histignorealldups sharehistory
HISTSIZE=1000
SAVEHIST=1000

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# use aliases
if [ -f $ZDOTDIR/.zshalias ]; then
	source $ZDOTDIR/.zshalias
fi
# use completion
if [ -f $ZDOTDIR/.zshcompletion ]; then
	source $ZDOTDIR/.zshcompletion
fi

