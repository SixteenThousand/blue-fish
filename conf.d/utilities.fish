# Move To!
function mvt
    argparse 'c/cwd' 'd/depth=+' 'h/help' 's/search-directory=+' -- $argv
    if set -ql _flag_help
        echo -e "\
Move To! Options:
            -h, --help - Show this help message.
           -d, --depth - Specify how deep within the directory tree you want to search.
             -c, --cwd - Search within the current working directory only.
-s, --search-directory - specifies the directory to search within. Can be 
                         relative to pwd."
        return 0
    end
    if test -z $argv[1]
        set depth '7'
    else
        set depth $argv[1]
    end
    if set -ql _flag_depth
        set depth $_flag_depth
    end
    if set -ql _flag_cwd
        set dir $pwd
    else
        set dir /
    end
    if set -ql _flag_s
        set dir $_flag_s
    end
    cd $(find $dir -maxdepth $depth -type d 2>/dev/null | fzf)
end

# true & false
function cond
    argparse 'n/no-test' -- $argv
    if set -ql _flag_n
        if $argv
            echo "RUNS"
        else
            echo "DOES NOT RUN"
        end
        return
    end
    if test $argv
        echo 'TRUE'
    else
        echo 'FALSE'
    end
end

# do old commands
function stale
    set -l OLD_CMD $(history | fzf)
    echo "Executing >>$OLD_CMD<<"
    read --prompt-str "Are you sure? (y/n) -> " SURENESS
    if test $SURENESS = 'y'
        eval $OLD_CMD
    end
end
