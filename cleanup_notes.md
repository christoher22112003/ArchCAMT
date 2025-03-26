# Notas de Limpieza

## Ejecución Optimizada de Scripts

### Título: Ejecución Modularizada de Scripts
**Descripción:** El proceso de ejecución de scripts en `main.sh` se ha modularizado utilizando una función (`execute_scripts`). Esto asegura una mejor legibilidad y mantenibilidad, mientras se preserva el orden específico de ejecución. Además, la salida ahora está codificada por colores:
- **Verde:** Indica que un script se ejecutó correctamente.
- **Rojo:** Indica un error durante la ejecución.

### Cambios:
1. Se añadió una función `execute_scripts` para manejar la ejecución de los scripts de instalación.
2. Se aseguró que el orden de ejecución permanezca sin cambios.
3. Se mejoró el registro con mensajes codificados por colores para mayor visibilidad.

---

## Consolidación de Scripts de Instalación

### Título: Script de Instalación Unificado
**Descripción:** Todos los scripts de instalación individuales se han consolidado en un único script (`install_all.sh`). Esto simplifica el proceso de instalación y asegura que todos los paquetes y configuraciones requeridos se manejen en un solo lugar. El script también incluye la instalación de `asusctl`.

### Cambios:
1. Se fusionaron las funcionalidades de `install_steam.sh`, `install_NVIDIA.sh`, `install_network_manager.sh` y `install_multiple.sh` en `install_all.sh`.
2. Se añadió la instalación de `asusctl` al final del script.
3. Se actualizó `main.sh` para ejecutar el script consolidado en lugar de los scripts individuales.
