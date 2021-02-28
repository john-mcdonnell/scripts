# store colors
MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[038;5;154m\]"
BLUE="\[\033[038;5;33m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[038;5;51m\]"
GREEN="\[\033[00;32m\]"
RED="\[\033[38;5;160m\]"
VIOLET="\[\033[01;35m\]"
GREY="\[\033[038;5;234m\]"
BROWN="\[\033[038;5;130m\]"
ORANGE="\[\033[038;5;208m\]"
WHITE="\[\033[00m\]"

color_my_prompt() {
  if [[ "$(__git_ps1 "%s")" =~ "*" ]]; then # if repository is dirty
    __git_branch_color="$BROWN"
  elif [[ "$(__git_ps1 "%s")" =~ "+" ]]; then # if there are staged files
    __git_branch_color="$CYAN"
  elif [[ "$(__git_ps1 "%s")" =~ "Ŧ" ]]; then # if there are only untracked files
    __git_branch_color="$RED"
  elif [[ "$(__git_ps1 "%s")" =~ "=" ]]; then # if there is something stashed
    __git_branch_color="$GREEN"
  elif [[ "$(__git_ps1 "%s")" =~ "↩" ]]; then # if behind
    __git_branch_color="$ORANGE"
  elif [[ "$(__git_ps1 "%s")" =~ "↪" ]]; then # if there are commiting files
    __git_branch_color="$MAGENTA"
  elif [[ "$(__git_ps1 "%s")" =~ "✔" ]]; then # if it is equal to repo
    __git_branch_color="$YELLOW"
  fi
  PS1="${debian_chroot:+($debian_chroot)}\u:$BLUE\w$__git_branch_color\$(__git_ps1)$WHITE $ "
}

if [ -f /usr/lib/git-core/git-sh-prompt ]; then
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM="auto"
  GIT_PS1_HIDE_IF_PWD_IGNORED=true
  GIT_PS1_SHOWCOLORHINTS=true
  GIT_PROMPT_SHOW_UNTRACKED_FILES=normal # can be no, normal or all; determines counting of untracked files
  . /usr/lib/git-core/git-sh-prompt
fi

# configure PROMPT_COMMAND which is executed each time before PS1
export PROMPT_COMMAND=color_my_prompt
