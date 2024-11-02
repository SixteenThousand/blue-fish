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
        "\e[36mfish\e[0m" \
        "\e[1;34m$(prompt_pwd --dir-length 0)\e[0m" \
        "\e[34mjobs??\e[0m" \
        "\e[3;32m $(git branch --show-current 2>/dev/null)\e[0m" \
        "\e[31m~>\e[0m" \
        '\e]133;B\007'
end

# function fish_right_prompt
#     printf "%s%s%s" $(set_color green) $(date) $(set_color normal)
# end

function get_git_branch
    if set GIT_BRANCH $(git branch --show-current 2>/dev/null)
        echo " $GIT_BRANCH"
    end
end
