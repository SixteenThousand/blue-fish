function fish_prompt
    # the weird stuff athe start id there so tmux can find prompts
    echo -e "\033]133;A\033\\\
$(set_color red)$USER\
$(set_color normal)@\
$(set_color blue)$HOSTNAME\
$(set_color normal)+\
$(set_color cyan)fish\
$(set_color normal) in\
$(set_color bryellow) $(prompt_pwd --dir-length 0)\
$(set_color brgreen) $(get_git_branch)\
\n\
$(set_color red) ~> \
$(set_color normal)"
end

# function fish_right_prompt
#     printf "%s%s%s" $(set_color green) $(date) $(set_color normal)
# end

function get_git_branch
    if set GIT_BRANCH $(git branch --show-current 2>/dev/null)
        echo " $GIT_BRANCH"
    end
end
