# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

LS_COLORS='di=1;34:fi=0:ln=31:pi=5:so=5:bd=1;34:cd=5:or=31:mi=0:ex=35:ow=1;34'

#==============================================================================
# For fedora 18
#==============================================================================
alias open="xdg-open"
alias o="xdg-open"
alias gnome-open="xdg-open"
alias x="emacs"
alias e="emacs"
alias m="make"
alias alex='python /home/student/.alex/alexrunner.py'

export EDITOR='emacs'

umask 077
