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

# Zsh users plugins
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Other plugins
antigen bundle djui/alias-tips
antigen bundle desyncr/auto-ls
AUTO_LS_COMMANDS=(ls '/usr/bin/git status -sb')

# Load the theme.
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply

# Remove some oh-my-zsh aliases
unalias -m "_"
unalias -m "g*"

# Set personal aliases
alias note="code ~/notebook"
alias clone="git clone https://github.com/$1"

# Turn off all beeps
unsetopt BEEP

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/ubuntu/.sdkman"
[[ -s "/home/ubuntu/.sdkman/bin/sdkman-init.sh" ]] && source "/home/ubuntu/.sdkman/bin/sdkman-init.sh"
