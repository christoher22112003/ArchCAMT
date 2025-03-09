#            ____    ,--,    ___                         
#         ,'  , `.,--.'|  ,--.'|_  ,-.----.             
#      ,-+-,.' _ ||  | :  |  | :,' \    /  \            
#   ,-+-. ;   , ||:  : '  :  : ' : |   :    |           
#  ,--.'|'   |  |||  ' |.;__,'  /  |   | .\ :   ,---.   
# |   |  ,', |  |,'  | ||  |   |   .   : |: |  /     \  
# |   | /  | |--' |  | ::__,'| :   |   |  \ : /    /  | 
# |   : |  | ,    '  : |__'  : |__ |   : .  |.    ' / | 
# |   : |  |/     |  | '.'|  | '.'|:     |`-''   ;   /| 
# |   | |`-'      ;  :    ;  :    ;:   : :   '   |  / | 
# |   ;/          |  ,   /|  ,   / |   | :   |   :    | 
# '---'            ---`-'  ---`-'  `---'.|    \   \  /  
#                                    `---`     `----'                                                  

#!/bin/bash

# Actualizar los repositorios
sudo pacman -Syu

# Instalar pavucontrol y blueman
sudo pacman -S --noconfirm pavucontrol blueman

echo "pavucontrol y blueman instalados correctamente"
