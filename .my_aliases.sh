#     __  ___           ___    ___
#    /  |/  /_  __     /   |  / (_)___ _________  _____
#   / /|_/ / / / /    / /| | / / / __ `/ ___/ _ \/ ___/
#  / /  / / /_/ /    / ___ |/ / / /_/ (__  )  __(__  )
# /_/  /_/\__, /    /_/  |_/_/_/\__,_/____/\___/____/
#        /____/

alias ls='exa -lhFg --color=auto --group-directories-first --icons'
alias v='$EDITOR'
alias vc='$EDITOR $HOME/.config/nvim/init.vim'
alias fc='$EDITOR $HOME/.bashrc'
alias ff='$EDITOR $HOME/.my_functions.sh'
alias fa='$EDITOR $HOME/.my_aliases.sh'
alias bat='bat --theme gruvbox-dark'
alias rm='rm -I'
alias mv='mv -i'
alias cp='cp -i'
alias remove='sudo apt purge --auto-remove'
alias inst='sudo apt install'
alias update='sudo apt update && sudo apt upgrade -y'
alias grep='grep --color=auto'

# Add an "alert" alias for long running commands.
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
