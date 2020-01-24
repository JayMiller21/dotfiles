source ~/dotfiles/.environment_vars
 
# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# Editor
export EDITOR='vim'

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Bash Prompt
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\e[36m\]\W\$(parse_git_branch)>\[\e[m\] "

# Map right option to ctrl
hidutil property --set '{"UserKeyMapping":
    [{"HIDKeyboardModifierMappingSrc":0x7000000e6,
      "HIDKeyboardModifierMappingDst":0x7000000e4}]
}' >/dev/null

# Git aliases including pretty log
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Git branch completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Add Visual Studio Code (code)
export PATH="$PATH:../../Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Bundle exec
alias be="bundle exec"

# Rbenv
eval "$(rbenv init -)"

# ASDF Version management for remote retro
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

