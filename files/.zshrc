
# To ensure Kitty working when not installed
export TERM=xterm

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-z zsh-completions docker wd composer ssh-agent kubectl helm terraform)

[[ -f $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh

# To enable shell completion with Zsh
# 1Password CLI
[[ -f /usr/bin/op ]] && eval "$(op completion zsh)" && compdef _op op

[[ -f ~/.zshrc_secret ]] && source ~/.zshrc_secret
[[ -f ~/.zsh/login.zsh ]] && source ~/.zsh/login.zsh
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/starship.zsh ]] && source ~/.zsh/starship.zsh

eval "$(starship init zsh)"
