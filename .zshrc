export PATH=$PATH:~/local/bin/
export HISTFILE=~/.zsh_history
export HISTSIZE=50000
export SAVEHIST=50000

setopt prompt_subst
autoload -U promptinit
autoload -U colors && colors
promptinit
setopt completealiases
autoload -U compinit
compinit
autoload -U bashcompinit
bashcompinit
zmodload zsh/complist
setopt autocd

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

alias grep='grep --color=auto'
alias ne='nvim'
alias vim='nvim'

bindkey "^S" push-line
bindkey "^H" run-help
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

function get_pwd() {
  echo "${PWD/$HOME/~}"
}

PROMPT=`oprompt`
export MANPAGER=/usr/bin/most

eval `opam config env`
precmd () {print -Pn "\e]0;%n:%~ on %m\a"}

alias ls='ls --color=auto'
