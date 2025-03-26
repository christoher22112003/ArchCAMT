#!/bin/bash

# Instalar LightDM y LightDM GTK Greeter
sudo pacman -S --noconfirm lightdm lightdm-gtk-greeter

# Habilitar LightDM
sudo systemctl enable lightdm.service --now

# Verificar si LightDM se habilitó correctamente
if [[ $? -eq 0 ]]; then
    echo "LightDM habilitado correctamente."
else
    echo "Error al habilitar LightDM."
    exit 1
fi
