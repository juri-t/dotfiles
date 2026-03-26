autoload colors && colors
bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

path=(
  /opt/homebrew/bin
  /usr/local/sbin
  $path
)

export PATH

eval "$(anyenv init -)"
eval "$(/opt/homebrew/bin/brew shellenv)"
typeset -U path PATH

path=(
  /usr/local/opt/mysql-client/bin
  /opt/homebrew/opt/mysql-client@8.0/bin
  /Applications/IntelliJ\ IDEA.app/Contents/MacOS
  "$HOME/.local/bin"
  "$HOME/go/bin"
  "$HOME/.deno/bin"
  /opt/homebrew/opt/crowdin@4/bin
  $path
)

export PATH
export LSCOLORS=cxfxcxdxbxegedabagacad

[ -f "$HOME/.docker/init-zsh.sh" ] && source "$HOME/.docker/init-zsh.sh"

alias python=python3
alias pip=pip3
alias ls='ls -G'
alias ll='ls -Gl'

command -v gsed >/dev/null 2>&1 && alias sed='gsed'

[ -f /opt/homebrew/etc/bash_completion.d/git-prompt.sh ] && source /opt/homebrew/etc/bash_completion.d/git-prompt.sh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
[ -f "$HOME/.secrets.zsh" ] && source "$HOME/.secrets.zsh"

setopt PROMPT_SUBST
fpath=(~/.zsh/completion $fpath)
autoload -U compinit
compinit

PS1=$'
%{\e[38;1;32m%}%n@%m %{\e[m%} %{\e[38;1;36m%}%~%{\e[m%} %{\e[38;1;31m%}$(__git_ps1 "(%s)") %{\e[m%}
\$ '

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true

wt() {
  [ -z "$1" ] && { echo "usage: wt <branch>"; return 1; }
  git worktree add "$HOME/projects/worktree/$1" "$1" && _wt_setup_claude "$1"
}

wtb() {
  [ -z "$1" ] && { echo "usage: wtb <branch>"; return 1; }
  git worktree add -b "$1" "$HOME/projects/worktree/$1" && _wt_setup_claude "$1"
}

wtr() {
  [ -z "$1" ] && { echo "usage: wtr <branch>"; return 1; }
  git worktree remove "$HOME/projects/worktree/$1" && git branch -D "$1"
}

wcd() {
  [ -z "$1" ] && { echo "usage: wcd <branch>"; return 1; }
  cd "$HOME/projects/worktree/$1"
}

_wt_setup_claude() {
  [ -z "$1" ] && return 1

  local target_dir="$HOME/projects/worktree/$1"
  local source_claude
  source_claude="$(git rev-parse --show-toplevel 2>/dev/null)/.claude"

  [ ! -e "$source_claude" ] && return 0

  rm -rf "$target_dir/.claude"
  cp -R "$source_claude" "$target_dir/.claude"
}
