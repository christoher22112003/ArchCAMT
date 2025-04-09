#!/bin/bash

# Moverse al directorio HOME
cd "$HOME" || { echo "No se pudo acceder al directorio HOME."; exit 1; }

# Descargar RiceInstaller
curl -LO https://raw.githubusercontent.com/gh0stzk/dotfiles/master/RiceInstaller
chmod +x RiceInstaller

# Ejecutar RiceInstaller con respuestas automáticas, incluyendo "no" para reiniciar
(yes || echo "n") | ./RiceInstaller

# Verificar si el instalador finaliza correctamente
if [[ $? -eq 0 ]]; then
    echo "RiceInstaller ejecutado correctamente."
else
    echo "Error al ejecutar RiceInstaller."
    exit 1
fi