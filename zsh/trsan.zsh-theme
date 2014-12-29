#!/usr/bin/env zsh

# Theme depends on the following plugins
# - mailcheck

function _host_color() {
    local color=${OTHER_HOSTS_COLOR}

    if [[ ${PRIVATE_HOSTS[(r)$SHORT_HOST]} == $SHORT_HOST ]]; then
        color=${PRIVATE_HOSTS_COLOR}
    elif [[ ${DEV_HOSTS[(r)$SHORT_HOST]} == $SHORT_HOST ]]; then
        color=${DEV_HOSTS_COLOR}
    elif [[ ${PROD_HOSTS[(r)$SHORT_HOST]} == $SHORT_HOST ]]; then
        color=${PROD_HOSTS_COLOR}
    fi

    echo $color;
}

function flags() {
    local flags=""

    # Append flags
    if has_mail; then flags="$flags⚑"; fi

    if [ ! -z $flags ]; then flags="%{$fg[yellow]%}[$flags]%{$reset_color%}"; fi

    echo $flags
}

local ret_status="%(?:%{$fg[green]%}⨠ :%{$fg[red]%}⨠ %s)"
local host_color=$(_host_color)
local user_color=$host_color
if [[  "$UID" == 0 ]]; then; user_color="red"; fi
local user="%{$fg[$user_color]%}%n%{$reset_color%}"
local host="%{$fg[$host_color]%}@%m%{$reset_color%}"
local cwd="%{$fg[blue]%}%~%{$reset_color%}"

PROMPT='${ret_status}$(flags)${user}${host}:${cwd} $(git_prompt_info)%# '
PS2='%{$fg[green]%}>%{$reset_color%} '

#RPROMPT='[%*]'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}git:(%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[yellow]%})%{$fg[green]%}✔"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%})%{$fg[red]%}✗"

export LSCOLORS="exfxgxcxbxdxdxhbabhebe"
LS_COLORS="di=34:ln=35:so=36:pi=32:ex=31:bd=33:cd=33:su=37;41:sg=41:tw=37;44:ow=31;44:"
LS_COLORS="${LS_COLORS}or=0:mi=31:st=34:"

export LS_COLORS

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\e[01;31m'   # begin blinking
export LESS_TERMCAP_md=$'\e[01;36m'   # begin bold
export LESS_TERMCAP_me=$'\e[0m'       # end mode
export LESS_TERMCAP_se=$'\e[0m'       # end standout-mode
export LESS_TERMCAP_so=$'\e[1;44;30m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'       # end underline
export LESS_TERMCAP_us=$'\e[4;36m'    # begin underline

