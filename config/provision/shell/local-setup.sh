#!/usr/bin/env bash

function init_localCraftcmsSetup {

	# copy craftcms templates directory to _templates directory
	if [[ -d /vagrant/craft/templates && ! -d /vagrant/craft/_templates ]]
	then
		echo -e "Copy craft/templates to craft/_templates."
		cp -rf /vagrant/craft/templates /vagrant/craft/_templates
	fi

	# delete craftcms templates directory and link src templates folder to craft directory
	if ! [[ -L /vagrant/craft/templates && -d /vagrant/craft/templates ]]
	then
		echo -e "Remove craft/templates directory."
		rm -rf /vagrant/craft/templates
		echo -e "Link src/templates to craft directory."
		ln -s /vagrant/src/templates /vagrant/craft
	fi
}

init_localCraftcmsSetup

echo -e "\033[33;35mReady at http://development.maria-mair.com/"
