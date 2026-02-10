
# To ensure Kitty working when not installed
export TERM=xterm-256color
export EDITOR=vim

# Allow me to use ctrl-E and ctrl-A in pipenv shell environments
set -o emacs

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"



# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-z docker wd composer ssh-agent kubectl helm terraform)

fpath+="${ZSH_CUSTOM:-"$ZSH/custom"}/plugins/zsh-completions/src"
source "$HOME/.oh-my-zsh/oh-my-zsh.sh"

#[[ -f $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh

[[ -f ~/.zshrc_secret ]] && source ~/.zshrc_secret
[[ -f ~/.zsh/login.zsh ]] && source ~/.zsh/login.zsh
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/aliases_private.zsh ]] && source ~/.zsh/aliases_private.zsh
[[ -f ~/.zsh/starship.zsh ]] && source ~/.zsh/starship.zsh

eval "$(starship init zsh)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH:$HOME/bin:$HOME/go/bin:$HOME/.config/composer/vendor/bin"
#eval "$(oh-my-posh init zsh)"

export typo3DatabaseName='crawler'
export typo3DatabaseHost='127.0.0.1'
export typo3DatabaseUsername='root'
export typo3DatabasePassword='root'

function XdebugOff() {
    export XDEBUG_SESSION=xdebug_is_great
    export XDEBUG_MODE=off
}

function XdebugOn() {
    export XDEBUG_SESSION=xdebug_is_great
    export XDEBUG_MODE=debug
}
