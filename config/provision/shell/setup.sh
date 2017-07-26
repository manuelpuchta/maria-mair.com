#!/usr/bin/env bash

function init_localCraftCMSSetup {

	# remove WordPress source file (if it exists)
	# if [ -f /vagrant/latest.tar.gz ]
	# then
	# 	echo -e "Remove latest.tar.gz file."
	# 	rm -f /vagrant/latest.tar.gz
	# fi

	# if necessary, link "manuelpuchta-de" src theme (location: "themes/manuelpuchta-de") to wordpress themes directory (location: "wordpress/wp-content/themes")
	# if ! [[ -L /vagrant/html/wp-content/themes/ && -d /vagrant/html/wp-content/themes/manuelpuchta-de ]]
	# then
	# 	echo -e "Link manuelpuchta-de theme."
	# 	ln -s /vagrant/themes/manuelpuchta-de /vagrant/html/wp-content/themes
	# fi
}

init_localCraftCMSSetup

echo -e "\033[33;35mReady at http://development.maria-mair.com"
