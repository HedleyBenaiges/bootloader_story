# Bootloader Story

An unskippable very long joke randomly selected from "/stories" and printed to the terminal one line at a time. The program also catches `^C` to avoid being skipped.

## Installation
Run install.sh
It will move files to the correct directories, create and enable a systemd service

## How it works
A systemd service will run before the login manager
Inputs of `^C` are captured and ignored.

## Emergency bypass
The service does not run on tty6. You can bypass the service with `CTRL+ALT+F6` and entering the command `sudo systemctl stop bootloader_story@tty1.service`
