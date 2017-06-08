# Docker for Contao (PHP7-FPM - NGINX - MySQL - ELK)

This Project was originally forked from [maxpou/docker-symfony](https://github.com/maxpou/docker-symfony).  
**Thank you Maxence for that great work :-)**

contao-docker gives you everything you need for developing contao 4.x application.
This complete stack run with docker and [docker-compose (1.7 or higher)](https://docs.docker.com/compose/).

## Installation

1. Create a `.env` from the `.env.dist` file. Adapt it according to your symfony application

    ```bash
    cp .env.dist .env
    ```


2. Build/run containers with (with and without detached mode)

    ```bash
    $ ./project build
    $ ./project start
    ```

3. Update your system host file (add contao.dev)

    ```bash
    # UNIX only: get containers IP address and update host (replace IP according to your configuration)
    $ docker network inspect bridge | grep Gateway

    # unix only (on Windows, edit C:\Windows\System32\drivers\etc\hosts)
    $ sudo echo "171.17.0.1 contao.dev" >> /etc/hosts
    ```

    **Note:** For **OS X**, please take a look [here](https://docs.docker.com/docker-for-mac/networking/) and for **Windows** read [this](https://docs.docker.com/docker-for-windows/#/step-4-explore-the-application-and-run-examples) (4th step).

4. Call http://contao.dev/contao/install and finish the contao setup

5. Enjoy :-)

## Usage

Just run `docker-compose up -d`, then:

* Symfony app: visit [contao.dev](http://contao.dev)  
* Symfony dev mode: visit [contao.dev/app_dev.php](http://contao.dev/app_dev.php)  
* Logs (Kibana): [contao.dev:81](http://contao.dev:81)
* Logs (files location): logs/nginx and logs/symfony

## How it works?

Have a look at the `docker-compose.yml` file, here are the `docker-compose` built images:

* `db`: This is the MySQL database container,
* `php`: This is the PHP-FPM container in which the application volume is mounted,
* `nginx`: This is the Nginx webserver container in which application volume is mounted too,
* `elk`: This is a ELK stack container which uses Logstash to collect logs, send them into Elasticsearch and visualize them with Kibana.

This results in the following running containers:

```bash
$ ./project list
Name                         Command                          State   Ports            
--------------------------------------------------------------------------------------------------
contaodocker_db_1            /entrypoint.sh mysqld            Up      0.0.0.0:3306->3306/tcp      
contaodocker_elk_1           /usr/bin/supervisord -n -c ...   Up      0.0.0.0:81->80/tcp          
contaodocker_nginx_1         nginx                            Up      443/tcp, 0.0.0.0:80->80/tcp
contaodocker_php_1           php-fpm                          Up      0.0.0.0:9000->9000/tcp      
```

## Useful commands

```bash
# bash commands
$ ./project --help
```

## FAQ

* Got this error: `ERROR: Couldn't connect to Docker daemon at http+docker://localunixsocket - is it running?
If it's at a non-standard location, specify the URL with the DOCKER_HOST environment variable.` ?  
Run `docker-compose up -d` instead.

* Permission problem? See [this doc (Setting up Permission)](http://symfony.com/doc/current/book/installation.html#checking-symfony-application-configuration-and-setup)

* How to config Xdebug?
Xdebug is configured out of the box!
Just config your IDE to connect port  `9000` and id key `PHPSTORM`


Have Fun