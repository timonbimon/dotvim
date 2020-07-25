#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# add homebrewed binaries at beginning of path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# asdf, pyenv & nodenv
. $(brew --prefix asdf)/asdf.sh
# eval "$(nodenv init -)"

# add homebrew completion's
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# add completions for poetry
fpath+=~/.zfunc
autoload -Uz compinit && compinit

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# fix UTF errors
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# Add some aliases
alias ls='exa'
alias ll='exa -alh'
alias vim="nvim"

# add gcloud auto completion
if [[ -d "$(brew --prefix)/Caskroom/google-cloud-sdk" ]]; then
  source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
  source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
fi


# Zinit -> WIP
# if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
#     print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
#     command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
#     command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
#         print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
#         print -P "%F{160}▓▒░ The clone has failed.%f%b"
# fi

# source "$HOME/.zinit/bin/zinit.zsh"
# autoload -Uz _zinit
# (( ${+_comps} )) && _comps[zinit]=_zinit

# # zinit annexes
# zinit light zinit-zsh/z-a-submods


# zinit snippet PZT::modules/environment
# zinit snippet PZT::modules/terminal
# zinit snippet PZT::modules/editor
# zinit snippet PZT::modules/history
# zinit snippet PZT::modules/directory
# zinit snippet PZT::modules/spectrum
# zinit snippet PZT::modules/utility
# zinit snippet PZT::modules/completion
# zinit snippet PZT::modules/osx
# zinit snippet PZT::modules/ssh
# zinit snippet PZT::modules/git

# zinit light zsh-users/zsh-syntax-highlighting
# zinit light zsh-users/zsh-history-substring-search
# # # Don't bind these keys until ready
# bindkey -r '^[[A'
# bindkey -r '^[[B'
# function __bind_history_keys() {
#   bindkey '^[[A' history-substring-search-up
#   bindkey '^[[B' history-substring-search-down
# }
# # History substring searching
# zinit ice wait lucid atload'__bind_history_keys'
# zinit light zsh-users/zsh-history-substring-search

# # autosuggestions, trigger precmd hook upon load
# zinit ice wait lucid atload'_zsh_autosuggest_start'
# zinit light zsh-users/zsh-autosuggestions
# export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=10

# # Tab completions
# zinit ice wait lucid blockf atpull'zinit creinstall -q .'
# zinit light zsh-users/zsh-completions

# # Syntax highlighting
# zinit ice wait lucid atinit'zpcompinit; zpcdreplay'
# zinit light zdharma/fast-syntax-highlighting

# Add fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd -HI --follow --exclude ".git" --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# use jump
eval "$(jump shell)"


# use Starship prompt
eval "$(starship init zsh)"


