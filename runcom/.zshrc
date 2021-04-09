export BRAZIL_WORKSPACE_DEFAULT_LAYOUT=short
#git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
# load zgen
source "${HOME}/.zgen/zgen.zsh"

zgen load zsh-users/zsh-syntax-highlighting
zgen load zsh-users/zsh-autosuggestions

# zgen load zsh-users/zsh-completions

zgen prezto editor key-bindings 'emacs'
#zgen prezto prompt theme 'powerlevel10k'

zgen prezto 'syntax-highlighting' highlighters \
  'main' \
  'brackets' \
  'pattern' \
  'root'

# zgen prezto tmux:auto-start local 'yes'
# zgen prezto '*:*' case-sensitive 'yes'
# zgen prezto '*:*' color 'yes'

zgen prezto
zgen prezto git
zgen prezto command-not-found
zgen prezto tmux
zgen prezto fasd
zgen prezto history-substring-search
zgen prezto syntax-highlighting
zgen prezto gpg
#zgen prezto linux
zgen prezto ssh
zgen prezto helper
zgen prezto node
#zgen prezto homebrew

export AUTO_TITLE_SCREENS="NO"

export PROMPT="
%{$fg[white]%}(%D %*) <%?> [%~] $program %{$fg[default]%}
%{$fg[cyan]%}%m %#%{$fg[default]%} "

export RPROMPT=

set-title() {
    echo -e "\e]0;$*\007"
}

ssh() {
    set-title $*;
    /usr/bin/ssh -2 $*;
    set-title $HOST;
}


alias vim='nvim'
export EDITOR=nvim
alias e=emacs
# tic .xterm-256color-italic.terminfo
#export TERM=xterm-256color-italic
# alias be="bundle exec"
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

export PATH=/usr/local/bin/:/home/linuxbrew/.linuxbrew/bin:$PATH
export BREW_DIR=$(brew --prefix)
 eval "$($BREW_DIR/bin/brew shellenv)"
export PATH=$BREW_DIR/bin:$PATH

# export RBENV_ROOT=/usr/local/var/rbenv
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#export PATH="$HOME/.exenv/bin:$PATH"
#eval "$(exenv init -)"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

#  export NVM_DIR="$HOME/.nvm"
#  [ -s "$BREW_DIR/opt/nvm/nvm.sh" ] && . "$BREW_DIR/opt/nvm/nvm.sh"  # This loads nvm

export GOPATH="$HOME/Code/Go"
export PATH="$GOPATH/bin:$PATH"
# export ANDROID_SDK=$HOME/Library/Android/sdk
# export ANDROID_HOME=$ANDROID_SDK
# export PATH=$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:$PATH
# export PATH=/usr/local/opt/python/libexec/bin:$PATH

# Set case-sensitivity for completion, history lookup, etc.
# zstyle ':prezto:*:*' case-sensitive 'yes'

# Rust
#
export PATH="$HOME/.cargo/bin:$PATH"

eval "$(fnm env)"
eval "$(pyenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(starship init zsh)"

