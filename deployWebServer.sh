#deployWebServer.sh
# Changing the APT sources.list to kambing.ui.ac.id
#sudo cp '/vagrant/sources.list' '/etc/apt/sources.list'

# Updating the repo with the new sources
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install apache2 -y

sudo cat "ServerName 192.168.16.188" >> apache2.conf
sudo systemctl restart apache2
sudo ufw allow in "Apache Full"
sudo apt-get install curl
sudo apt-get install git
# curl http://192.168.16.188
sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql -y

sudo mv /home/vagrant/php-rest-api/dir.conf /etc/apache2/mods-enabled/
sudo systemctl restart apache2

sudo mv /vagrant/phpsuccess.php /var/www/html/
# curl http://192.168.16.188/phpSuccess.php
git clone https://github.com/aufawibowo/php-rest-api
sudo cp -a /home/vagrant/php-rest-api/.* /var/www/html/
