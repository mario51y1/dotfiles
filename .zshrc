[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias ls="eza --git --icons"
alias ll="ls -la"
alias cat="bat"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mario.perez/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mario.perez/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mario.perez/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mario.perez/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(starship init zsh)"

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle :compinstall filename '/Users/mario.perez/.zshrc'

autoload -Uz compinit
autoload zmv

compinit
# End of lines added by compinstall
#
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(direnv hook zsh)"


zstyle ':completion:*' menu select
fpath+=~/.zfunc

path+=('/Users/mario.perez/.local/bin')
export TERM=xterm-256color

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000000
export SAVEHIST=1000000000
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY

export NODE_TLS_REJECT_UNAUTHORIZED=0
