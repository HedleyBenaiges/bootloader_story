# Bootloader Story

An unskippable, very long, randomly selected joke which prints to the terminal one line at a time before you are allowed to log in.

## Installation
Run install.sh
It will move files to the correct directories, create and enable a systemd service for each TTY (excluding tty6 so it can be bypassed)

## How it works
- The program runs as a systemd service before the greeter / window manager.
- Stories are randomly selected from the directory "stories/"
- Stories are printed one line at a time with an interval of 2 seconds per line
- Inputs of `^C` are captured and ignored.

## Emergency bypass
The service does not run on tty6.

You can bypass the service with:
- Opening TTY 6 with `CTRL+ALT+F6`
- Logging in
- Entering the command `sudo systemctl stop bootloader_story@tty1.service`

If you want to remove this bypass, simply run the systemd service on all TTYs (all others + tty 6) `sudo systemctl enable bootloader_story@tty6.service`.

## Uninstalling
To uninstall this, you should:
- Stop and disable the service on each tty:
```
for i in {1..6}; do
  sudo systemctl stop "bootloader_story@tty${i}.service"
  sudo systemctl disable "bootloader_story@tty${i}.service"
done
```
- Delete the stories directory with   `rm -rf /usr/local/share/stories`
- Delete the script with              `rm /usr/local/bin/bootloader_story.sh`
- Delete the systemd service with     `rm /etc/systemd/system/bootloader_story@.service`
