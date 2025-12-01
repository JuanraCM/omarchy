# Install all base packages (pacman)
mapfile -t packages < <(grep -v '^#' "$OMARCHY_INSTALL/base.packages" | grep -v '^$')
sudo pacman -S --noconfirm --needed "${packages[@]}"

# Install all AUR packages (yay)
mapfile -t packages < <(grep -v '^#' "$OMARCHY_INSTALL/aur.packages" | grep -v '^$')
MAKEFLAGS="-j$(nproc)" yay -S --noconfirm --needed "${packages[@]}"
