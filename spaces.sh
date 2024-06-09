#!/usr/bin/env bash

# $1 => space id
# $2 => space label
# $3 => space display
function setup_space() {
  local idx="$1"
  local label="$2"
  local display="$3"

  if [ -z $(yabai -m query --spaces --space $idx) ]; then
    yabai -m space --create
  fi

  yabai -m space $idx --label $label
  yabai -m space $idx --display $display
}

setup_space 1 1 1
setup_space 2 2 1
setup_space 3 3 1
setup_space 4 4 1
setup_space 5 5 1
setup_space 6 6 1
setup_space 7 7 2
setup_space 8 8 2
setup_space 9 9 2

# Setup or destroy spaces as needed to match 9
for _ in $(yabai -m query --spaces | jq '.[].index | select(. > 9)'); do
  yabai -m space --destroy 10
done

# main_display_padding=(
#   top_padding 133
#   bottom_padding 133
#   left_padding 233
#   right_padding 233
# )
#
# # Set space padding
# yabai -m config --space 1 "${main_display_padding[@]}"
# yabai -m config --space 2 "${main_display_padding[@]}"
# yabai -m config --space 3 "${main_display_padding[@]}"
#
# # Set Always-Floating Spaces
# yabai -m config --space 1 layout float
# yabai -m config --space 3 layout float
#
# yabai -m rule --add app="^Music$" space=1
# yabai -m rule --add app="^(Firefox|Obsidian)$" space=^2
# yabai -m rule --add app="^(Notion|Photoshop|Lightroom|Pym|Slack|Discord)$" space=3
# yabai -m rule --add app="^iTerm$" space=4
# yabai -m rule --add app="^(OmniFocus|Mail|Calendar)$" space=5
# yabai -m rule --add app="^Code$" space=8
