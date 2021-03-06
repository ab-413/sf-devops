#!/usr/bin/env bash

echo "--- Add repo to source list ---"
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt \
$(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc \
| sudo apt-key add -

echo "--- apt update ---"
sudo apt update

echo "--- install pip pg ---"
sudo apt install -y python3-pip postgresql-12 libpq-dev

echo "--- install psycopg2 Django ---"
python3 -m pip install psycopg2 Django

echo "--- Done ---"
