#!/bin/bash

# copy craftcms raw installation templates directory to _templates directory
if [ -d /vagrant/craft/templates ] && [ ! -d /vagrant/craft/_templates ]; then
	echo -e "Copy craft/templates to craft/_templates."
	cp -rf /vagrant/craft/templates /vagrant/craft/_templates
fi

# remove raw craftcms installation templates directory
if [ ! -L /vagrant/craft/templates ] && [ -d /vagrant/craft/templates ]; then
	echo -e "Remove craft/templates directory."
	rm -rf /vagrant/craft/templates
fi

# create a symbolic link of src/templates to craft directory
if [ ! -L /vagrant/craft/templates ]; then
	echo -e "Link src/templates to craft directory."
	ln -s /vagrant/src/templates /vagrant/craft
fi

echo -e "\033[33;35mReady at http://development.maria-mair.com/"
