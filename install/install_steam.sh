#                   ,----,                                         
#                 ,/   .`|                                  ____   
#  .--.--.      ,`   .'  :   ,---,.   ,---,               ,'  , `. 
# /  /    '.  ;    ;     / ,'  .' |  '  .' \           ,-+-,.' _ | 
#|  :  /`. /.'___,/    ,',---.'   | /  ;    '.      ,-+-. ;   , || 
#;  |  |--` |    :     | |   |   .':  :       \    ,--.'|'   |  ;| 
#|  :  ;_   ;    |.';  ; :   :  |-,:  |   /\   \  |   |  ,', |  ': 
# \  \    `.`----'  |  | :   |  ;/||  :  ' ;.   : |   | /  | |  || 
#  `----.   \   '   :  ; |   :   .'|  |  ;/  \   \'   | :  | :  |, 
#  __ \  \  |   |   |  ' |   |  |-,'  :  | \  \ ,';   . |  ; |--'  
# /  /`--'  /   '   :  | '   :  ;/||  |  '  '--'  |   : |  | ,     
#'--'.     /    ;   |.'  |   |    \|  :  :        |   : '  |/      
#  `--'---'     '---'    |   :   .'|  | ,'        ;   | |`-'       
#                        |   | ,'  `--''          |   ;/           
#                        `----'                   '---'            

#!/bin/bash

# Habilitar el repositorio multilib
sudo sed -i '/\[multilib\]/,/Include/ s/^#//' /etc/pacman.conf

# Actualizar los repositorios
sudo pacman -Syu

# Instalar steam y seleccionar la opción 2 para lib32-vulkan-driver
echo -e "2\n" | sudo pacman -S --noconfirm steam

echo "Steam instalado correctamente"
