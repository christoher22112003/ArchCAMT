# ArchCAMT

<h1 style="font-size: 2.5em;">Configuración de Arch Linux (Versión 2025.02.01)</h1>

Bienvenido a **ArchCAMT**, mi repositorio de configuraciones personalizadas para Arch Linux. Este proyecto está inspirado en la personalización del repositorio [gh0stzk/dotfiles](https://github.com/gh0stzk/dotfiles), especialmente en el tema **Emilia**, que ha servido como base para crear un entorno único y funcional.

---

<h2 style="font-size: 2em;">¿Qué incluye este repositorio?</h2>

Este repositorio contiene mis **dotfiles** (archivos de configuración) para Arch Linux, optimizados para mi flujo de trabajo y preferencias estéticas. Aquí encontrarás:

- **Temas personalizados**: Basados en el tema **Emilia** de [gh0stzk/dotfiles](https://github.com/gh0stzk/dotfiles).
- **Configuraciones de ventanas y escritorio**: Ajustes para mejorar la productividad y la apariencia visual.
- **Scripts útiles**: Automatización de tareas comunes en Arch Linux.
- **Configuraciones de terminal**: Perfiles de shell, aliases y funciones personalizadas.

---

<h2 style="font-size: 2em;">¿Cómo usar estos dotfiles?</h2>

1. **Clona este repositorio**:
   ```bash
   git clone https://github.com/christoher22112003/ArchCAMT.git
   cd ArchCAMT
   chmod +x setup_environment
   ./setup_environment
   ```

<h1 style="text-align: center; color: red; font-size: 2em;">⚠️ ¡ADVERTENCIA! ⚠️</h1>

<p style="text-align: center; color: red; font-weight: bold;">
   Estos dotfiles <strong>SOLAMENTE</strong> funcionan si previamente has instalado y configurado el repositorio adjunto: <a href="https://github.com/gh0stzk/dotfiles">gh0stzk/dotfiles</a>. 
   <br>
   ⚠️ Asegúrate de seguir las instrucciones del repositorio base antes de usar estos archivos. ⚠️
</p>

💾 **Instalación:**

**Nota:** El instalador solo funciona para **Arch Linux** y distribuciones basadas en Arch.

1. **Abre una terminal en tu directorio HOME** y descarga el instalador:
   ```bash
   curl -LO https://raw.githubusercontent.com/gh0stzk/dotfiles/master/RiceInstaller
   
   # Tal vez un URL mas corto?
   
   curl -LO http://gh0stzk.github.io/dotfiles/RiceInstaller

2. **Ahora déle permisos de ejecución**
   ```bash
   chmod +x RiceInstaller

3. **Finalmente ejecute el instalador**
    ```bash
    ./RiceInstaller
