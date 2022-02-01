#     __  ___           ______                 __  _
#    /  |/  /_  __     / ____/_  ______  _____/ /_(_)___  ____  _____
#   / /|_/ / / / /    / /_  / / / / __ \/ ___/ __/ / __ \/ __ \/ ___/
#  / /  / / /_/ /    / __/ / /_/ / / / / /__/ /_/ / /_/ / / / (__  )
# /_/  /_/\__, /    /_/    \__,_/_/ /_/\___/\__/_/\____/_/ /_/____/
#        /____/

o() {
    local name=$(fzf +m --preview 'bat --theme gruvbox-dark --style=numbers --color=always --line-range :500 {}')
    if [ -f "$name" ]
    then
        case $(file -b --mime-type - < "$name") in
            (text/*)
                $EDITOR "$name";;
            (*)
                echo "$(basename "$name") is not a text file";;
        esac
    elif [ -d "$name" ]
    then
        cd "$name"
    fi
}

f() {
    local name=$(rg . | fzf +m )
    if [ "$name" != '' ]
    then
        local filename=$(echo "$name" | cut -d ":" -f 1)
        $EDITOR "$filename"
    fi
}
