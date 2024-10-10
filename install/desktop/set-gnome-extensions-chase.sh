sudo apt install -y gnome-shell-extension-manager pipx
pipx install gnome-extensions-cli --system-site-packages

# fix path issue for script
pipx ensurepath

source .bashrc

# Turn off default Ubuntu extensions
# gnome-extensions disable ubuntu-dock@ubuntu.com
# gnome-extensions disable ding@rastersoft.com

# Pause to assure user is ready to accept confirmations
gum confirm "To install Gnome extensions, you need to accept some confirmations. Are you ready?"

# Install new extensions
# gext install just-perfection-desktop@just-perfection
# gext install space-bar@luchrioh
gext install tophat@fflewddur.github.io
gext install espresso@coadmunkee.github.com

# Compile gsettings schemas in order to be able to set them
# sudo cp ~/.local/share/gnome-shell/extensions/just-perfection-desktop\@just-perfection/schemas/org.gnome.shell.extensions.just-perfection.gschema.xml /usr/share/glib-2.0/schemas/
# sudo cp ~/.local/share/gnome-shell/extensions/space-bar\@luchrioh/schemas/org.gnome.shell.extensions.space-bar.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/tophat@fflewddur.github.io/schemas/org.gnome.shell.extensions.tophat.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/espresso@coadmunkee.github.com/schemas/org.gnome.shell.extensions.espresso.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

# Configure Just Perfection
# gsettings set org.gnome.shell.extensions.just-perfection animation 2
# gsettings set org.gnome.shell.extensions.just-perfection dash-app-running true
# gsettings set org.gnome.shell.extensions.just-perfection workspace true
# gsettings set org.gnome.shell.extensions.just-perfection workspace-popup false

# Configure Space Bar
# gsettings set org.gnome.shell.extensions.space-bar.behavior smart-workspace-names false
# gsettings set org.gnome.shell.extensions.space-bar.shortcuts enable-activate-workspace-shortcuts false
# gsettings set org.gnome.shell.extensions.space-bar.shortcuts enable-move-to-workspace-shortcuts true
# gsettings set org.gnome.shell.extensions.space-bar.shortcuts open-menu "@as []"

# Configure TopHat
gsettings set org.gnome.shell.extensions.tophat network-usage-unit bits
gsettings set org.gnome.shell.extensions.tophat show-animations false
gsettings set org.gnome.shell.extensions.tophat cpu-display 'numeric'
gsettings set org.gnome.shell.extensions.tophat mem-display 'numeric'
gsettings set org.gnome.shell.extensions.tophat disk-display 'numeric'

# Configure Espresso
gsettings set org.gnome.shell.extensions.espresso restore-state true
gsettings set org.gnome.shell.extensions.espresso show-notifications false
