#!/bin/bash
mysql -u root -pvagrant <<-EOF
CREATE DATABASE joomla; 
CREATE USER 'joomla'@'localhost' IDENTIFIED BY 'joomla';
GRANT ALL PRIVILEGES ON joomla.* TO 'joomla'@'localhost';
CREATE USER 'joomla'@'10.0.0.12' IDENTIFIED BY 'joomla';
CREATE USER 'joomla'@'10.0.0.13' IDENTIFIED BY 'joomla';
GRANT SELECT,DELETE,INSERT,UPDATE ON joomla.* TO 'joomla'@'10.0.0.12';
GRANT SELECT,DELETE,INSERT,UPDATE ON joomla.* TO 'joomla'@'10.0.0.13';
FLUSH PRIVILEGES;
EOF
mysql -u root -pvagrant joomla < /vagrant/db/backup_joomla.sql