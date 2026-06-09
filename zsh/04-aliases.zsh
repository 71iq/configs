alias q="exit"
alias c="clear"
alias g="git"
alias vim="nvim"
alias nv="nvim"
alias vm="vim $HOME/main.cpp"
alias vmt="nvim $HOME/trash.txt"
alias python="python3"
alias pip="pip3"
alias p='python'
alias time='/usr/bin/time -f "\ntime %E mem %M KB"'
alias cr="clear && clang++ $HOME/main.cpp -o $HOME/main.out -Wall -fsanitize=address -fsanitize=undefined -Wextra -Wshadow -Wfloat-equal -Wshift-overflow -g && cat $HOME/input.txt && echo && time $HOME/main.out < $HOME/input.txt"
alias crng="clear && clang++ $HOME/naive.cpp -o $HOME/naive.out -Wshift-overflow && clang++ $HOME/gen.cpp -o $HOME/gen.out -Wshift-overflow"
alias normies-mode='sudo systemctl stop kanata.service && echo "Kanata disabled"'
alias hackers-mode='sudo systemctl start kanata.service && echo "Kanata enabled"'
alias icr='cr'
alias cri='clear && clang++ -std=c++20 $HOME/main.cpp -o $HOME/main.out -Wall -fsanitize=address -fsanitize=undefined -Wextra -Wshadow -Wfloat-equal -Wshift-overflow -g && time $HOME/main.out'

# Navigation
alias ls="ls --color=auto"
alias l="ls -hla"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias szsh="source ~/.zshrc"

# Search
alias rgi="rg -i"
alias rgp='rg -n --pretty'

# fzf integrations
alias vf='nvim $(fzf)'
alias cdf='cd $(find . -type d | fzf)'

alias remove-notification='systemctl --user restart mako.service'
