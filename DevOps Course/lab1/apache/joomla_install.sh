#!/bin/bash
cd /tmp/
wget -nv https://downloads.joomla.org/cms/joomla3/3-6-5/joomla_3-6-5-stable-full_package-tar-bz2?format=bz2 #-i /joomla_3-6-5-stable-full_package.tar.bz2
mv joomla_3-6-5-stable-full_package-tar-bz2\?format\=bz2 joomla_3-6-5-stable-full_package.tar.bz2
mkdir -m 0755 /var/www/html/joomla
cd /var/www/html/joomla
tar -xjf /tmp/joomla_3-6-5-stable-full_package.tar.bz2
cp /vagrant/apache/configuration.php /var/www/html/joomla/configuration.php
chown -R www-data:www-data /var/www/html/joomla
rm -r /var/www/html/joomla/installation
