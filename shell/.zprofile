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
# }}}

# ---- locale {{{
export LC_ALL="en_US.UTF-8"
# }}}

# ---- BASH ALIASES {{{

# filesystem 
alias ll='ls -alFGgh --color="always"'
alias ..="cd .."
alias ...="cd ../.."

# python
alias bpy="bpython"
alias note="jupyter notebook"
alias lab="jupyter lab"

# better cleanup
alias cleanrun="clear; make clean; make"

# using my TODO-helper
alias make_daily="cd ~/git/tools/TODO-helper; source todo-helper/bin/activate; cd calendar; python3 src/getics.py; cd ../compose-daily; make; cd"
alias make_weekly="cd ~/git/tools/TODO-helper; source todo-helper/bin/activate; cd calendar; python3 src/getics.py; cd ../compose-weekly; make; cd"
alias import_daily="cd ~/git/tools/TODO-helper/import; make; cd -"
#}}}

# ----GIT ALIASES {{{
alias gs="git status ."
alias gc="git commit -m "
alias master-to-main="git branch -m master main; git fetch origin; git branch -u origin/main main; git remote set-head origin -a"
# }}}

# ---- LANGUAGE ALIASES {{{
#}}}

# ---- VIM/NVIM ALIASES {{{
alias nv="nvim"
#}}}

# done.
