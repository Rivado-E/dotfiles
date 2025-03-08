source <(fzf --zsh)
eval "$(zoxide init --cmd j zsh)"
eval "$(starship init zsh)"
eval "$(rbenv init -)"
# eval "$(pyenv init -)"
# eval "$(starship init zsh)"
# eval "$(fnm completions --shell zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"
eval "$(luarocks path)"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Plugin history-search-multi-word loaded with investigating.
# zinit load zdharma-continuum/history-search-multi-word

# Two regular plugins loaded without investigating.
# zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
# zinit light zsh-users/zsh-autosuggestions

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

zinit load zsh-users/zsh-history-substring-search
zinit ice wait atload'_history_substring_search_config'

HISTORY_SUBSTRING_SEARCH_PREFIXED=true
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="fg=none,bg=none"
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=none,bg=none"
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true


zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# source zsh-history-substring-search.zsh
