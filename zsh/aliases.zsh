# ----------------------------
# Editor Shortcuts
# ----------------------------

alias e="nvim"
alias v="vim"
alias nv="nvim"
alias zshconfig="nv ~/.zshrc"

# ----------------------------
# System Navigation and Directory Management
# ----------------------------
alias ..='cd ../'
alias ...='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias mkcd='mkdir -p "$1" && cd "$1"'
alias md='mkdir -p'

# ----------------------------
# System and File Management
# ----------------------------
alias df='df -h'
alias du='du -sh'
# alias ls="ls --color"
alias ls="exa"
alias lt="exa --tree"
alias nls="exa --icons"
alias n3="exa --tree --icons"
alias lsa='ls -lah'  # Long format with human-readable sizes
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
alias refresh="source ~/.zshrc"
alias c="clear"
alias rd='rmdir'
alias cp='cp'

# ----------------------------
# Network and SSH
# ----------------------------
alias ssh='TERM=xterm-256color ssh'
alias cszar="ssh redah@login.zaratan.umd.edu"

# ----------------------------
# Git Commands
# ----------------------------
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'

# ----------------------------
# Search and Find
# ----------------------------
alias grep='grep --color=auto'
alias egrep='grep -E --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias fgrep='grep -F --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias afind='ack -il'
alias f='find . -type f -name'

# ----------------------------
# System Utilities and Updates
# ----------------------------
alias update='sudo apt update && sudo apt upgrade'
alias please="sudo"
alias _='sudo'
alias hms="home-manager switch"
alias fix_stty='stty sane'
alias fix_term='echo -e "\033c"'

# ----------------------------
# Development Environment
# ----------------------------
alias devshell="nix develop -c $SHELL"
alias avenv="source .venv/bin/activate"
alias ctmux='tmux new-session -s "$(basename "$PWD")"'

# ----------------------------
# Command Line Customization and Shortcuts
# ----------------------------
alias cic='bind "set completion-ignore-case on"'
alias path='echo -e ${PATH//:/\\n}'
alias src='source ~/.zshrc'
alias please='sudo'
alias show_options='shopt'

# ----------------------------
# Miscellaneous
# ----------------------------
alias ff="fastfetch"
alias bat="bat --theme gruvbox-dark"
alias brightdown="sudo brightnessctl set 10%-"
alias brightup="sudo brightnessctl set +10%"
alias wget='wget -c'
alias open="xdg-open"
alias xzegrep='xzegrep --color=auto'
alias xzfgrep='xzfgrep --color=auto'
alias xzgrep='xzgrep --color=auto'
alias zegrep='zegrep --color=auto'
alias zfgrep='zfgrep --color=auto'
alias zgrep='zgrep --color=auto'

# ----------------------------
# Basic operations with verbosity 
# ----------------------------
alias cp='cp -iv'       # Interactive and verbose
alias mv='mv -iv'       # Interactive and verbose
alias rm='rm -iv'       # Interactive and verbose
alias ln='ln -v'        # Verbose for symbolic links

# ----------------------------
# mkdir with parents and verbosity
# ----------------------------
alias mkdir='mkdir -pv' # Create parent directories as needed, verbose

# ----------------------------
# chmod/chown with verbosity
# ----------------------------
alias chmod='chmod -v'  # Verbose mode for permissions changes
alias chown='chown -v'  # Verbose mode for ownership changes

# ----------------------------
# rsync with progress
# ----------------------------
alias rsync='rsync -vh --progress'  # Verbose and human-readable with progress

# ----------------------------
# Directory operations
# ----------------------------
alias cp-r='cp -irv'    # Recursive copy with interaction and verbosity
alias rm-r='rm -irv'    # Recursive removal with interaction and verbosity
alias mkdir-p='mkdir -pv' # Create with parents and show what was created

# ----------------------------
# Optional: Safe operations (backup before overwriting)
# ----------------------------
alias cp-safe='cp -iv --backup=numbered'  # Create numbered backups of existing files
alias mv-safe='mv -iv --backup=numbered'  # Create numbered backups before moving

# ----------------------------
# Optional: Additional useful commands
# ----------------------------
alias duf='du -sh *'     # Show size of files and directories in current directory
alias dfh='df -h'        # Show disk space in human-readable format
alias tree='tree -C'     # Show directory structure with color
