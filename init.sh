# rewrite Apache UID and GID for writing access to /var/www/html
# sudo docker run --name container-name -p 80:80 -v "$PWD":/var/www/html -e USER_ID='1000' -e GROUP_ID='1000' apache-php7
user_id="${APACHE_USER_ID:-1000}"
group_id="${APACHE_GROUP_ID:-1000}"
usermod -u "$user_id" www-data
groupmod -g "$group_id" www-data

# Start supervisord
supervisord