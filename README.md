# Bootloader Story

An unskippable very long joke randomly selected from "/stories" and printed to the terminal one line at a time. The program also catches `^C` to avoid being skipped.

## Installation
Run install.sh
It will move files to the correct directories, create and enable a systemd service

## How it works
A systemd service will run before the login manager
Inputs of `^C` are captured and ignored.

## Emergency bypass
Currently it only runs on one TTY 
