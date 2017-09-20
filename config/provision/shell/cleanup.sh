#!/bin/bash

CRAFT_INSTALLATION=/vagrant/craft

# remove craft installation
echo -e "\033[33;36mRemove directory: craft"
rm -rf $CRAFT_INSTALLATION

echo -e "\033[33;35mCraft installation folder deleted."
