# Self-contained Wordpress 5.5 Docker Image
This image is

## How to run
```
$ docker run --rm --name container-name -p 8000:80 -v "$PWD":/var/www/html carlouni/wordpress
```

## How to share plugin directory

```
docker run --rm --name container-name -p 8000:80 -v "$PWD":/var/www/html/wp-content/plugins/ carlouni/wordpress
```

## Troubleshooting
When running from a Linux machine, if you want Apache to have writing access to your shared folder, you might need to override the UID and GID of Apache with the same values of your Linux user.

```
$ docker run --name container-name -p 80:80 -v "$PWD":/var/www/html -e APACHE_USER_ID="$UID" -e APACHE_GROUP_ID="$GID" carlouni/apache-php7.2:latest
```
