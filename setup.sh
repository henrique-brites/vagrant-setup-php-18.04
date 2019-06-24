#!/bin/bash

echo "---- Iniciando instalacao do ambiente de Desenvolvimento PHP Brites_H ---"

echo '----------- Máquina virtual de provisionamento ----------------'
sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile

echo "--- Atualizando lista de pacotes ---"
sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade > /dev/null 2>&1

echo "--- Definindo Senha padrao para o MySQL e suas ferramentas ---"

DEFAULTPASS="vagrant"
sudo debconf-set-selections <<EOF
mysql-server	mysql-server/root_password password $DEFAULTPASS
mysql-server	mysql-server/root_password_again password $DEFAULTPASS
dbconfig-common	dbconfig-common/mysql/app-pass password $DEFAULTPASS
dbconfig-common	dbconfig-common/mysql/admin-pass password $DEFAULTPASS
dbconfig-common	dbconfig-common/password-confirm password $DEFAULTPASS
dbconfig-common	dbconfig-common/app-password-confirm password $DEFAULTPASS
phpmyadmin		phpmyadmin/reconfigure-webserver multiselect apache2
phpmyadmin		phpmyadmin/dbconfig-install boolean true
phpmyadmin      phpmyadmin/app-password-confirm password $DEFAULTPASS 
phpmyadmin      phpmyadmin/mysql/admin-pass     password $DEFAULTPASS
phpmyadmin      phpmyadmin/password-confirm     password $DEFAULTPASS
phpmyadmin      phpmyadmin/setup-password       password $DEFAULTPASS
phpmyadmin      phpmyadmin/mysql/app-pass       password $DEFAULTPASS
EOF

echo "--- Atualizando lista de pacotes ---"
sudo apt-get update

echo "--- Instalando pacotes basicos ---"
sudo apt-get install software-properties-common vim curl git git-core zip unzip --assume-yes > /dev/null 2>&1

echo "--- Adicionando repositorio do pacote PHP ---"
sudo add-apt-repository -y ppa:ondrej/php

echo "--- Atualizando lista de pacotes ---"
sudo apt-get update

echo "--- Instalando o Apache2 ---"
sudo apt-get -y install apache2 > /dev/null 2>&1

echo "--- Instalando MySQL, Phpmyadmin e alguns outros modulos ---"
sudo apt-get install mysql-server-5.* mysql-client phpmyadmin --assume-yes > /dev/null 2>&1

echo "--- Atualizando lista de pacotes ---"
sudo apt-get update

echo "--- Instalando PHP, Apache e alguns modulos ---"
sudo apt-get install php7.3-cli libapache2-mod-php7.3 php7.3-mysql php7.3-curl php-memcached php7.3-dev  php7.3-pgsql php7.3-sqlite3 php7.3-mbstring php7.3-gd php7.3-json php7.3-xmlrpc php7.3-xml php7.3-zip php7.3-bcmath php7.3-soap php7.3-intl php7.3-readline   --assume-yes > /dev/null 2>&1

echo "--- Atualizando lista de pacotes ---"
sudo apt-get update

echo "--- Habilitando o PHP 7.3 ---"
sudo a2enmod php7.3

echo "--- Atualizando lista de pacotes ---"
sudo apt-get update

echo "--- Habilitando mod-rewrite do Apache ---"
sudo a2enmod rewrite

echo "--- Reiniciando Apache ---"
sudo service apache2 restart

echo "--- Atualizando lista de pacotes ---"
sudo apt-get update

echo "--- Baixando e Instalando Composer ---"
sudo curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
#curl -sS https://getcomposer.org/installer | php
#sudo mv composer.phar /usr/local/bin/composer

echo "--- Corrigindo o proble ma de memoria ---"
sudo /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
#sudo /sbin/mkswap /var/swap.1
#sudo /sbin/swapon /var/swap.1
sudo composer self-update


echo "--- Atualizando lista de pacotes ---"
sudo apt-get update

# Instale mais aplicativos apartir daqui

echo "[OK] --- Ambiente de desenvolvimento concluido ---"
#https://www.youtube.com/watch?v=MlACzrm0SCw
