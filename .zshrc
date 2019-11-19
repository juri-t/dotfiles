# コマンドのエイリアス
alias ls='ls -G'
alias ll='ls -Gl'
alias sed='gsed'

source /usr/local/Cellar/git/2.12.2/etc/bash_completion.d/git-prompt.sh
setopt PROMPT_SUBST

autoload colors && colors
autoload -Uz compinit && compinit

# vim風キーバインド
bindkey -v

PS1=$'
%{\e[38;1;32m%}%n@%m %{\e[m%} %{\e[38;1;36m%}%~%{\e[m%} %{\e[38;1;31m%}$(__git_ps1 "(%s)") %{\e[m%}
\$ '

GIT_PS1_SHOWDIRTYSTATE=true

