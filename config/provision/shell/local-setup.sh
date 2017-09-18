#!/bin/bash

CRAFT_TEMPLATES=/vagrant/craft/templates
SRC_TEMPLATES=/vagrant/src/templates

# copy craftcms raw installation templates directory to _templates directory
if [ -d $CRAFT_TEMPLATES ] && [ ! -d /vagrant/craft/_templates ]; then
	echo -e "Copy craft/templates to craft/_templates."
	cp -rf $CRAFT_TEMPLATES /vagrant/craft/_templates/
fi

# remove raw craftcms installation templates directory
if [ ! -L $CRAFT_TEMPLATES ] && [ -d $CRAFT_TEMPLATES ]; then
	echo -e "Remove craft/templates directory."
	rm -rf $CRAFT_TEMPLATES
fi

# create a symbolic link of src/templates to craft directory
if [ ! -L $CRAFT_TEMPLATES ]; then
	echo -e "Link src/templates to craft directory."
	ln -s /vagrant/src/templates /vagrant/craft/
fi

echo -e "\033[33;35mReady at http://development.maria-mair.com/"
