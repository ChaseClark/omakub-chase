# Ensure computer doesn't go to sleep or lock while installing
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

# Function to prompt for yes/no
prompt_yes_no() {
    while true; do
        read -p "$1 (y/n): " answer
        case $answer in
            [Yy]* ) return 0;;  # Yes
            [Nn]* ) return 1;;  # No
            * ) echo "Please answer yes or no.";;
        esac
    done
}

# Run terminal installers
for installer in ~/.local/share/omakub-chase/install/desktop/*.sh
do 
    if prompt_yes_no "Run $installer ?"; then
        source $installer 
    else
        echo "skipping $installer"
    fi
done

# Revert to normal idle and lock settings
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300

# Logout to pickup changes
gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot

