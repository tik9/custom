
# pactl
alias getv='pactl get-sink-volume'
alias list_sink='pactl get-sink-volume 58'
alias list="pactl list short | grep RUNNING | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,'"
