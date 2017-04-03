#!/bin/bash

cd /var

if [ -d "/var/jenkins_home/.git" ]; then
    # We already cloned the repository, just try to pull it.
    cd jenkins_home
    echo "Pulling git-config actual state..."
    git pull
else
    # We didnt clone a repository, yet. Lets clone it!
    if [ -f "/usr/share/jenkins/ref/.ssh/id_rsa" ]; then
        cp -Rf /usr/share/jenkins/ref/.ssh ~
        chmod 700 ~/.ssh
        chmod 600 ~/.ssh/*
    fi

    echo "Cloning git-config branch $JENKINS_CONFIG_BRANCH from $JENKINS_CONFIG_REPOSITORY..."
    git clone -b "$JENKINS_CONFIG_BRANCH" "$JENKINS_CONFIG_REPOSITORY" jenkins_home_git
    mv jenkins_home_git/* jenkins_home_git/.git jenkins_home
    rm -rf jenkins_home_git
fi
