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

# Obtener el nombre de usuario actual
USER=$(whoami)

# Ruta de origen y destino
SRC="$(pwd)/files/sxhkdrc"
DEST="/home/$USER/.config/bspwm/src/sxhkdrc"

# Crear el directorio de destino si no existe
mkdir -p $(dirname $DEST)

# Copiar el archivo
cp $SRC $DEST

echo "Archivo copiado a $DEST"

# Esperar 5 segundos
sleep 5

# Llamar al script de instalación
/home/$USER/ArchCAMT/install_programs.sh
