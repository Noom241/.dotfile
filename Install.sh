#!/bin/bash

# Lista de paquetes a instalar
packages=("stow" "zsh" "neofetch" "picom" "kitty" "code" "nautilus" "feh" "firefox" "bspwm" "sxhkd" "lightdm" "lightdm-gtk-greeter")

# Ruta al directorio donde se encuentran los archivos de configuración para stow
stow_dir="$HOME/.dotfile/"

# Instalar los paquetes
for package in "${packages[@]}"; do
    # Instalar el paquete usando sudo pacman -S
    echo "Instalando el paquete: $package"
    sudo pacman -S --needed --noconfirm "$package"
done

# Cambiar la shell predeterminada a Zsh
chsh -s $(which zsh)

# Instalar Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Clonar el tema Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Activar los plugins zsh-autosuggestions y zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting



# Usar stow para vincular archivos de configuración
cd "$stow_dir"
stow -tv "$HOME" "stow"
cd

echo "Instalación y configuración completadas."
