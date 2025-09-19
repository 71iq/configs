alias q="exit"
alias g="git"
alias vim="nvim"
alias vm="vim $HOME/main.cpp"
alias python="python3"
alias gemipro="gemini -m gemini-2.5-pro"
alias zenack="source .venv/bin/activate && python server.py"
alias time='/usr/bin/time -f "\ntime %E mem %M KB"'
alias cr="clear && clang++ -std=c++20 $HOME/main.cpp -o $HOME/main.out -Wall -fsanitize=address -fsanitize=undefined -Wextra -Wshadow -Wfloat-equal -Wshift-overflow -g && cat $HOME/input.txt && echo && time $HOME/main.out < $HOME/input.txt"
alias crng="clear && clang++ -std=c++20 $HOME/naive.cpp -o $HOME/naive.out -Wshift-overflow && clang++ $HOME/gen.cpp -o $HOME/gen.out -Wshift-overflow"
alias update="sudo pacman -Syu --noconfirm && flatpak update -y && yay -Syu --noconfirm"
alias mindst="cd Miscs/Mindustry && ./gradlew desktop:run"
alias delete="sudo pacman -Rcns"
alias ipad="$HOME/Miscs/weylus/weylus"
alias normies-mode='sudo systemctl stop kanata.service && echo "Kanata disabled 😭 (normies mode activated)"'
alias hackers-mode='sudo systemctl start kanata.service && echo "Kanata enabled 😎 (hacker mode activated)"'
alias p='python'
alias icr='cr'
alias cri='clear && clang++ -std=c++20 $HOME/main.cpp -o $HOME/main.out -Wall -fsanitize=address -fsanitize=undefined -Wextra -Wshadow -Wfloat-equal -Wshift-overflow -g && time $HOME/main.out'
