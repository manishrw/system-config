# src aliases
alias home="cd $HOME"
alias src="cd $HOME/src"
alias cdgh="cd $HOME/src/github"

# System aliases
alias top10="du -ah . | sort -n -r | head -n 10"
alias df="df -h"
alias free="vm_stat | perl -ne '/page size of (\d+)/ and \$size=\$1; /Pages\s+([^:]+)[^\d]+(\d+)/ and printf(\"%-16s % 16.2f Mi\n\", \"\$1:\", \$2 * \$size / 1048576)'"
alias update="brew update"  # Changed from brea to brew
alias cls="clear && printf '\e[3J'"
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

# Productivity aliases
alias h="history"
alias j="jobs -l"  # List all jobs
alias now="date '+%Y-%m-%d %H:%M:%S'"
alias md="mkdir -p"
alias vimrc="vim ~/.vimrc"
alias bashrc="vim ~/.bashrc"
alias zshrc="vim ~/.zshrc"
alias srczsh="source ~/.zshrc"  # Reload .zshrc
alias srcbash="source ~/.bashrc"  # Reload .bashrc
alias timer="echo 'Timer started. Stop with Ctrl+C.' && date && time read -n1"  # Simple timer

# Network aliases
alias ip="curl ifconfig.me"  # Get public IP address
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{ print \$2 }'"  # Get local IP
alias ports="lsof -iTCP -sTCP:LISTEN -P -n"  # List all listening ports
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"  # Flush DNS cache
alias pingg="ping google.com"

# File search aliases
alias grep="grep --color=auto"
alias f="find . -name"  # Quick file search
alias rg="grep -r"  # Recursive grep
alias ff="find . -type f -name"  # Search for files
alias untar="tar -zxvf"  # Extract tar.gz files
alias lla="ls -lhA"
alias fhere="find . -name "

# LS aliases
# alias ls="ls --color=auto"  # Colorized output
alias ls="ls -G"  # MacOS version for colored output
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
alias sysinfo="system_profiler SPHardwareDataType && df -h && top -l 1 | grep 'CPU usage'" # System information
alias meminfo='top -l 1 -s 0 | grep PhysMem' # pass options to free
alias psmem='ps aux | sort -nr -k 4'
alias psmem10='ps aux | sort -nr -k 4 | head -10'
alias pscpu='ps aux | sort -nr -k 3'
alias pscpu10='ps aux | sort -nr -k 3 | head -10'
alias cpuinfo='sysctl -n machdep.cpu.brand_string'

# custom aliases
alias python=python3
