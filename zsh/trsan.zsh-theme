#!/usr/bin/env zsh

# Depends on the following plugins
# - mailcheck

function flags() {
    local flags=""

    # Append flags
    if has_mail; then flags="$flags⚑"; fi

    if [ ! -z $flags ]; then flags="%{$fg[yellow]%}[$flags]%{$reset_color%}"; fi

    echo $flags
}

local ret_status="%(?:%{$fg_bold[green]%}⨠ :%{$fg_bold[red]%}⨠ %s)"
local user="%{$fg_bold[green]%}%n%{$reset_color%}"
local host="%{$fg_bold[green]%}@%m%{$reset_color%}"
local cwd="%{$fg_bold[blue]%}%~%{$reset_color%}"

PROMPT='${ret_status}$(flags)${user}${host}:${cwd} $(git_prompt_info)%# '
PS2='%{$fg_bold[green]%}>%{$reset_color%} '

#RPROMPT='[%*]'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}git:(%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[yellow]%})%{$fg[green]%}✔"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%})%{$fg[red]%}✗"

export LSCOLORS=ExGxFxdxCxDxDxhbadecec
LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:\
cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:\
ex=01;32:"
export LS_COLORS

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\e[01;31m'   # begin blinking
export LESS_TERMCAP_md=$'\e[01;36m'   # begin bold
export LESS_TERMCAP_me=$'\e[0m'       # end mode
export LESS_TERMCAP_se=$'\e[0m'       # end standout-mode
export LESS_TERMCAP_so=$'\e[1;44;33m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'       # end underline
export LESS_TERMCAP_us=$'\e[4;36m'    # begin underline

