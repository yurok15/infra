#!/bin/bash 
#git clone https://github.com/Artemmkin/reddit.git
git clone https://github.com/express42/reddit
cd reddit
bundle install
puma -d
