# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$HOME/dotfiles/bin:$PATH

source $HOME/dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Plugins from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle bgnotify
antigen bundle command-not-found
antigen bundle docker
antigen bundle sudo

# Zsh users plugins
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Other plugins
antigen bundle djui/alias-tips
antigen bundle unixorn/docker-helpers.zshplugin
antigen bundle greymd/docker-zsh-completion

# Load the theme.
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply

# Remove some oh-my-zsh aliases
unalias -m "_"
unalias -m "g*"

# Personal aliases
# usage: cat file | copy
alias copy='xclip -sel clip' 
alias ctrlv='xclip -selection c -o'
alias dcp='docker-compose'
alias dcp-run='docker-compose run --rm'


# Personal functions
function clone(){ git clone https://github.com/$1; }
function port() {
  ss -tulpn | grep ":$1"
}

# Turn off all beeps
unsetopt BEEP

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load local config
if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

# volta for managing node.js versions
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# nvm for managing node.js versions
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/ubuntu/.sdkman"
[[ -s "/home/ubuntu/.sdkman/bin/sdkman-init.sh" ]] && source "/home/ubuntu/.sdkman/bin/sdkman-init.sh"
