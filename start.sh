#!/bin/bash
service nginx start
service mysql start

echo $1
echo $0
echo $2
if [ $1 == 'install' ];
then
	/usr/local/bin/install.sh
fi

/usr/sbin/php5-fpm --nodaemonize
