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
        # No salir, solo registrar el error
    fi
}

# Función para verificar si un paquete está instalado
is_installed() {
    local package="$1"
    pacman -Qi "$package" &>/dev/null
}

# Habilitar el repositorio multilib
execute_command "sudo sed -i '/\[multilib\]/,/Include/ s/^#//' /etc/pacman.conf"

# Actualizar los repositorios
execute_command "sudo pacman -Syu --noconfirm"

# Instalar yay si no está instalado
if ! command -v yay &>/dev/null; then
    echo -e "${YELLOW}yay no está instalado. Procediendo con la instalación...${NC}"
    execute_command "sudo pacman -S --noconfirm base-devel git"
    execute_command "git clone https://aur.archlinux.org/yay.git ~/yay"
    execute_command "cd ~/yay && makepkg -si --noconfirm"
else
    echo -e "${GREEN}yay ya está instalado.${NC}"
fi

# Instalar NVIDIA drivers y configuración
if ! is_installed "nvidia" && ! is_installed "nvidia-settings"; then
    execute_command "sudo pacman -S --noconfirm nvidia nvidia-settings"
else
    echo -e "${GREEN}NVIDIA drivers y configuración ya están instalados.${NC}"
fi

# Instalar Network Manager y su applet
if ! is_installed "network-manager" && ! is_installed "network-manager-applet"; then
    execute_command "sudo pacman -S --noconfirm network-manager network-manager-applet"
else
    echo -e "${GREEN}network-manager y network-manager-applet ya están instalados.${NC}"
fi

# Habilitar y empezar NetworkManager
execute_command "sudo systemctl enable NetworkManager"
execute_command "sudo systemctl start NetworkManager"

# Conectar a redes Wi-Fi (descomenta si deseas conectar automáticamente)
# execute_command "nmcli dev wifi connect 'Christopher Muzo' password '1850249820'"
# execute_command "nmcli dev wifi connect 'MinosÉacoRadamantis' password '7t&A9Mc7ddr@k$'"
# execute_command "nmcli dev wifi connect 'PUCESA' password 'PUCEWIFI2015'"

# Instalar pavucontrol y blueman
if ! is_installed "pavucontrol" && ! is_installed "blueman"; then
    execute_command "sudo pacman -S --noconfirm pavucontrol blueman"
else
    echo -e "${GREEN}pavucontrol y blueman ya están instalados.${NC}"
fi

# Instalar Steam
if ! is_installed "steam"; then
    execute_command "echo -e '2\n' | sudo pacman -S --noconfirm steam"
else
    echo -e "${GREEN}Steam ya está instalado.${NC}"
fi

# Instalar asusctl
if ! is_installed "asusctl"; then
    execute_command "sudo pacman -S --noconfirm asusctl"
else
    echo -e "${GREEN}asusctl ya está instalado.${NC}"
fi

# Instalar Visual Studio Code desde AUR con yay
if ! is_installed "visual-studio-code-bin"; then
    execute_command "yay -S --noconfirm visual-studio-code-bin"
else
    echo -e "${GREEN}Visual Studio Code ya está instalado.${NC}"
fi

echo -e "${GREEN}Todos los programas han sido procesados. Revisa los logs para ver si hubo errores.${NC}"
