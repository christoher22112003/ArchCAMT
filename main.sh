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
    pacman -Qi "$package" &>/dev/null || yay -Qi "$package" &>/dev/null
}

# Habilitar el repositorio multilib
execute_command "sudo sed -i '/\[multilib\]/,/Include/ s/^#//' /etc/pacman.conf"

# Actualizar los repositorios
execute_command "sudo pacman -Syu --noconfirm"

# Instalar yay si no está instalado
if ! command -v yay &>/dev/null; then
    echo -e "${YELLOW}yay no está instalado. Instalando yay...${NC}"
    execute_command "sudo pacman -S --noconfirm git base-devel"
    execute_command "git clone https://aur.archlinux.org/yay.git ~/yay"
    execute_command "cd ~/yay && makepkg -si --noconfirm"
else
    echo -e "${GREEN}yay ya está instalado.${NC}"
fi

# Preguntar por las opciones de NVIDIA
NVIDIA_OPTIONS=""
read -p "Ingrese las opciones para la instalación de NVIDIA (ej: --needed --rebuild, dejar en blanco para default): " NVIDIA_OPTIONS

# Preguntar por la opción de Steam
STEAM_CHOICE=""
echo -e "${YELLOW}Opciones para la instalación de Steam:${NC}"
echo "1: steam"
echo "2: steam-native-runtime"
read -p "Seleccione una opción para la instalación de Steam (1 o 2): " STEAM_CHOICE

# Validar la opción de Steam
while [[ "$STEAM_CHOICE" != "1" && "$STEAM_CHOICE" != "2" ]]; do
  echo "Opción inválida. Por favor, seleccione 1 o 2."
  read -p "Seleccione una opción para la instalación de Steam (1 o 2): " STEAM_CHOICE
done

# Ejecutar install_all.sh con las opciones de NVIDIA y Steam
./scripts/install/install_all.sh "$NVIDIA_OPTIONS" "$STEAM_CHOICE"

# Instalar Network Manager y su applet
if ! is_installed "networkmanager" && ! is_installed "network-manager-applet"; then
    execute_command "sudo pacman -S --noconfirm networkmanager network-manager-applet"
else
    echo -e "${GREEN}networkmanager y network-manager-applet ya están instalados.${NC}"
fi

# Habilitar y empezar NetworkManager
execute_command "sudo systemctl enable NetworkManager"
execute_command "sudo systemctl start NetworkManager"

# Conectar a redes Wi-Fi (comentado)
#execute_command "nmcli dev wifi connect 'Christopher Muzo' password '1850249820'"
#execute_command "nmcli dev wifi connect 'MinosÉacoRadamantis' password '7t&A9Mc7ddr@k$'"
#execute_command "nmcli dev wifi connect 'PUCESA' password 'PUCEWIFI2015'"

# Instalar pavucontrol y blueman
if ! is_installed "pavucontrol" && ! is_installed "blueman"; then
    execute_command "sudo pacman -S --noconfirm pavucontrol blueman"
else
    echo -e "${GREEN}pavucontrol y blueman ya están instalados.${NC}"
fi

# Instalar asusctl
if ! is_installed "asusctl"; then
    execute_command "sudo pacman -S --noconfirm asusctl"
else
    echo -e "${GREEN}asusctl ya está instalado.${NC}"
fi

# Instalar Visual Studio Code desde AUR
if ! is_installed "visual-studio-code-bin"; then
    execute_command "yay -S --noconfirm visual-studio-code-bin"
else
    echo -e "${GREEN}Visual Studio Code ya está instalado.${NC}"
fi

# ================================
# BLOQUE COMENTADO: RiceInstaller
# ================================
#: '
# echo -e "${YELLOW}Ejecutando RiceInstaller...${NC}"
# cd "$HOME" || { echo "No se pudo acceder al directorio HOME."; exit 1; }
# curl -LO https://raw.githubusercontent.com/gh0stzk/dotfiles/master/RiceInstaller
# chmod +x RiceInstaller
# (yes || echo "n") | ./RiceInstaller
# if [[ $? -eq 0 ]]; then
#     echo "RiceInstaller ejecutado correctamente."
# else
#     echo "Error al ejecutar RiceInstaller."
#     exit 1
# fi
# '

echo -e "${GREEN}Todos los programas han sido procesados. Revisa los logs para ver si hubo errores.${NC}"