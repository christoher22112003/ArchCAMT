#!/bin/bash

# Colores
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # Sin color

# Función para ejecutar comandos con mensajes de éxito/error
execute_command() {
    echo -e "${YELLOW}Ejecutando: $1${NC}"
    if eval "$1"; then
        echo -e "${GREEN}Comando ejecutado correctamente.${NC}"
    else
        echo -e "${RED}Error al ejecutar el comando.${NC}"
        exit 1
    fi
}

# Actualizar los repositorios
execute_command "sudo pacman -Syu --noconfirm"

# Habilitar el repositorio multilib
execute_command "sudo sed -i '/\[multilib\]/,/Include/ s/^#//' /etc/pacman.conf"

# Instalar Steam
execute_command "echo -e '2\n' | sudo pacman -S --noconfirm steam"

# Instalar NVIDIA drivers y configuración
execute_command "sudo pacman -S --noconfirm nvidia nvidia-settings"

# Instalar Network Manager y su applet
execute_command "sudo pacman -S --noconfirm network-manager network-manager-applet"
execute_command "sudo systemctl enable NetworkManager"
execute_command "sudo systemctl start NetworkManager"

# Conectar a redes Wi-Fi
execute_command "nmcli dev wifi connect 'Christopher Muzo' password '1850249820'"
execute_command "nmcli dev wifi connect 'MinosÉacoRadamantis' password '7t&A9Mc7ddr@k$'"

# Instalar pavucontrol y blueman
execute_command "sudo pacman -S --noconfirm pavucontrol blueman"

# Instalar asusctl
execute_command "sudo pacman -S --noconfirm asusctl"

echo -e "${GREEN}Todos los programas han sido instalados correctamente.${NC}"
