# {{{
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

eval "$(/opt/homebrew/bin/brew shellenv zsh)"

export GPG_TTY=$(tty)

#
# Browser
#

if [[ -z "$BROWSER" && "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

if [[ -z "$EDITOR" ]]; then
  export EDITOR='nano'
fi
if [[ -z "$VISUAL" ]]; then
  export VISUAL='nano'
fi
if [[ -z "$PAGER" ]]; then
  export PAGER='less'
fi

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  $HOME/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X to enable it.
if [[ -z "$LESS" ]]; then
  export LESS='-g -i -M -R -S -w -X -z-4'
fi

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if [[ -z "$LESSOPEN" ]] && (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi
# }}}

#
# Import from /Users/home/.zprofile
#


eval "$(/opt/homebrew/bin/brew shellenv)"
export CLICOLOR=1

PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# zsh auto-completion (for home)
source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# support {{{
alias aer="scott"
alias scott="ssh scott"
alias sc="ssh scott"
# }}}

# ---- locale {{{
export LC_ALL="en_US.UTF-8"
# }}}

# ---- BASH ALIASES {{{
# easy out
alias off="cd; tmux kill-session -t; scott-services stop; exit"

# filesystem 
alias ll='ls -alFGgh --color="always"'
alias ..="cd .."
alias ...="cd ../.."

# python
alias bpy="bpython"
alias con="conda activate toolkit"
alias note="jupyter notebook"
alias lab="jupyter lab"
alias fix_conda="conda config --set solver libmamba"

# using templates
alias cp-py="cp ~/git/training-docs/templates/sample.py ."
alias cp-m="cp ~/git/training-docs/templates/Makefile ."
alias cp-rmd="cp ~/git/training-docs/templates/sample.Rmd"

# using HRDAG project structure
alias mktask="mkdir input output src; touch Makefile"
alias cleanrun="clear; make clean; make"

# using my TODO-helper
alias make_daily="cd; con; cd ~/git/TODO-helper/calendar; python3 src/getics.py; cd ../compose-daily; make; cd"
alias make_weekly="cd; con; cd ~/git/TODO-helper/calendar; python3 src/getics.py; cd ../compose-weekly; make; cd"
alias import_daily="cd ~/git/TODO-helper/import; make; cd -"
#}}}

# ----GIT ALIASES {{{
alias gs="git status"
alias gc="git commit"
alias gA="git add -A && git status"
alias master-to-main="git branch -m master main; git fetch origin; git branch -u origin/main main; git remote set-head origin -a"

# THESE DONT WORK RN
# update gitconfig 
# from local
alias send-local-gitconf="scp ~/git/dotfiles/git/gitconfig bailey-r@scott:/git/dotfiles/git/"
# from remote
alias get-remote-gitconf="scp bailey-r@scott:/git/dotfiles/git/gitconfig ~/git/dotfiles/git/"
# }}}

# ---- LANGUAGE ALIASES {{{
#}}}

# ---- VIM/NVIM ALIASES {{{
alias nv="nvim"
#}}}

# ---- TMUX ALIASES {{{ 
alias tm-new="tmux new -s"
alias tm-a="tmux a -t"
alias tm-ls="tmux ls"
alias tm-k="tmux kill-session -t"
#alias tm-ka="tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill"
alias tm-vs="%"
alias tm-hs='"'
#}}}

# ----- FLUTTER {{{
export PATH="$PATH:Users/home/development/flutter/bin"
#}}}

# ---- PROJECT-SPECIFIC ALIASES {{{ 
alias ssh_ac1="ssh bpassmor@ac1.heinz.cmu.edu"

# training-docs
alias tr="cd ~/git/training-docs"
alias tr-update="cd ~/git/training-docs; git pull; cd -"

# PR-Km0
alias km-or="cd ~/git/PR-Km0/officer-roster"
alias km-br="cd ~/git/PR-Km0; git checkout bailey-working"
alias km-update="cd ~/git/PR-Km0; git pull; snap pull; cd -"
#}}}

# done.
