if not status is-interactive
    return
end

abbr --add py python
abbr --add sqlite sqlite3

# git abbreviations
abbr --add gist git status
abbr --add gick git commit
abbr --add giaa git add

# aliases
alias f fuck
alias ls 'ls --color=always -A --group-directories-first'
alias sbcl 'rlwrap sbcl'
alias nv nvim
alias fox 'firefox --new-tab'

# systemd abbreviations
abbr --add statusd systemctl status
abbr --add stopd sudo systemctl stop
abbr --add startd sudo systemctl start
abbr --add enabled sudo systemctl enable
abbr --add disabled sudo systemctl disable
abbr --add ssysd sudo systemctl
abbr --add sysd systemctl
