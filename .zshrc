# Set Homebrew ENV
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load plugins installed using brew
FPATH="$(brew --prefix)/share/zsh-completions":$FPATH
FPATH="$(brew --prefix)/share/zsh/site-functions":$FPATH

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Set prompt to Pure
autoload -U promptinit; promptinit
prompt pure

export PURE_GIT_PULL=0
zstyle :prompt:pure:git:stash show yes

# Configure History
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

export EDITOR='nvim'

# Aliases
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias ls='eza'
alias lg='lazygit'
alias ld='lazydocker'
alias cat='bat'
alias mux='tmuxinator'

alias l='ls -lh --group-directories-first'
alias ll='ls -lah --group-directories-first'
alias grep='grep --color'
alias tree='eza --long --tree'
alias s='mux-sessionizer'

# Configure additional CLI-tools
if [[ ! -e ~/.zsh/fzf-tab ]]; then
  git clone --depth 1 https://github.com/Aloxaf/fzf-tab ~/.zsh/fzf-tab
fi

source <(fzf --zsh)
source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh
eval "$(zoxide init zsh --cmd cd)"
eval "$(mise activate zsh)"
