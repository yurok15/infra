#!/usr/bin/env bash
sudo git clone https://github.com/Artemmkin/reddit.git
sudo cd reddit
sudo bundle install

sudo puma -d
