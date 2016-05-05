# FreeAgent puts the powerline style in zsh !

function prompt_sorin_pwd {
  local pwd="${PWD/#$HOME/~}"

  if [[ "$pwd" == (#m)[/~] ]]; then
    _prompt_sorin_pwd="$MATCH"
    unset MATCH
  else
    _prompt_sorin_pwd="${${${(@j:/:M)${(@s:/:)pwd}##.#?}:h}%/}/${pwd:t}"
  fi
}

if [ "$POWERLINE_DATE_FORMAT" = "" ]; then
  POWERLINE_DATE_FORMAT=%D{%Y-%m-%d}
fi

POWERLINE_USER_NAME="%n"

POWERLINE_CURRENT_PATH=$_prompt_sorin_pwd

function setprompts {
  prompt_sorin_pwd

  POWERLINE_USER_NAME="%n"
  
  if [ "$POWERLINE_GIT_CLEAN" = "" ]; then
    POWERLINE_GIT_CLEAN="✔"
  fi

  if [ "$POWERLINE_GIT_DIRTY" = "" ]; then
    POWERLINE_GIT_DIRTY="✘"
  fi

  if [ "$POWERLINE_GIT_ADDED" = "" ]; then
    POWERLINE_GIT_ADDED="%F{green}✚%F{black}"
  fi

  if [ "$POWERLINE_GIT_MODIFIED" = "" ]; then
    POWERLINE_GIT_MODIFIED="%F{blue}✹%F{black}"
  fi

  if [ "$POWERLINE_GIT_DELETED" = "" ]; then
    POWERLINE_GIT_DELETED="%F{red}✖%F{black}"
  fi

  if [ "$POWERLINE_GIT_UNTRACKED" = "" ]; then
    POWERLINE_GIT_UNTRACKED="%F{yellow}✭%F{black}"
  fi

  if [ "$POWERLINE_GIT_RENAMED" = "" ]; then
    POWERLINE_GIT_RENAMED="➜"
  fi

  if [ "$POWERLINE_GIT_UNMERGED" = "" ]; then
    POWERLINE_GIT_UNMERGED="═"
  fi

  ZSH_THEME_GIT_PROMPT_PREFIX=" \ue0a0 "
  ZSH_THEME_GIT_PROMPT_SUFFIX=""
  ZSH_THEME_GIT_PROMPT_DIRTY=" $POWERLINE_GIT_DIRTY"
  ZSH_THEME_GIT_PROMPT_CLEAN=" $POWERLINE_GIT_CLEAN"

  ZSH_THEME_GIT_PROMPT_ADDED=" $POWERLINE_GIT_ADDED"
  ZSH_THEME_GIT_PROMPT_MODIFIED=" $POWERLINE_GIT_MODIFIED"
  ZSH_THEME_GIT_PROMPT_DELETED=" $POWERLINE_GIT_DELETED"
  ZSH_THEME_GIT_PROMPT_UNTRACKED=" $POWERLINE_GIT_UNTRACKED"
  ZSH_THEME_GIT_PROMPT_RENAMED=" $POWERLINE_GIT_RENAMED"
  ZSH_THEME_GIT_PROMPT_UNMERGED=" $POWERLINE_GIT_UNMERGED"
  ZSH_THEME_GIT_PROMPT_AHEAD=" ⬆"
  ZSH_THEME_GIT_PROMPT_BEHIND=" ⬇"
  ZSH_THEME_GIT_PROMPT_DIVERGED=" ⬍"

  POWERLINE_GIT_INFO_LEFT=" %F{blue}%K{white}"$'\ue0b0'"%F{white}%F{black}%K{white}"$'$(git_prompt_info)$(git_prompt_status)%F{white}'

  if [ $(id -u) -eq 0 ]; then
      POWERLINE_SEC1_BG=%K{red}
      POWERLINE_SEC1_FG=%F{red}
  else
      POWERLINE_SEC1_BG=%K{green}
      POWERLINE_SEC1_FG=%F{green}
  fi
  POWERLINE_SEC1_TXT=%F{black}
  if [ "$POWERLINE_DETECT_SSH" != "" ]; then
    if [ -n "$SSH_CLIENT" ]; then
      POWERLINE_SEC1_BG=%K{red}
      POWERLINE_SEC1_FG=%F{red}
      POWERLINE_SEC1_TXT=%F{white}
    fi
  fi
  PROMPT="$POWERLINE_SEC1_BG$POWERLINE_SEC1_TXT $POWERLINE_USER_NAME %k%f$POWERLINE_SEC1_FG%K{blue}"$'\ue0b0'"%k%f%F{white}%K{blue} "$_prompt_sorin_pwd"%F{blue}"$POWERLINE_GIT_INFO_LEFT" %k"$'\ue0b0'"%f "

  if [ "$POWERLINE_NO_BLANK_LINE" = "" ]; then
    PROMPT="
"$PROMPT
  fi

}

add-zsh-hook precmd setprompts
