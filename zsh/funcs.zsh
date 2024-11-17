# Configure fzf to search through the command history file
rkl() {
  BUFFER=$(fc -l -n 1 | fzf --height 40% --query="$LBUFFER")
  CURSOR=$#BUFFER
}


create-daily-file() {
  # Check if the correct number of arguments is provided
  if [ "$#" -ne 1 ]; then
    echo "Usage: create_daily_file <file_prefix>"
    return 1
  fi

  # Get the file prefix from the argument
  local file_prefix="$1"

  # Get the current date in YYYY-MM-DD format
  local current_date
  current_date=$(date +"%Y-%m-%d")

  # Define the file name
  local file_name="${file_prefix}_${current_date}.md"

  # Create the file
  touch "$file_name"

  echo "File created: $file_name"
}


fcd() {
    local dir
    # Run fzf and capture the exit status
    dir=$(find ~/Git ~/Scratch -mindepth 1 -maxdepth 1 -type d | fzf)
    local status=$?

    # Check if fzf was cancelled
    if [ $status -eq 1 ]; then
        echo "Operation cancelled."
        return 1
    fi

    # If a directory was selected, change to that directory
    if [ -n "$dir" ]; then
        cd "$dir"
    else
        echo "No directory selected."
    fi
}

# tmux
alias ctmux='tmux new-session -s "$(basename "$PWD")"'
fza(){
    tmux attach-session -t $(tmux list-sessions -F "#{session_name}" | fzf)
}
