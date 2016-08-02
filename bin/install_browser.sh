#!/bin/bash

if [[ "${BROWSER}" == "chrome" ]]
then
    # installing Chrome
    sudo apt-get install -q -y libxss1 libappindicator1 libindicator7
    wget -q -O ~/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i ~/google-chrome*.deb
    sudo apt-get install -f -y
    google-chrome --version
    # installing chromedriver
    wget -q  http://chromedriver.storage.googleapis.com/LATEST_RELEASE
    chromedriver_version=$(cat LATEST_RELEASE)
    wget -q -N http://chromedriver.storage.googleapis.com/"$chromedriver_version"/chromedriver_linux64.zip
    unzip chromedriver_linux64.zip
    chmod +x chromedriver
    sudo mv -f chromedriver /usr/local/share/chromedriver
    sudo ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
    sudo ln -s /usr/local/share/chromedriver /usr/bin/chromedriver
    chromedriver --version
elif [[ "${BROWSER}" == "phantomjs" ]]
then
    wget -O ~/phantomjs-2.1.1-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
    tar xjf ~/phantomjs-2.1.1-linux-x86_64.tar.bz2 -C ~
    rm -f /usr/local/bin/phantomjs
    sudo ln -s ~/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs
else
    # installing Firefox to get all dependencies
    sudo apt-get install firefox -y -q
    firefox --version
fi