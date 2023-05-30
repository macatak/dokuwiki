#!/bin/bash

# docuwiki ubuntu install
# https://www.dokuwiki.org/install:ubuntu

# useful plugins to install
# mindthedark - dark theme - https://www.dokuwiki.org/template:mindthedark?s[]=mindthedark
# notes - allows text highlighing - https://www.dokuwiki.org/plugin:note?s[]=note
# tags - add tags - https://www.dokuwiki.org/plugin:tag



# pre-reqs
sudo apt install -y install apache2 libapache2-mod-php php-xml

# enable Apache Rewrite module.
sudo a2enmod rewrite

# Download and uncompress the latest stable release.
cd /var/www
sudo wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
sudo tar xvf dokuwiki-stable.tgz
sudo mv dokuwiki-*/ dokuwiki

# Change permissions.
sudo chown -R www-data:www-data /var/www/dokuwiki

# Change document root in Apache to point to /var/www/dokuwiki
echo "Replace"
echo "DocumentRoot /var/www/html"
echo "...with..."
echo "DocumentRoot /var/www/dokuwiki"
read -p "Press enter to edit file"
sudo nano /etc/apache2/sites-enabled/000*.conf

# testing purposes 
# create a new file in /etc/apache2/sites-available
sudo touch /etc/apache2/sites-available/apache2-dokuwiki.conf
# add dokuwiki
# sudo issue in Kali so switching to root
sudo su
echo "<VirtualHost 127.0.0.1>" >> /etc/apache2/sites-available/apache2-dokuwiki.conf
echo "        DocumentRoot /var/www/dokuwiki" >> /etc/apache2/sites-available/apache2-dokuwiki.conf
echo " 	ServerName localhost" >> /etc/apache2/sites-available/apache2-dokuwiki.conf
echo "</VirtualHost>" >> /etc/apache2/sites-available/apache2-dokuwiki.conf
# switch back to regular user
exit

# enable the new project by placing it into /etc/apache2/sites-enabled 
sudo a2ensite apache2-dokuwiki

# reload apache2 service
sudo service apache2 reload

# Change AllowOverrides setting in Apache2 to use .htaccess files for security.
echo "replace ..."
echo "AllowOverride None"
echo "... with ..."
echo "AllowOverride All"

read -p "Press enter to edit file"
sudo nano /etc/apache2/apache2.conf

# lock it down for localhost traffic
echo "comment out ..."
echo "Listen 80"
echo "... with ..."
echo "Listen 127.0.0.1:80"
read -p "Press enter to edit file"
sudo nano  /etc/apache2/ports.conf


# Restart Apache2 service.
sudo service apache2 restart

echo "go to 127.0.0.1/install.php to get started"
echo "Delete the install.php file after finished installing"
echo "sudo rm /var/www/dokuwiki/install.php"
