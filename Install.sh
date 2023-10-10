#!/bin/bash

# Lista de paquetes a instalar
packages=("stow" "zsh" "neofetch" "picom" "kitty" "code" "nautilus" "feh" "firefox")

# Ruta al directorio donde se encuentran los archivos de configuración para stow
stow_dir="$HOME/.dotfile/"

# Instalar los paquetes
for package in "${packages[@]}"; do
    # Instalar el paquete usando sudo pacman -S
    echo "Instalando el paquete: $package"
    sudo pacman -S --needed --noconfirm "$package"
done

# Usar stow para vincular archivos de configuración
cd "$stow_dir"
stow -t "$HOME/.config" "stow"
cd

echo "Instalación y configuración completadas."
