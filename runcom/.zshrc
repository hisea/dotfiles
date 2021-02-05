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



# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=/usr/local/bin/:/home/linuxbrew/.linuxbrew/bin:$PATH
export BREW_DIR=$(brew --prefix)
export PATH=$BREW_DIR/bin:$PATH

eval "$(pyenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(starship init zsh)"

