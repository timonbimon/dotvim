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
alias j='fasd_cd'  # Changes the current working directory (not interactively).


# Add fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd -HI --follow --exclude ".git" --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# added by pipsi (https://github.com/mitsuhiko/pipsi)
export PATH="/Users/timon/.local/bin:$PATH"

# add gcloud auto completion
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# use Starship prompt
eval "$(starship init zsh)"

