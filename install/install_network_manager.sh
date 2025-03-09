# ___                   ,-.  
#              ,--.'|_             ,--/ /|  
#      ,---,   |  | :,'   __  ,-.,--. :/ |  
#  ,-+-. /  |  :  : ' : ,' ,'/ /|:  : ' /   
# ,--.'|'   |.;__,'  /  '  | |' ||  '  /    
# |   |  ,"' ||  |   |   |  |   ,''  |  :    
# |   | /  | |:__,'| :   '  :  /  |  |   \   
# |   | |  | |  '  : |__ |  | '   '  : |. \  
# |   | |  |/   |  | '.'|;  : |   |  | ' \ \ 
# |   | |--'    ;  :    ;|  , ;   '  : |--'  
# |   |/        |  ,   /  ---'    ;  |,'     
# '---'          ---`-'           '--'       

#!/bin/bash

# Actualizar los repositorios
sudo pacman -Syu

# Instalar Network Manager y su applet
sudo pacman -S --noconfirm network-manager network-manager-applet

# Habilitar y arrancar el servicio de Network Manager
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager

# Conectar a la red "Christopher Muzo"
nmcli dev wifi connect "Christopher Muzo" password "1850249820"

# Conectar a la red "MinosÉacoRadamantis"
nmcli dev wifi connect "MinosÉacoRadamantis" password "7t&A9Mc7ddr@k$"

echo "Network Manager y conexiones configuradas correctamente"
