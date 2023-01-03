#!/bin/bash

# Update the package manager
apt-get update

# Install Git
apt-get install -y git

# Install NodeJS
curl -sL https://deb.nodesource.com/setup_14.x | bash -
apt-get install -y nodejs

