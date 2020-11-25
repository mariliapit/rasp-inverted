#!/bin/bash

echo "instalando evdev - generic linux input driver"
apt-get install -y xserver-xorg-input-evdev

echo "rotacionando display em 270°"
su -c "cat >> /boot/config.txt << EOF
# Rotacao display
display_rotate=3
EOF
"

echo "removendo bordas pretas"
sed -i "s/#disable_overscan=1/disable_overscan=1/" /boot/config.txt

echo "criando backup de arquivo de configuracao do touchscreen"
mv /usr/share/X11/xorg.conf.d/10-evdev.conf /usr/share/X11/xorg.conf.d/10-evdev.conf.bak 

echo "subtistuindo arquivo de configuracao do touchscreen"
cp ./src/45-evdev.conf /usr/share/X11/xorg.conf.d/45-evdev.conf

echo "reiniciando rasp..."
reboot
