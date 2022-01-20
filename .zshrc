
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####

# Set variable for Volta
VOLTA_HOME=$HOME/.volta

# Add Homebrew to path
path=('/opt/homebrew/bin' $path)

# Add Volta to path
path+=$VOLTA_HOME/bin

# Path to your oh-my-zsh installation.
export ZSH="/Users/daksh/.oh-my-zsh"

# Add the path of cloned pure prompt
fpath+=$HOME/.zsh/pure

# Key bindings and fuzzy completion for fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set name of the theme to load
ZSH_THEME=""

# Load Oh My Zsh plugins
plugins=(
  git
  brew
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
  history-substring-search
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# User configuration

# Pure prompt
# See https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
prompt pure

# Make GPG signing work correctly
export GPG_TTY=$(tty)
# You may need to manually set your language environment
export LANG=en_US.UTF-8

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}
pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# Init pyenv
eval "$(pyenv init -)"

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
