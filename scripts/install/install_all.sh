#!/bin/bash

# Colores
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # Sin color

# Crear directorio de logs si no existe
LOG_DIR="$(dirname "$0")/../logs"
mkdir -p "$LOG_DIR"

# Función para ejecutar comandos con mensajes de éxito/error
execute_command() {
    local command="$1"
    local log_file="$LOG_DIR/$(echo "$command" | awk '{print $1}').log"

    echo -e "${YELLOW}Ejecutando: $command${NC}"
    if eval "$command" >"$log_file" 2>&1; then
        echo -e "${GREEN}Comando ejecutado correctamente.${NC}"
    else
        echo -e "${RED}Error al ejecutar el comando. Revisa el log: $log_file${NC}"
        exit 1
    fi
}

# Actualizar los repositorios
execute_command "sudo pacman -Syu --noconfirm"

# Instalar NVIDIA drivers y configuración
execute_command "sudo pacman -S --noconfirm nvidia nvidia-settings"

# Instalar Network Manager y su applet
if ! pacman -Qi networkmanager &>/dev/null || ! pacman -Qi network-manager-applet &>/dev/null; then
    execute_command "sudo pacman -S --noconfirm networkmanager network-manager-applet"
else
    echo -e "${GREEN}NetworkManager y network-manager-applet ya están instalados.${NC}"
fi

# Habilitar y empezar NetworkManager
execute_command "sudo systemctl enable NetworkManager"
execute_command "sudo systemctl start NetworkManager"

# Conectar a redes Wi-Fi
execute_command "nmcli dev wifi connect 'Christopher Muzo' password '1850249820'"
execute_command "nmcli dev wifi connect 'MinosÉacoRadamantis' password '7t&A9Mc7ddr@k$'"
execute_command "nmcli dev wifi connect 'PUCESA' password 'PUCEWIFI2015'"

# Instalar pavucontrol y blueman
execute_command "sudo pacman -S --noconfirm pavucontrol blueman"

# Habilitar el repositorio multilib
execute_command "sudo sed -i '/\[multilib\]/,/Include/ s/^#//' /etc/pacman.conf"

# Instalar Steam
execute_command "echo -e '2\n' | sudo pacman -S --noconfirm steam"

# Instalar asusctl
execute_command "sudo pacman -S --noconfirm asusctl"

# Instalar Visual Studio Code
execute_command "paru -S --noconfirm visual-studio-code-bin"

echo -e "${GREEN}Todos los programas han sido instalados correctamente.${NC}"