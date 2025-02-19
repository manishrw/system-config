# src aliases
alias home="cd $HOME"
alias src="cd $HOME/src"
alias cdgh="cd $HOME/src/github"

# System aliases
alias top10="du -ah . | sort -n -r | head -n 10"  # Top 10 largest files in the current dir
alias df="df -h"  # Disk usage in human-readable form
alias free="free -m"  # Memory usage in MB
alias update="brea update"  # System update for Ubuntu/Debian
alias cls="clear && printf '\e[3J'"  # Clear terminal and buffer
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
# alias rm='rm -I --preserve-root'
# alias df="df -Tha --total"
alias du="df -Tha --total"

# Productivity aliases
alias h="history"
alias j="jobs -l"  # List all jobs
alias now="date '+%Y-%m-%d %H:%M:%S'"
alias ip="curl ifconfig.me"  # Get public IP address
alias md="mkdir -p"
alias vimrc="vim ~/.vimrc"
alias bashrc="vim ~/.bashrc"
alias zshrc="vim ~/.zshrc"
alias srczsh="source ~/.zshrc"  # Reload .zshrc
alias srcbash="source ~/.bashrc"  # Reload .bashrc
alias timer="echo 'Timer started. Stop with Ctrl+C.' && date && time read -n1"  # Simple timer

# Network aliases
alias myip="hostname -I | awk '{print $1}'"  # Get local IP
alias ports="netstat -tulanp"  # List all listening ports
alias flushdns="sudo systemd-resolve --flush-caches"  # Flush DNS cache
alias pingg="ping google.com"

# File search aliases
alias grep="grep --color=auto"
alias f="find . -name"  # Quick file search
alias rg="grep -r"  # Recursive grep
alias ff="find . -type f -name"  # Search for files
alias untar="tar -zxvf"  # Extract tar.gz files
alias cls="clear"
alias lla="ls -lhA"
alias fhere="find . -name "

# LS aliases
alias ls="ls --color=auto"  # Colorized output
alias ll="ls -lh"  # Long listing with human-readable sizes
alias la="ls -A"   # Show hidden files
alias l="ls -CF"   # Columnated listing with file type indicators
alias lt="ls -ltr" # Sort by date, most recent last
alias lS="ls -1S"  # Sort by size
alias lart="ls -1art"  # Show all files sorted by date
alias ldir="ls -l | grep ^d"  # List only directories


# Navigation aliases
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."

# System info aliases
alias sysinfo="lscpu && free -m && df -h && top -b -n 1 | grep 'Cpu(s)' && vmstat 1 2"  # System information
alias sysup="sudo systemctl start"
alias sysdown="sudo systemctl stop"
alias sysrestart="sudo systemctl restart"
alias sysreload="sudo systemctl reload"
alias sysstatus="sudo systemctl status"
alias sysenable="sudo systemctl enable"
alias sysdisable="sudo systemctl disable"
alias meminfo='free -l -t' # pass options to free
alias psmem='ps auxf | sort -nr -k 4' # get top process eating memory
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3' # get top process eating cpu
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias cpuinfo='lscpu' # Get server cpu info

# custom aliases
alias python=python3
