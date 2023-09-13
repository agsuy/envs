# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

###############################
###### EXPORTS
###############################

# .local path
export PATH=$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.zsh/.oh-my-zsh"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

#Bat theme
export BAT_THEME="gruvbox-dark"

#MAN config
#Use bat as pager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

#FZF exports
# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
export FZF_CTRL_T_OPTS="--exact --preview '(highlight -O ansi -l {} 2> /dev/null || bat --color=always --style=numbers --line-range=:500 {} || tree -C {}) 2> /dev/null | head -200'"

# NVM Home
export NVM_DIR="$HOME/.nvm"

###################################
# Load external functions on .zsh

#Add custom fpath to check functions
fpath+=$HOME/.my_zfunc

#Source with autoload
autoload -U da
autoload -U drm
autoload -U drmi

ZSH_THEME="ys"

#Completion
CASE_SENSITIVE="true"

#Disable auto cd
unsetopt AUTO_CD

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# History. See 'man strftime' for details.

HIST_STAMPS="dd.mm.yyyy"
HISTFILE=~/.histfile
HISTSIZE=200000
SAVEHIST=200000

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

##################

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git
aliases
docker
copyfile
encode64
urltools
yarn
web-search
zsh-autosuggestions
zsh-syntax-highlighting
fzf-tab
)

##############################

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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
alias reload="source $HOME/.zshrc"

##############################################
########END OH MY ZSH

################################################
# Unset oh my zsh aliases
unalias drm

## Begin Z Style

########################
#Custom fzf-tab

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# same for z
zstyle ':fzf-tab:complete:z:*' fzf-preview 'exa -1 --color=always $realpath'

# basic file preview for ls (you can replace with something more sophisticated than head)
zstyle ':completion::*:ls::*' fzf-completion-opts --preview='eval head {1}'

# basic file preview for eza (you can replace with something more sophisticated than head)
zstyle ':completion::*:eza::*' fzf-completion-opts --preview='eval head {1}'

#END fzf-tab

##Extra zstyle
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=long select=0
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' use-compctl false
zstyle ':completion::complete:*' use-cache 1
zstyle :compinstall filename '/home/gedoo/.zshrc'

#Enable completion fzf tmux
zstyle ':completion:*' fzf-search-display true

autoload -Uz compinit promptinit
promptinit
#prompt gentoo
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
setopt autocd extendedglob nomatch
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

#Load fzf.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load Zoxide
eval "$(zoxide init zsh)"

#######################
#Custom Alias

# Global
alias -g cat='bat'
alias -g ez='eza'

# NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
