# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Show info in color
alias grep='grep --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Directory listings
alias ll='ls -al'

# Readable path
alias lspath='echo $PATH | tr -s ":" "\n"'

