input() { echo -n "$*" > "$HOME/input.txt"; eval "clear && clang++ $HOME/main.cpp -o $HOME/main.out -Wall -fsanitize=address -fsanitize=undefined -Wextra -Wshadow -Wfloat-equal -Wshift-overflow -g && cat $HOME/input.txt && echo && /usr/bin/time -f '\ntime %E mem %M KB' $HOME/main.out < $HOME/input.txt"; }
mkcd() { mkdir -p "$1" && cd "$1"; }
