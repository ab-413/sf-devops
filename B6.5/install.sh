#!/usr/bin/env bash

cd /home/vagrant

echo "#####################"
echo "## Download PG 8.4 ##"
echo "#####################"

wget https://ftp.postgresql.org/pub/source/v8.4.0/postgresql-8.4.0.tar.bz2

echo "#####################"
echo "##      Unzip      ##"
echo "#####################"

tar xvjf postgresql-8.4.0.tar.bz2 

echo "#####################" 
echo "##    apt update   ##"  
echo "#####################"

sudo apt-get update

echo "#########################"
echo "## install dependences ##"  
echo "#########################"

sudo apt-get install -y build-essential libreadline-dev zlib1g-dev flex bison libxml2-dev libxslt-dev libssl-dev clang gcc
cd postgresql-8.4.0/

echo "#####################"
echo "##    install PG   ##"  
echo "#####################"

./configure CFLAGS="-O1" CC=clang
make
sudo make install

echo "#####################"
echo "##     add user    ##" 
echo "#####################"

sudo useradd -p postgres postgres
sudo mkdir /usr/local/pgsql/data
sudo chown postgres /usr/local/pgsql/data

echo "#####################"
echo "##      initdb     ##"
echo "#####################"

su -c "/usr/local/pgsql/bin/initdb -D /usr/local/pgsql/data" postgres
sudo mkdir /usr/local/pgsql/data/log
sudo chown postgres /usr/local/pgsql/data/log

echo "#####################"
echo "##     start pg    ##"
echo "#####################"

su -c '/usr/local/pgsql/bin/pg_ctl start -l /usr/local/pgsql/data/log/logfile -D /usr/local/pgsql/data' postgres

echo "######################"
echo "## start pg at boot ##"
echo "######################"

sed -i -e 's/exit 0//g' /etc/rc.local
echo "su -c '/usr/bin/pg_ctl start -l /usr/local/pgsql/data/log/logfile -D /usr/local/pgsql/data' postgres" >> /etc/rc.local

echo "#####################"
echo "##      DONE!      ##"
echo "#####################"