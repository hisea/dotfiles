export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
export BREW_DIR=$(brew --prefix)
eval "$($BREW_DIR/bin/brew shellenv)"

export GOPATH="$HOME/Code/Go"
export PATH="$GOPATH/bin:$PATH"
export PATH=.cargo/bin/:$PATH

eval "$(sheldon source)"

alias vim='nvim'
export EDITOR=nvim
alias e=emacs
alias em='open -a /Applications/Emacs.app $1'
alias et='emacs -nw $1'

#CLI Tools
#
# brew install nvim bat prettyping htop diff-so-fancy fd ncdu tldr tig
#
alias vim="nvim"
alias ping="prettyping"
alias help='tldr'
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$BREW_DIR/opt/nvm/nvm.sh" ] && . "$BREW_DIR/opt/nvm/nvm.sh"  # This loads nvm

[[ -x /opt/homebrew/bin/fnm ]] && eval "$(fnm env)"

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && { type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; } }

export PATH="/opt/homebrew/opt/scala@2.12/bin:$PATH"
[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

# Created by `pipx` on 2023-06-07 17:50:45
export PATH="$PATH:/Users/yinghaizhao/.local/bin"
