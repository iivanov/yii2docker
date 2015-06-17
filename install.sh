#!/bin/bash
curl -s http://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
mkdir /var/www/
mkdir /var/www/yii2
cd /var/www/yii2
composer global require "fxp/composer-asset-plugin:1.0.0"
composer create-project --prefer-dist yiisoft/yii2-app-basic basic
chmod -R 777 /var/www/yii2/basic/
