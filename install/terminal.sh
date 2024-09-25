# Needed for all installers
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl git unzip

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
for installer in ~/.local/share/omakub-chase/install/terminal/*.sh 
do 
    if prompt_yes_no "Do you want to continue?"; then
        source $installer 
    else
        echo "skipping $installer"
    fi
done
