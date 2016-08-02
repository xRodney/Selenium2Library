#!/bin/sh
BROWSER=$1


if [[ "${BROWSER}" == "chrome" ]]
then
    # installing Chrome
    sudo apt-get install -q -y libxss1 libappindicator1 libindicator7
    wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome*.deb
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
else
    # installing Firefox to get all dependencies
    sudo apt-get install firefox -y -q
    firefox --version
fi