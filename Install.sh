#!/bin/bash

# Ruta al archivo de lista de paquetes
package_list="packageList.txt"

# Ruta al directorio donde se encuentran los archivos de configuración para stow
stow_dir="$HOME/.dotfile/"

# Leer la lista de paquetes desde el archivo
while read -r package; do
    # Instalar el paquete usando sudo pacman -S
    echo "Instalando el paquete: $package"
    sudo pacman -S --needed --noconfirm "$package"
done < "$package_list"

# Usar stow para vincular archivos de configuración
cd "$stow_dir"
stow -t "$HOME/.config" "stow"
cd

echo "Instalación y configuración completadas."
