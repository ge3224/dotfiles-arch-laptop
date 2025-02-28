#!/bin/zsh

if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)" > /dev/null
fi

if [ -f ~/.zsh_private ]; then
    source ~/.zsh_private
fi

ssh-add -l &>/dev/null
if [ $? -eq 1 ]; then
    [ -f ~/.ssh/id_ed25519 ] && ssh-add ~/.ssh/id_ed25519 > /dev/null 2>&1
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1

BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# History stuff
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000

unsetopt beep

# Variables
export EDITOR="nvim"
export PATH="$HOME/.local/bin":$PATH
export PATH="$PATH:$HOME/.local/bin"

alias ls='ls --color=auto'
alias vim='nvim'

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

setprompt() {
  setopt prompt_subst

  if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then 
    p_host='%F{215}%M%f'
  else
    p_host='%F{230}%M%f'
  fi

  PS1=${(j::Q)${(Z:Cn:):-$'
    %F{246}%f
    %(!.%F{167}%n%f.%F{230}%n%f)
    %F{246}@%f
    ${p_host}
    %F{246}:%f
    %F{180}%~%f
    %F{246}%f
    %(!.%F{167}%#%f.%F{166}" ">%f)
    " "
  '}}

  PS2=$'%_>'
  RPROMPT=$'${vcs_info_msg_0_}'
}

setprompt

bindkey -v
export KEYTIMEOUT=1

highlighting_tweak() {
  # ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=cyan,underline
  ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=196,underline
  ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]=fg=196,underline
  ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]=fg=196,underline
  # ZSH_HIGHLIGHT_STYLES[precommand]=fg=cyan,underline
  ZSH_HIGHLIGHT_STYLES[arg0]=fg=120
  ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=220
  ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=220
}

if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  highlighting_tweak
elif [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  . /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  highlighting_tweak
fi
