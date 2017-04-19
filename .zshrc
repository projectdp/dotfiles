# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

EDITOR=vim
TERM='rxvt-256color'
PAGER=less
PROMPT=\(%m:%~\)\ %D{%r}\ %#
RPROMPT=%D{%m-%d-%Y}

setopt appendhistory
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

setopt autocd

#pushd/popd stuff
setopt auto_pushd
setopt pushd_minus
setopt pushd_silent
setopt pushd_to_home
setopt pushd_ignore_dups

setopt glob_complete
setopt nobeep

autoload -Uz compinit promptinit
compinit
promptinit

# End of lines added by compinstall
# Lines configured by zsh-newuser-install

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

#setopt extendedglob nomatch notify
bindkey -v
bindkey '^R' history-incremental-search-backward
# End of lines configured by zsh-newuser-install

alias vi=vim
alias ls='pwd; ls -al'
#alias ls='pwd; ls -al --color'
alias cls=clear
alias python='python2.7'
#alias sprunge="curl -0 -F 'sprunge=<-' http://sprunge.us"
#alias ix="curl -F 'f:1=<-' http://ix.io"
#fortune

#ftp
export PKG_PATH=ftp://mirrors.sonic.net/pub/OpenBSD/6.1/packages/amd64/
#export PKG_PATH=ftp://ftp3.usa.openbsd.org/pub/OpenBSD/6.0/packages/amd64/

#https
#export PKG_PATH=https://mirrors.sonic.net/pub/OpenBSD/6.0/packages/amd64/
#export PKG_PATH=https://ftp3.usa.openbsd.org/pub/OpenBSD/6.0/packages/amd64/
