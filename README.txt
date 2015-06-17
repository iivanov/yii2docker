создаст новый контейнер в который при запуске развернет новое приложение yii2
sudo docker run -p 80:80 -d --name yii2 iivanov/yii2 install

Создаст контейнер и установит новое приложение yii2 в папку на физическом компьютере /var/www/yii2/test
sudo docker run -p 80:80 -d -v /var/www/yii2/test:/var/www/yii2 --name yii2 iivanov/yii2 install

Просто создать контейнер yii2
sudo docker run -p 80:80 -d --name yii2 iivanov/yii2



