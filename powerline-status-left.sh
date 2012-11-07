#!/usr/bin/env bash
#Print the status-left for tmux.
#
# The powerline root directory.
cwd=$(dirname $0)

# Source global configurations.
source "${cwd}/config.sh"

# Source lib functions.
source "${cwd}/lib.sh"

segments_path="${cwd}/${segments_dir}"

# Mute this statusbar?
mute_status_check "left"

# Segments

declare -A mail_count
#mail_count+=(["script"]="${segments_path}/mail_count_maildir.sh")
#mail_count+=(["script"]="${segments_path}/mail_count_gmail.sh")
mail_count+=(["script"]="${segments_path}/mail_count_apple_mail.sh")
mail_count+=(["foreground"]="black")
mail_count+=(["background"]="colour255")
mail_count+=(["separator"]="${separator_right_bold}")
register_segment "mail_count"

declare -A date_day
date_day+=(["script"]="${segments_path}/date_day.sh")
date_day+=(["foreground"]="colour136")
date_day+=(["background"]="colour235")
date_day+=(["separator"]="${separator_right_bold}")
register_segment "date_day"

declare -A date_full
date_full+=(["script"]="${segments_path}/date_full.sh")
date_full+=(["foreground"]="colour136")
date_full+=(["background"]="colour235")
date_full+=(["separator"]="${separator_right_thin}")
date_full+=(["separator_fg"]="default")
register_segment "date_full"

declare -A time
time+=(["script"]="${segments_path}/time.sh")
time+=(["foreground"]="colour136")
time+=(["background"]="colour235")
time+=(["separator"]="${separator_right_thin}")
time+=(["separator_fg"]="default")
register_segment "time"

declare -A hostname
hostname+=(["script"]="${segments_path}/hostname.sh")
hostname+=(["foreground"]="colour238")
hostname+=(["background"]="colour245")
hostname+=(["separator"]="${separator_right_bold}")
register_segment "hostname"

declare -A battery
if [ "$PLATFORM" == "mac" ]; then
	battery+=(["script"]="${segments_path}/battery_mac.sh")
else
	battery+=(["script"]="${segments_path}/battery.sh")
fi
battery+=(["foreground"]="colour127")
battery+=(["background"]="colour137")
battery+=(["separator"]="${separator_right_bold}")
register_segment "battery"

declare -A lan_ip
lan_ip+=(["script"]="${segments_path}/lan_ip.sh")
lan_ip+=(["foreground"]="colour255")
lan_ip+=(["background"]="colour24")
lan_ip+=(["separator"]="${separator_right_bold}")
register_segment "lan_ip"

declare -A wan_ip
wan_ip+=(["script"]="${segments_path}/wan_ip.sh")
wan_ip+=(["foreground"]="colour255")
wan_ip+=(["background"]="colour24")
wan_ip+=(["separator"]="${separator_right_thin}")
wan_ip+=(["separator_fg"]="white")
register_segment "wan_ip"

declare -A vcs_branch
vcs_branch+=(["script"]="${segments_path}/vcs_branch.sh")
vcs_branch+=(["foreground"]="colour88")
vcs_branch+=(["background"]="colour29")
vcs_branch+=(["separator"]="${separator_right_bold}")
register_segment "vcs_branch"

declare -A vcs_compare
vcs_compare+=(["script"]="${segments_path}/vcs_compare.sh")
vcs_compare+=(["foreground"]="white")
vcs_compare+=(["background"]="colour60")
vcs_compare+=(["separator"]="${separator_right_bold}")
register_segment "vcs_compare"

declare -A vcs_staged
vcs_staged+=(["script"]="${segments_path}/vcs_staged.sh")
vcs_staged+=(["foreground"]="white")
vcs_staged+=(["background"]="colour64")
vcs_staged+=(["separator"]="${separator_right_bold}")
register_segment "vcs_staged"

declare -A vcs_modified
vcs_modified+=(["script"]="${segments_path}/vcs_modified.sh")
vcs_modified+=(["foreground"]="white")
vcs_modified+=(["background"]="red")
vcs_modified+=(["separator"]="${separator_right_bold}")
register_segment "vcs_modified"

declare -A vcs_others
vcs_others+=(["script"]="${segments_path}/vcs_others.sh")
vcs_others+=(["foreground"]="black")
vcs_others+=(["background"]="colour245")
vcs_others+=(["separator"]="${separator_right_bold}")
register_segment "vcs_others"

# Print the status line in the order of registration above.
print_status_line_left

exit 0
