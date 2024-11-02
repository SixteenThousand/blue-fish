function fish_prompt
    set -l last_status $status
    set -l status_prompt
    if test $last_status -ne 0
        set status_prompt "[31m=>> $last_status <<=[0m\n"
    end
    echo -e "]133;A\\]133;P\007\
$status_prompt\
[33m$USER\
[0m@\
[35m$HOSTNAME\
[0m+\
[36mfish\
[0m [\
[1;34m$(prompt_pwd --dir-length 0)\
[0m] <\
[34mjobs??\
[0m> \
[3;32m $(git branch --show-current 2>/dev/null)\
[0m
[1;31m ~> \
[0m]133;B\007\
"
end

# function fish_right_prompt
#     printf "%s%s%s" $(set_color green) $(date) $(set_color normal)
# end

function get_git_branch
    if set GIT_BRANCH $(git branch --show-current 2>/dev/null)
        echo " $GIT_BRANCH"
    end
end
