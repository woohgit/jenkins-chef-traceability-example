#!/bin/sh

java -jar ./jenkins-cli.jar -s http://localhost:8080/ create-job ChefSample < jenkins-config/config.xml
java -jar ./jenkins-cli.jar -s http://localhost:8080/ enable-job ChefSample
