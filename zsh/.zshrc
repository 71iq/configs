for f in $HOME/.config/zsh/*.zsh(n); do
  source "$f"
done
export PATH="/opt/wine-stable/bin:$PATH"
