#!/bin/bash

# create craftcms database dump
echo -e "\033[33;36mCreate database dump: craftcms-dump.sql"
mysqldump -u root -pvagrant craftcms > /vagrant/craftcms-dump.sql

echo -e "\033[33;35mDatabase dump created (location: project-root/craftcms-dump.sql) - git ignores this file."
