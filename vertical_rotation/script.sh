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
sed -i "s/#disable_overscan/disable_overscan=1/" /boot/config.txt

echo "criando backup de arquivo de configuracao do touchscreen"
mv 

echo "subtistuindo arquivo de configuracao do touchscreen"
mv

echo "reiniciando rasp..."
