#!/bin/bash
# Ignore Ctrl+C (SIGINT)
trap '' INT
# Stop echoing keystrokes
stty -echo
# Hide cursor
tput civis

# Ensure that echo is restored even if crash
trap 'stty echo; tput cnorm; exit' EXIT

MESSAGE_DIRECTORY="/usr/local/share/stories/"
message_file=$(ls /usr/local/share/stories | sort -R | tail -n 1)
message="${MESSAGE_DIRECTORY}${message_file}"

# Sleep to allow it to start at the start
# Pretty shoddy programming but shush
sleep 10

# Clear screen for a clean look
echo -e "\e[H\e[2J" 

if [ -f "$message" ]; then
    while IFS= read -r line; do
        # Print line in bright green (Terminal style)
        echo -e "\e[32m$line\e[0m"

        # We pick a number between 2 and 30 (tenths of a second)
        # Then divide by 10 to get 0.2 to 3.0
        # PAUSE=$(awk -v min=0.2 -v max=3.0 'BEGIN{srand(); print min+rand()*(max-min)}')
        # sleep "$PAUSE"
	sleep 2
    done < "$message"
fi

sleep 3

# Explicitly restore terminal settings
stty echo
tput cnorm
