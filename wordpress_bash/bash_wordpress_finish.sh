#!/bin/bash 
 
YELLOW='\033[1;33m'
NC='\033[0m'

print_step() {
    echo -e "\n${YELLOW}==== $1 ====${NC}"
}
 
print_step "Update system"

sudo apt update -y
sudo apt upgrade -y 
sudo do-release-upgrade -d


print_step "Install package"

sudo apt install -y openssh-server nginx apache2 ghostscript libapache2-mod-php mysql-server php php-bcmath php-curl php-imagick php-intl php-json php-mbstring php-mysql  php-xml  php-zip php-pgsql
 
print_step "Config SSH"

if ! grep -q "PasswordAuthentication no" /etc/ssh/sshd_config; then 
    sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config 
    sudo systemctl restart ssh 
else
    echo "Конфиг уже установлен."
fi
 
print_step "Install and PostgreSQL" 
if ! command -v psql &> /dev/null; then 
    sudo apt install -y postgresql postgresql-contrib 
    sudo systemctl start postgresql 
    sudo systemctl enable postgresql 
else
    echo "Postgresql уже установлен."
fi  
 
print_step "Create DB and user"
if ! sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -qw wordpress; then 
    sudo -u postgres psql -c "CREATE DATABASE wordpress;" 
    sudo -u postgres psql -c "CREATE USER wp WITH PASSWORD '123';" 
    sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE wordpress TO wp;" 
    sudo -u postgres psql -d wordpress -c "GRANT CREATE ON SCHEMA public TO wp;"
    sudo -u postgres psql -c "\\c wordpress; GRANT CREATE ON SCHEMA public TO wp;"
    sudo echo "local   wordpress       wp             md5" >> /etc/postgresql/16/main/pg_hba.conf
else
    echo "База уже существует."
fi 
 
print_step "Install WordPress" 
if [ ! -d "/srv/www/wordpress" ]; then 
    sudo mkdir -p /srv/www 
    sudo chown www-data: /srv/www 
    curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www  
else
    echo "Woordpress уже установлен."
fi

print_step "Pg4wp plugin Wordpress"
if [ ! -d "/srv/www/wordpress/wp-content/pg4wp" ]; then
    cd /srv/www/wordpress/wp-content
    sudo git clone https://github.com/kevinoid/postgresql-for-wordpress.git
    sudo mv postgresql-for-wordpress/pg4wp pg4wp
    sudo cp pg4wp/db.php db.php
    sudo rm -rf /srv/www/wordpress/wp-content/postgresql-for-wordpress
else
    echo "Plugin уже существует."
fi 

print_step "Config Wordpress"

if [ ! -f "/srv/www/wordpress/wp-config.php" ]; then
sudo cp /srv/www/wordpress/wp-config-sample.php /srv/www/wordpress/wp-config.php
sudo chown www-data:www-data /srv/www/wordpress/wp-config.php

    cat <<'EOF' | sudo tee /srv/www/wordpress/wp-config.php > /dev/null
<?php
define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'wp' );
define( 'DB_PASSWORD', '123' );
define( 'DB_HOST', 'localhost' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

define( 'DB_TYPE', 'pgsql' );
define( 'DB_PORT', '5432' );

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );
define('WP_HOME','https://ivanprod.com/wordpress');
define('WP_SITEURL','https://ivanprod.com/wordpress');

$_SERVER["REQUEST_URI"] = str_replace("/wp-admin/", "/wordpress/wp-admin/", $_SERVER["REQUEST_URI"]);
if ( $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https' ) {
    $_SERVER['HTTPS'] = 'on';
    $_SERVER['SERVER_PORT'] = '443';
    define('FORCE_SSL_ADMIN', true);
}
if ( isset($_SERVER['HTTP_X_FORWARDED_HOST']) ) {
    $_SERVER['HTTP_HOST'] = $_SERVER['HTTP_X_FORWARDED_HOST'];
}

if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

require_once( ABSPATH . 'wp-settings.php' );

define( 'WP_USE_EXT_MYSQL', false );
EOF

else
    echo "Конфигурационный файл wp-config.php уже существует."
fi

print_step "Config Apache for WordPress" 

if [ ! -f "/etc/apache2/sites-available/wordpress.conf" ]; then 
    cat <<EOF | sudo tee /etc/apache2/sites-available/wordpress.conf > /dev/null 
<VirtualHost *:8080>
    DocumentRoot /srv/www/wordpress
    ServerName ivanprod.com
    <Directory /srv/www/wordpress>
        Options FollowSymLinks
        AllowOverride Limit Options FileInfo
        DirectoryIndex index.php
        Require all granted
    </Directory>
    <Directory /srv/www/wordpress/wp-content>
        Options FollowSymLinks
        Require all granted
    </Directory>
</VirtualHost> 
EOF 


    sudo a2ensite wordpress.conf
    sudo a2enmod rewrite
    sudo a2dissite 000-default
    sudo sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf 
    sudo systemctl restart apache2 
    sudo systemctl enable apache2 

else
    echo "Конфигурационный файл wordpress.conf уже существует."
fi
 
 
print_step "Config Nginx" 

if [ ! -f "/etc/nginx/ssl/ivanprod.key" ] || [ ! -f "/etc/nginx/ssl/ivanprod.crt" ]; then 
    sudo mkdir -p /etc/nginx/ssl
    sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/ivanprod.key -out /etc/nginx/ssl/ivanprod.crt -subj "/C=RU/ST=Minsk/L=Minsk/O=ivan11/OU=IT/CN=ivanprod.com" 
else
    echo "Ключи уже существуют."
fi 
 
if [ ! -f "/etc/nginx/sites-available/word.conf" ]; then 
    cat <<'EOF' | sudo tee /etc/nginx/sites-available/word.conf > /dev/null 
server {
    listen 80;
    server_name ivanprod.com;
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl;
    server_name ivanprod.com;
    ssl_certificate /etc/nginx/ssl/ivanprod.crt;
    ssl_certificate_key /etc/nginx/ssl/ivanprod.key;


    location /wordpress/ {
        proxy_pass http://localhost:8080/;
	include proxy_params;
    }

    location / {
        root /usr/share/nginx/html;
        index myindex.html;
    }

}
EOF

else
    echo "Конфигурационный файл уже существует."
fi


if [ ! -L "/etc/nginx/sites-enabled/word.conf" ]; then
    sudo ln -s /etc/nginx/sites-available/word.conf /etc/nginx/sites-enabled/
    sudo rm /etc/nginx/sites-enabled/default
    sudo nginx -t 
    sudo systemctl restart nginx 
    sudo systemctl enable nginx 

else
    echo "Символическая ссылка уже существует."
fi

print_step "create HTML " 

if [ ! -f /usr/share/nginx/html/myindex.html ]; then
    sudo tee /usr/share/nginx/html/myindex.html > /dev/null <<EOT
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to My Server</title>
</head>
<body>
    <h1>Welcome to My Server</h1>
    <p>This is a simple HTML page created by the setup script.</p>
    <p>To access WordPress, please go to <a href="/wordpress">/wordpress</a>.</p>
</body>
</html>
EOT

else
    echo "HTML уже существует."
fi
 
print_step "Config ufw"

sudo ufw allow 80/tcp 
sudo ufw allow 443/tcp 
sudo ufw allow 22/tcp
sudo ufw allow 8080/tcp 
sudo ufw --force enable 
 
print_step "Add hosts" 
if ! grep -q "ivanprod.com" /etc/hosts; then 
    echo "127.0.0.1 ivanprod.com" | sudo tee -a /etc/hosts 
else
    echo "Host уже существует."
fi
 

echo "- Основная страница: https://ivanprod.com" 
echo "- WordPress: https://ivanprod.com/wordpress"