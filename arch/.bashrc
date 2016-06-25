#
# ~/.bashrc
#

# source
# http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html

# todo
# sync dotfiles with github
# https://chase-seibert.github.io/blog/2014/11/23/dotfiles.html

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias c='clear' # Ctrl+L also
alias h='history'
alias l='ls --color=auto'
alias o='xdg-open'
alias s='search'
alias x='exit'

alias ls='ls --color=auto'
alias ne='nano'
alias vs='visual-studio-code'

# Produces the same output but with highlighting
alias diff='colordiff'

# Make mount command output human readable format
alias mount='mount | column -t'

# Stop after sending 4 packets
alias ping='ping -c 4'

# Dont delete if deleting more than 3 files at a time
alias del='rm -I --preserve-root'

# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

# Resume wget by default
alias wget='wget -c'

# Edit and Run bashrc
alias bashrc='xdg-open ~/.bashrc && source ~/.bashrc'

# Make any necessary parent directories
alias mkdir='mkdir -vp'


# Show ROM usage
alias rom='df -h | grep "/$"'

# Pretty print git log
alias gitl='git log --graph --decorate --all'

# PATH
PS1='[\u@\h \W]\$ '

# autocomplete working on gnome terminal.
# https://bbs.archlinux.org/viewtopic.php?pid=496334#p496334
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Powerline on Archlinux
# http://misctechmusings.com/powerline-on-archlinux/
if [ -f /usr/lib/python3.4/site-packages/powerline/bindings/bash/powerline.sh ]; then
    source /usr/lib/python3.4/site-packages/powerline/bindings/bash/powerline.sh
fi

# Fuck configuration
# https://github.com/nvbn/thefuck#manual-installation
eval $(thefuck --alias)

# Make path of folders and file
# http://stackoverflow.com/a/19288855
mouch () {
    if [ $# -lt 1 ]; then
        echo "Missing argument";
        return 1;
    fi

    for f in "$@"; do
        mkdir -p -- "$(dirname -- "$f")"
        touch -- "$f"
    done
}

# List contents of a directory after moving to it
# http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html#comment-180628
cdl () {
  cd "$@";
  ls --color=auto -a;
}

# Create a directory and then move into that directory
# https://www.digitalocean.com/community/tutorials/an-introduction-to-useful-bash-aliases-and-functions
mcd () {
	mkdir -p $1;
	cd $1;
}

# Show your most used linux commands
# http://linux.byexamples.com/archives/332/what-is-your-10-common-linux-commands/
histop () {
	history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | 
sort -nr | nl |  head -n10;
}

# https://github.com/zquestz/s
# https://github.com/jshrake/ddg
# http://stackoverflow.com/a/10797966
search () {
	params=$(echo "$@" | curl -Gso /dev/null -w %{url_effective} --data-urlencode @- "" | cut -c 3-)
	url=$(echo "https://duckduckgo.com/?q=$params" | rev | cut -c 4- | rev)
	# echo $url
	xdg-open $url
}

# source /home/alois/.oh-my-git/prompt.sh
