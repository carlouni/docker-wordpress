# Self-contained Wordpress 5.5 Docker Image
This image contains all the required stack for running WP. Ideal for plugins and themes development environment. This is not intended to be used on a production environment.

## Platform
Ubuntu 18.04, Apache/2.4.29, MySQL 5.7.31, and PHP 7.2

## How to run
```
$ docker run --rm --name container-name -p 8000:80 carlouni/wordpress
```
After the container has initialized, go to http://localhost:8000/ to access the site

## Log in to admin panel
Go to http://localhost:8000/wp-admin/ and use credentials below
```
User: admin
Password: securepass
```

## How to share the plugins directory

```
docker run --rm --name container-name -p 8000:80 -v "$PWD":/var/www/html/wp-content/plugins/ carlouni/wordpress
```

## How to persist WP database data
```
$ docker run --name container-name -p 8000:80 -v your-volume:/var/lib/mysql carlouni/wordpress
```

## Troubleshooting
When running from a Linux machine, if you want Apache to have writing access to your shared folder, you might need to override the UID and GID of Apache with the same values of your Linux user.

```
$ docker run --rm --name container-name -p 8000:80 -e APACHE_USER_ID="$UID" -e APACHE_GROUP_ID="$GID" carlouni/wordpress
```
