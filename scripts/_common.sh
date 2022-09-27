#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================
# App package root directory should be the parent folder
pkp_dependencies="wget"

# Install Kopia with apt repo
install_kopia_with_repo () {
	# Check and download key if didn't exist
	if [ ! -f /etc/apt/trusted.gpg.d/kopia.gpg ]; then
		wget -qO - https://kopia.io/signing-key | apt-key --keyring /etc/apt/trusted.gpg.d/kopia.gpg add -
	fi
	# Add repo if it didn't exist
	if [ ! -f /etc/apt/sources.list.d/kopia.list ]; then
		printf "deb http://packages.kopia.io/apt/ stable main" | tee /etc/apt/sources.list.d/kopia.list
		apt-get update
	fi
	apt-get install kopia
}
