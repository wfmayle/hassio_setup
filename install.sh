#!/bin/sh
set -e

SSID="Cool SSID Name"
PASSWORD="Cool Password Name"

MACHINE_NAME="intel-nuc"
# Options for MACHINE NAME: 
# intel-nuc 
# odroid-c2 
# odroid-n2
# odroid-xu
# qemuarm
# qemuarm-64
# qemux86
# qemux86-64
# raspberrypi
# raspberrypi2
# raspberrypi3
# raspberrypi4
# raspberrypi3-64
# raspberrypi4-64
# tinker


# This is going to set some basic settings like your keyboard and 
# system language to U.S. English. It will also reload those settings to apply them.
system_settings() {
    # Change Keyboard Layout
    echo "DEBUG: Changing Keyboard Layout..."
    sudo sed -i 's/^XKBLAYOUT=".*\?"/XKBLAYOUT="us"/g' /etc/default/keyboard

    # Modify locale.gen file
    echo "DEBUG: Changing Locales..."
    sudo sed -i 's/^# en_US/en_US/g' /etc/locale.gen
    sudo sed -i 's/^en_GB/# en_GB/g' /etc/locale.gen

    # Generate Locales
    echo "DEBUG: Generating Locales..."
    sudo locale-gen

    # Change Locale
    echo "DEBUG: Updating Locales..."
    sudo update-locale LANG=en_US.UTF-8
    sudo update-locale LANGUAGE=en_US.UTF-8

    # Reload Settings
    . /etc/default/locale
}

# This will add your WiFi SSID and Password so you can't connect to your WiFi.
wifi_config(){
    echo "network={ 
    ssid=$SSID
    psk=$PASSWORD
    key_mgmt=WPA-PSK
}" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
}

# If you haven't enabled SSH already, this will do so.
ssh_enable() {
    # Enable SSH
    echo "DEBUG: Enabling SSH..."
    if [ -n "$(pgrep '[s]shd')" ]; then
        echo "SSHD is already enabled."
    else
        echo "Enabling SSHD."
        sudo systemctl enable sshd
    fi
}

# This will make sure that all software that came with your OS is up to date.
system_software() {
    # Update/Upgrade the Software
    sudo apt-get update || sudo apt update -y
    sudo apt-get upgrade -y
}

# Following the guide from Home Assistant's website, we want to remove any 
# old docker versions and set up our dependencies. 
install_dependencies(){
    sudo apt-get remove \
        docker \
        docker-engine \
        docker.io

    # sudo apt-get install -y \
    #     apparmor-utils \
    #     apt-transport-https \
    #     avahi-daemon \
    #     ca-certificates \
    #     curl \
    #     dbus \
    #     jq \
    #     network-manager \
    #     socat \
    #     docker.io
        
    sudo apt-get install \
        apparmor \
        jq \
        wget \
        curl \
        udisks2 \
        libglib2.0-bin \
        network-manager \
        dbus \
        systemd-journal-remote -y
}


# Make sure we start Docker afterwards, that it runs on startup, and adds 
# your user to the Docker group. Change this.
docker_config(){
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo gpasswd -a pi docker # Change pi to whatever your user is
}

# This installs Home Assistant using Docker
hassio_docker_install(){
    sudo systemctl disable ModemManager
    sudo apt-get purge modemmanager -y

    # curl -sL "https://raw.githubusercontent.com/home-assistant/hassio-installer/master/hassio_install.sh" | sudo bash -s -- -m intel-nuc
    curl -sL "https://raw.githubusercontent.com/home-assistant/supervised-installer/master/installer.sh" | sudo bash -s -- -m $MACHINE_NAME

}