#!/bin/bash

cd /opt/
wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.tar.gz
tar -xvf *.tar.gz
rm *.tar.gz

carpeta=$(ls -d /opt/*jdk*)
mv $carpeta /opt/jdk-21

update-alternatives --install /usr/bin/java java /opt/jdk-21/bin/java 1
update-alternatives --install /usr/bin/javac javac /opt/jdk-21/bin/javac 1
update-alternatives --install /usr/bin/jshell jshell /opt/jdk-21/bin/jshell 1
update-alternatives --set java /opt/jdk-21/bin/java
update-alternatives --set javac /opt/jdk-21/bin/javac
update-alternatives --set jshell /opt/jdk-21/bin/jshell