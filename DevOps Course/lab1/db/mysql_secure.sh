#!/bin/bash
# Make sure that NOBODY can access the server without a password
mysql -u root -pvagrant -e "UPDATE mysql.user SET Password = PASSWORD('vagrant') WHERE User = 'root'"
# To disallow remote login for root
mysql -u root -pvagrant -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1')"
# Kill the anonymous users
mysql -u root -pvagrant -e "DELETE FROM mysql.user WHERE User=''"
# Kill off the demo database
mysql -u root -pvagrant -e "DROP DATABASE IF EXISTS test"
mysql -u root -pvagrant -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%'"
# Make our changes take effect
mysql -u root -pvagrant -e "FLUSH PRIVILEGES"