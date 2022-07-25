# A multiline prompt with username, hostname, full path, return status, git branch, git dirty status, git remote status

local return_status="%{$fg[red]%}%(?..⏎)%{$reset_color%}"

local host_color="green"
if [ -n "$SSH_CLIENT" ]; then
  local host_color="red"
fi

local user_host_display="%F{grey}%B[%b%n@%F{$host_color}%m%F{grey}%B]%b%f"
local pwd_display="%F{blue}%10c%f"

PROMPT="
$user_host_display $pwd_display \$(git_prompt_info) \$(git_remote_status)
%F{blue}❯%f "


RPROMPT='${return_status}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow} %B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%b%F{yellow} ⚡"
ZSH_THEME_GIT_PROMPT_CLEAN="$b "
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%F{magenta}↓"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%F{magenta}↑"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%F{red}↕"
