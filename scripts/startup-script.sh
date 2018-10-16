#!/usr/bin/env bash
sudo gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
sudo curl -sSL https://get.rvm.io | bash -s stable

sudo source ~/.rvm/scripts/rvm
sudo rvm requirements

sudo rvm install 2.4.1

sudo rvm use 2.4.1 --default
sudo gem install bundler -V --no-ri --no-rdoc

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'

sudo apt-get update
sudo apt-get install -y mongodb-org

sudo systemctl start mongod
sudo systemctl enable mongod
sudo systemctl status mongod

sudo git clone https://github.com/Artemmkin/reddit.git
sudo cd reddit
sudo bundle install

sudo puma -d
