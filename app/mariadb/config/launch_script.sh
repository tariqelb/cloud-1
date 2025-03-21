#!/bin/sh

# Ensure /run/mysqld directory exists with correct permissions
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

# Ensure MariaDB configuration allows network connections
sed -i 's/^#bind-address/bind-address/' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i 's/^#datadir/datadir/' /etc/mysql/mariadb.conf.d/50-server.cnf

# Initialize database if needed
if [ ! -d "/var/lib/mysql/mysql" ]; then
  echo "Initializing MariaDB data directory..."
  mariadb-install-db --user=mysql --datadir=/var/lib/mysql
fi

# Start MariaDB as mysql user
echo "Starting MariaDB..."
mariadbd --datadir=/var/lib/mysql --user=mysql --socket=/run/mysqld/mysqld.sock &

# Wait for MariaDB process to be fully started
#while ! pgrep -x mariadbd >/dev/null; do
#  echo "MariaDB process not found, waiting..."
#  sleep 2
#done

echo "Mariadb process found ..."

# Wait for MariaDB to fully start before running commands
while ! netcat -z localhost 3306; do
  echo "MariaDB is still initializing..."
  sleep 3
done

echo "MariaDB is up and running!"

# Execute database updates
sh /updateDb.sh

# Keep container running
#tail -f /dev/null

