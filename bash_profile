# See following for more information: http://www.infinitered.com/blog/?p=10

# Identify OS and Machine -----------------------------------------
export OS=`uname -s | sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export OSVERSION=`uname -r`; OSVERSION=`expr "$OSVERSION" : '[^0-9]*\([0-9]*\.[0-9]*\)'`
export MACHINE=`uname -m | sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export PLATFORM="$MACHINE-$OS-$OSVERSION"
# Note, default OS is assumed to be OSX



# Path ------------------------------------------------------------
if [ "$OS" = "darwin" ] ; then
  export PATH=/opt/local/bin:/opt/local/sbin:$PATH  # OS-X Specific, with MacPorts and MySQL installed
  #export PATH=/opt/local/bin:/opt/local/sbin:$PATH  # OS-X Specific, with MacPorts installed
fi

if [ -d ~/bin ]; then
	export PATH=~/bin:$PATH  # add your bin folder to the path, if you have it.  It's a good place to add all your scripts
fi

if [ -d ~/cl/bin ]; then
	export PATH=~/cl/bin:$PATH  # add your bin folder to the path, if you have it
fi



# Load in .bashrc -------------------------------------------------
source ~/.bashrc



# Hello Messsage --------------------------------------------------
echo -e "Kernel Information: " `uname -smr`
echo -e "`bash --version`"
echo -ne "Uptime: "; uptime
echo -ne "Server time is: "; date



# Notes: ----------------------------------------------------------
# When you start an interactive shell (log in, open terminal or iTerm in OS X, 
# or create a new tab in iTerm) the following files are read and run, in this order:
#     profile
#     bashrc
#     .bash_profile
#     .bashrc (only because this file is run (sourced) in .bash_profile)
#
# When an interactive shell, that is not a login shell, is started 
# (when you run "bash" from inside a shell, or when you start a shell in 
# xwindows [xterm/gnome-terminal/etc] ) the following files are read and executed, 
# in this order:
#     bashrc
#     .bashrc

# setColor() {
#   osascript -e "tell application \"iTerm\"
#     set current_terminal to (current terminal)
#     tell current_terminal
#       set current_session to (current session)
#       tell current_session
#       set background color to \"black\"
#       set cursor color to \"white\"
#       set foreground color to \"white\"
#     end tell
#   end tell
# end tell"
# }
# ## now invoke the function, and clear the screen 
# setColor
# clear
# 

##
# Your previous /Users/ryan/.bash_profile file was backed up as /Users/ryan/.bash_profile.macports-saved_2015-02-26_at_11:29:06
##

# MacPorts Installer addition on 2015-02-26_at_11:29:06: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# OPAM configuration
. /Users/ryan/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

export PATH=":~/j64-803/bin/:$PATH"

# added by Anaconda2 4.0.0 installer
export PATH="//anaconda/bin:$PATH"
