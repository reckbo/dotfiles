export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="[\u@\h] \[$txtgrn\]\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

alias reloadbash='source ~/.bashrc'

# Colors ----------------------------------------------------------
export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1 

if [ "$OS" = "linux" ] ; then
  alias ls='ls --color=auto' # For linux, etc
  # ls colors, see: http://www.linux-sxs.org/housekeeping/lscolors.html
  export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rb=90'  #LS_COLORS is not supported by the default ls command in OS-X
else
  alias ls='ls -G'  # OS-X SPECIFIC - the -G command in OS-X is for colors, in Linux it's no groups
fi


# Misc -------------------------------------------------------------
shopt -s checkwinsize # After each command, checks the windows size and changes lines and columns

# bash completion settings (actually, these are readline settings)
bind "set completion-ignore-case on" # note: bind used instead of sticking these in .inputrc
bind "set bell-style none" # no bell
bind "set show-all-if-ambiguous On" # show list automatically, without double tab

# Turn on advanced bash completion if the file exists 
# Get it here: http://www.caliban.org/bash/index.shtml#completion) or 
# on OSX: sudo port install bash-completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
if [ -f /opt/local/etc/bash_completion ]; then
	. /opt/local/etc/bash_completion
fi

# Use vi command mode
#bind "set editing-mode vi"
set -o vi
#bind -m vi-command -r 'v'

# git completion
source ~/dotfiles/git-completion.bash

# Navigation -------------------------------------------------------
alias ..='cd ..'
alias ...='cd .. ; cd ..'
cl() { cd $1; ls -la; } 

# I got the following from, and mod'd it: http://www.macosxhints.com/article.php?story=20020716005123797
#    The following aliases (save & show) are for saving frequently used directories
#    You can save a directory using an abbreviation of your choosing. Eg. save ms
#    You can subsequently move to one of the saved directories by using cd with
#    the abbreviation you chose. Eg. cd ms  (Note that no '$' is necessary.)
if [ ! -f ~/.dirs ]; then  # if doesn't exist, create it
  touch ~/.dirs
fi

alias show='cat ~/.dirs'
save (){
  command sed "/!$/d" ~/.dirs > ~/.dirs1; \mv ~/.dirs1 ~/.dirs; echo "$@"=\"`pwd`\" >> ~/.dirs; source ~/.dirs ; 
}  #"
source ~/.dirs  # Initialization for the above 'save' facility: source the .sdirs file 
shopt -s cdable_vars # set the bash option so that no '$' is required when using the above facility


# Editors ----------------------------------------------------------
export EDITOR='vim'  #Command line
export GIT_EDITOR='vim'

# Other aliases ----------------------------------------------------
alias ll='ls -hl'
alias l='ls -hl'
alias la='ls -a'
alias lla='ls -lah'

# Search
alias g='grep -i'  # Case insensitive grep
gns(){ # Case insensitive, excluding svn folders
  find . -path '*/.svn' -prune -o -type f -print0 | xargs -0 grep -I -n -e "$1"
}
alias f='find . -iname'

# Misc
alias ducks='du -cksh * | sort -rn|head -11' # Lists folders and files sizes in the current folder

if [ "$OS" = "linux" ] ; then
	alias processes_all='ps -aulx'
else
	alias top='top -o cpu' # os x
fi

alias systail='tail -f /var/log/system.log'
alias m='more'
alias df='df -h' # Show disk usage

# Shows most used commands, cool script I got this from: http://lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"
alias untar="tar xvzf"
alias cp_folder="cp -Rpv" #copies folder and all sub files and folders, preserving security and dates

# Bring in the other files ----------------------------------------------------
if [ -f ~/.bashrc_local ]; then
	source ~/.bashrc_local
fi
