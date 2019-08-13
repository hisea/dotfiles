# omf install bass
eval (starship init fish)
# tic .xterm-256color-italic.terminfo
#export TERM=xterm-256color-italic
alias be="bundle exec"
alias ci="code-insiders"
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

# Emacs Client

export EDITOR=nvim
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

#GPG
export GPG_TTY='(tty)'

# Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# export RBENV_ROOT=/usr/local/var/rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
rbenv init - | source
# eval "(rbenv init -)"

#export PATH="$HOME/.exenv/bin:$PATH"
#eval "$(exenv init -)"


#NVM
export NVM_DIR="$HOME/.nvm"
function nvm
   bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end

set -x NVM_DIR ~/.nvm
nvm use default --silent


# export JENV_ROOT=/usr/local/var/jenv
# if which jenv > /dev/null; then eval "$(jenv init -)"; fi

export GOPATH="$HOME/Code/Go"
export PATH="$GOPATH/bin:$PATH"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/platform-tools:$PATH"

# set PATH $HOME/.rbenv/bin $PATH
# set PATH $HOME/.rbenv/shims $PATH
# rbenv init - | source
# rbenv rehash >/dev/null ^&1
