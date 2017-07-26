#!/usr/bin/env bash

# create wordpress database dump
function create_mysqldump {
    echo -e "Create database dump: craftcms-db.sql."
    mysqldump -u root -pvagrant craftcms > /vagrant/craftcms-db.sql
}

create_mysqldump

echo -e "\033[33;35mDatabase dump created (location: project-directory/craftcms-db.sql) - untracked file that git ignores."
