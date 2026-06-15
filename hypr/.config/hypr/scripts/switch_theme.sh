cd "${0%/*}"

# Get array of all available wallpapers
readarray -t wps < ../data/wallpaper_list.txt

# Determine next wallpaper in list
curr_wp="$(grep -o 'path = .*' ../hyprpaper.conf)"
curr_wp="${curr_wp##*/}"
curr_wp_idx=0

for wp in "${wps[@]}"
do
    curr_wp_idx=$((curr_wp_idx+1))
    if [[ "$curr_wp" == "$wp" ]]; then
        break
    fi
done

n_wps=${#wps[@]}
next_wp_idx=$(($curr_wp_idx%$n_wps))
next_wp=${wps[$next_wp_idx]}

# Update wallpaper in hyprpaper.conf
sed -i "s/path = .*/path = ..\/wallpapers\/${next_wp}/" ../hyprpaper.conf

# Generate templates
matugen image --source-color-index 0 "../wallpapers/${next_wp}"

# Restart hyprpaper
pkill hyprpaper
hyprpaper & disown
