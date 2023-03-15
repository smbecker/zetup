#!/bin/bash

wget https://download.oracle.com/java/19/latest/jdk-19_linux-x64_bin.deb
sudo apt -qqy install ./jdk-19_linux-x64_bin.deb
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-19/bin/java 1919
rm ./jdk-19_linux-x64_bin.deb

sudo apt install -y maven

wget https://services.gradle.org/distributions/gradle-8.0.2-bin.zip
sudo mkdir -p /opt/gradle
sudo unzip -d /opt/gradle ./gradle-8.0.2-bin.zip
rm ./gradle-8.0.2-bin.zip
