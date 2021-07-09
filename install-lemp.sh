#!/bin/bash

if [ $USER == 'root' ]
then
    echo ""
    echo "********************************************"
    echo "* Run this as your user, NOT root or sudo! *"
    echo "********************************************"

else
    echo ""
    echo "**************************************"
    echo "* Installing Nginx, PHP, and MariaDB *"
    echo "**************************************"

    sudo dnf install nginx php php-fpm php-common composer
    sudo dnf install php-pdo php-gd php-mbstring php-mcrypt php-xml
    sudo dnf install mariadb-server

    sudo systemctl enable nginx
    sudo systemctl start nginx

    sudo systemctl enable mariadb
    sudo systemctl start mariadb

    echo ""
    echo ""
    echo "***********************"
    echo "* Setting Permissions *"
    echo "***********************"

    sudo chown -R $USER /var/www/html/
    sudo find /var/www/html -type d -exec chmod u+rwx {} +
    sudo find /var/www/html -type f -exec chmod u+rw {} +

    sudo find /var/www/html -type d -exec chmod g+s {} +

    printf "<?php\n\techo phpinfo();\n?>" > /usr/share/nginx/html/info.php

    echo ""
    echo ""
    echo "*********************************"
    echo "* Setting a root MySQL password *"
    echo "*********************************"

    sudo mysql_secure_installation

    echo ""
    echo ""
    echo "****************************************************************"
    echo "*                    Install Complete!                         *"
    echo "****************************************************************"
    echo "*                                                              *"
    echo "* - Visit 'http://localhost/info.php' to confirm PHP is set up *"
    echo "* - Your document root is set to: '/usr/share/nginx/html'     *"
    echo "* - Your nginx config is at: '/etc/nginx/nginx.conf'           *"
    echo "* - Your php config is at: '/etc/php.ini'                      *"
    echo "* - Log into mysql with: 'mysql -u root -p'                    *"
    echo "*                                                              *"
    echo "* - Restart nginx: 'sudo systemctl restart nginx'              *"
    echo "* - Restart mysql: 'sudo systemctl restart mariadb'            *"
    echo "*                                                              *"
    echo "****************************************************************"
fi