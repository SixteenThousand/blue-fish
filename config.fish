abbr --add sys systemctl

# REPLs
abbr --add py python
abbr --add sqli sqlite3
abbr --add pg pgsql

# git
abbr --add gist git status
abbr --add gick git commit
abbr --add giaa git add

# aliases
alias ls 'ls --color=always -A --group-directories-first'
alias sbcl 'rlwrap sbcl'
alias nv nvim
alias code codium

bind \cg 'mvt; commandline -f repaint'
bind \eg 'mvt -c; commandline -f repaint'
bind \e\[1\;3D 'cd -; commandline -f repaint'
bind \e\[1\;3C 'mvt -c; commandline -f repaint'
bind \e- 'cd ..; commandline -f repaint'

# prompt
function fish_prompt
    set -l last_status $status
    set -l status_prompt
    if test $last_status -ne 0
        set status_prompt "\e[31m=>> $last_status <<=\e[0m\n"
    end
    printf "$status_prompt%b%b@%b+%b [%b] <%b> %b\n %b %b" \
        '\e]133;P\007\e]133;A\e\\' \
        "\e[33m$USER\e[0m" \
        "\e[35m$HOSTNAME\e[0m" \
        "\e[36m$(fish -v | sed 's/, version /.v/')\e[0m" \
        "\e[1;34m$(prompt_pwd --dir-length 0)\e[0m" \
        "\e[34m$(jobs | wc -l)\e[0m" \
        "\e[3;32m $(git branch --show-current 2>/dev/null)\e[0m" \
        "\e[31m~>\e[0m" \
        '\e]133;B\007'
end
