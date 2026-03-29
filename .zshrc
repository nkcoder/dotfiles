# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions autojump zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.

# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-25.jdk/Contents/Home
export PATH="$HOME/.cargo:/opt/homebrew/bin:$HOME/.npm-global/bin:$HOME/go/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Add Homebrew completions path if it exists
if [ -d /opt/homebrew/share/zsh/site-functions ]; then
    # Remove the broken _brew_services symlink if it exists
    if [ -L /opt/homebrew/share/zsh/site-functions/_brew_services ] && [ ! -e /opt/homebrew/share/zsh/site-functions/_brew_services ]; then
        rm -f /opt/homebrew/share/zsh/site-functions/_brew_services
    fi
    fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
fi

# Initialize completions only once after everything is set
autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit

# Run compinit with -i flag to ignore insecure files/directories
compinit -i

# Terraform completion
complete -o nospace -C /opt/homebrew/bin/terraform terraform

tf() {
    terraform "$@"
}

# Always use thin vertical beam at shell prompt
precmd() {
  echo -ne "\e[6 q"
}

# Alias
alias pm="pulumi"
alias kc="kubectl"
alias mk="minikube"
alias python='python3'
alias lzg='lazygit'
alias vim='nvim'
alias v="nvim"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# NeoVim (LazyVim), AI
[ -f ~/.zshrc.secrets ] && source ~/.zshrc.secrets

export EDITOR=nvim

# Added by Antigravity
export PATH="/Users/jasmine/.antigravity/antigravity/bin:$PATH"

# bun completions
[ -s "/Users/jasmine/.bun/_bun" ] && source "/Users/jasmine/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

. "$HOME/.local/bin/env"
