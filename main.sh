#                                                                                             ,----, 
#                                                                               ____        ,/   .`| 
#   ,---,                          ,---,      ,----..     ,---,               ,'  , `.    ,`   .'  : 
#  '  .' \                       ,--.' |     /   /   \   '  .' \           ,-+-,.' _ |  ;    ;     / 
# /  ;    '.      __  ,-.        |  |  :    |   :     : /  ;    '.      ,-+-. ;   , ||.'___,/    ,'  
# :  :       \   ,' ,'/ /|        :  :  :    .   |  ;. /:  :       \    ,--.'|'   |  ;||    :     |   
# :  |   /\   \  '  | |' | ,---.  :  |  |,--..   ; /--` :  |   /\   \  |   |  ,', |  ':;    |.';  ;   
# |  :  ' ;.   : |  |   ,'/     \ |  :  '   |;   | ;    |  :  ' ;.   : |   | /  | |  ||`----'  |  |   
# |  |  ;/  \   \'  :  / /    / ' |  |   /' :|   : |    |  |  ;/  \   \'   | :  | :  |,    '   :  ;   
# '  :  | \  \ ,'|  | ' .    ' /  '  :  | | |.   | '___ '  :  | \  \ ,';   . |  ; |--'     |   |  '   
# |  |  '  '--'  ;  : | '   ; :__ |  |  ' | :'   ; : .'||  |  '  '--'  |   : |  | ,        '   :  |   
# |  :  :        |  , ; '   | '.'||  :  :_:,''   | '/  :|  :  :        |   : '  |/         ;   |.'    
# |  | ,'         ---'  |   :    :|  | ,'    |   :    / |  | ,'        ;   | |`-'          '---'      
# `--''                  \   \  / `--''       \   \ .'  `--''          |   ;/                         
#                         `----'               `---`                   '---'                                                                                                 

#!/bin/bash

# Colores
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # Sin color

# Preguntar si desea ejecutar el script
echo -e "${YELLOW}¿Desea ejecutar el script de configuración del entorno? (s/n)${NC}"
read -r respuesta

if [[ $respuesta != "s" ]]; then
    echo -e "${RED}Ejecución cancelada.${NC}"
    exit 1
fi

# Obtener el nombre de usuario actual
USER=$(whoami)

# Ruta de origen y destino
SRC="$(pwd)/config/sxhkdrc"
DEST="/home/$USER/.config/bspwm/src/sxhkdrc"

# Crear el directorio de destino si no existe
mkdir -p $(dirname $DEST)

# Copiar el archivo
cp $SRC $DEST

if [[ $? -eq 0 ]]; then
    echo -e "${GREEN}Archivo copiado a $DEST correctamente.${NC}"
else
    echo -e "${RED}Error al copiar el archivo a $DEST.${NC}"
    exit 1
fi

# Esperar 5 segundos
sleep 5

# Function to execute installation scripts
execute_scripts() {
    local scripts_path=$1
    for script in "$scripts_path"/*.sh; do
        echo -e "${YELLOW}Ejecutando $script...${NC}"
        if bash "$script"; then
            echo -e "${GREEN}$script ejecutado correctamente.${NC}"
        else
            echo -e "${RED}Error al ejecutar $script.${NC}"
            exit 1
        fi
    done
}

# Dar permisos de ejecución a los scripts de instalación
chmod +x /home/$USER/ArchCAMT/scripts/install/*.sh

# Ejecutar los scripts de instalación en orden
execute_scripts "/home/$USER/ArchCAMT/scripts/install"
