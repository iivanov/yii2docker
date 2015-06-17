#!/bin/bash


#TODO: п�~C�~B�~L к database.sql + 
service mysql start
sleep 5
# This script starts the database server.
echo "Creating user root for databases"

mysql --default-character-set=utf8 < /var/db/database.sql
echo "test"
service mysql restart
echo "finished"
sleep 5
# Now the provided user credentials are added
service mysql start
sleep 5
echo "Creating user"
echo "CREATE USER 'root' IDENTIFIED BY 'password'" | mysql --default-character-set=utf8
echo "REVOKE ALL PRIVILEGES ON *.* FROM 'root'@'%'; FLUSH PRIVILEGES" | mysql --default-character-set=utf8
echo "GRANT SELECT ON *.* TO 'root'@'%'; FLUSH PRIVILEGES" | mysql --default-character-set=utf8
echo "finished"

echo "adding write access"
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql --default-character-set=utf8


echo "Creating user phpci"
echo "CREATE USER 'phpci' IDENTIFIED BY ''" | mysql --default-character-set=utf8
echo "REVOKE ALL PRIVILEGES ON *.* FROM 'phpci'@'%'; FLUSH PRIVILEGES" | mysql --default-character-set=utf8
echo "GRANT SELECT ON *.* TO 'phpci'@'%'; FLUSH PRIVILEGES" | mysql --default-character-set=utf8
echo "finished"

echo "adding write access"
echo "GRANT ALL PRIVILEGES ON *.* TO 'phpci'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql --default-character-set=utf8

# And we restart the server to go operational
service mysql restart
