#!/bin/bash

wget -q https://download.oracle.com/otn_software/linux/instantclient/instantclient-basic-linuxx64.zip -O instantclient-basic-linuxx64.zip
wget -q https://download.oracle.com/otn_software/linux/instantclient/instantclient-sqlplus-linuxx64.zip -O instantclient-sqlplus-linuxx64.zip

sudo mkdir -p /opt/oracle
sudo mv instantclient-* /opt/oracle
cd /opt/oracle

sudo unzip instantclient-basic-linuxx64.zip
sudo unzip instantclient-sqlplus-linuxx64.zip
