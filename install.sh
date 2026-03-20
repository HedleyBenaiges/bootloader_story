# Moving scripts and text into '/usr/local'
sudo cp -r stories /usr/local/share/
sudo cp bootloader_story.sh /usr/local/bin/

# Create systemd.service
sudo cp bootloader_story@.service /etc/systemd/system/
sudo systemctl daemon-reload

# Can do to all TTYs
sudo systemctl enable bootloader_story@tty1.service
