#!/bin/bash

sudo apt install -y default-jre default-jdk
sudo apt install -y maven

GRADLE_VERSION=8.7
wget https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip
sudo mkdir -p /opt/gradle
sudo unzip -d /opt/gradle ./gradle-$GRADLE_VERSION-bin.zip
rm ./gradle-$GRADLE_VERSION-bin.zip
