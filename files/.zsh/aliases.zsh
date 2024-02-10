# Alias
# ---
#
alias k="kubectl"
alias h="helm"
alias tf="terraform"
alias a="ansible"
alias ap="ansible-playbook"

# Editors
alias code="codium"

# Example aliases
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias gitlog="git log --abbrev-commit --color --decorate --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias myip='curl -4 icanhazip.com'
alias docker-cleanup='docker system prune --volumes -a'
alias set-php-version='sudo update-alternatives --config php'
alias kubectl-all-but-kube-system="kubectl get pods -A --field-selector=metadata.namespace!=kube-system -o wide"
#alias ls='lsd --group-dirs first'
#alias ssh="kitty +kitten ssh"

