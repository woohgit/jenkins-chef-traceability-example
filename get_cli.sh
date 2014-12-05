#!/bin/sh

JENKINS_URL="http://localhost:8080"
wget --no-check-certificate ${JENKINS_URL}/jnlpJars/jenkins-cli.jar
