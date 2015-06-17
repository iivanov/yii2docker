# Version: 0.0.1
FROM debian:latest
MAINTAINER Ivanov Ivan "ivanovdiit@gmail.com"
RUN apt-get update 
RUN apt-get install --fix-missing
RUN apt-get install -y php5 php5-common php5-cli php5-fpm php5-cgi php5-gd php5-curl php5-mysql libssh2-1-dev libssh2-php mysql-client mysql-server curl nginx git vim
RUN update-rc.d php5-fpm defaults
RUN sed -e 's/127.0.0.1:9000/9000/' \
        -e 's/\/var\/run\/php5-fpm.sock/9000/' \
        -e '/allowed_clients/d' \
        -e '/catch_workers_output/s/^;//' \
        -e '/error_log/d' \
        -i /etc/php5/fpm/pool.d/www.conf

# Enable remote access (default is localhost only, we change this
# otherwise our database would not be reachable from outside the container)
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Install database
ADD ./database.sql /var/db/database.sql

# Install starting script
ADD ./start-database.sh /usr/local/bin/start-database.sh
RUN chmod +x /usr/local/bin/start-database.sh

EXPOSE 3306

RUN /usr/local/bin/start-database.sh

ADD ./start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

ADD config.json /root/.composer/config.json

ADD ./nginx.conf /etc/nginx/conf.d/yii2.conf
ADD ./install.sh /usr/local/bin/install.sh
RUN chmod +x /usr/local/bin/install.sh

EXPOSE 80
EXPOSE 9000
ENTRYPOINT ["/usr/local/bin/start.sh"]



TODO
sudo apt-get install php5-intl php5-mcrypt
