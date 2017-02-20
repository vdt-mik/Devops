#!/bin/bash
echo mysql-server mysql-server/root_password select "vagrant" | debconf-set-selections
echo mysql-server mysql-server/root_password_again select "vagrant" | debconf-set-selections