# Apache/2.4.29 and PHP 7.2 Docker Image

## How to run
```
$ docker run --name container-name -p 80:80 -v "$PWD":/var/www/html carlouni/apache-php7.2:latest
```

## Troubleshooting
When running from a Linux machine, if you want Apache to have writing access to your container shared folder, you might need to override the UID and GID of Apache with the same values of your Linux user.

```
$ docker run --name container-name -p 80:80 -v "$PWD":/var/www/html -e APACHE_USER_ID="$UID" -e APACHE_GROUP_ID="$GID" carlouni/apache-php7.2:latest
```
