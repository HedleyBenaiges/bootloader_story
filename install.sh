# Moving scripts and text into '/usr/local'
sudo cp -r stories /usr/local/share/
sudo cp bootloader_story.sh /usr/local/bin/

# Create systemd.service
sudo cp bootloader_story@.service /etc/systemd/system/
sudo systemctl daemon-reload

# Enable for the first 5 standard TTYs
for i in {1..5}; do
  sudo systemctl enable "bootloader_story@tty${i}.service"
done
