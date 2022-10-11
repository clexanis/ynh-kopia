#!/bin/bash
: # Fix for shellcheck to work only on block instead on the whole file

#=================================================
# COMMON VARIABLES
#=================================================

# Install Kopia with apt repository
install_kopia_with_repo () {
	# Check and download key if didn't exist
	ynh_install_extra_repo -r "deb http://packages.kopia.io/apt/ stable main" -k "https://kopia.io/signing-key" -n "kopia"
	ynh_package_install kopia
}

uninstall_kopia_with_repo () {
	ynh_remove_extra_repo -n "kopia"
	ynh_package_autopurge kopia
}
