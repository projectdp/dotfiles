[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
exec sh ~/.config/scripts/wallpapers.sh &
exec i3
