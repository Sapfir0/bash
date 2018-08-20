#!/bin/bash
#плагины для браузера 
#https://addons.mozilla.org/en-US/firefox/addon/roboform/
#https://adblockplus.org/

mydir=$(cat /etc/issue.net)

OPTION=$(whiptail --title "$mydir" --menu "Choise your packet" 15 60 4 \
    "1" "Setup default packet" \
    "2" "Setup advanced packet" \
    "3" "Custom setup" \
    "4" "About me" 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "Вы выбрали стандартную установку:" $OPTION
else
    echo "Вы нажали отмену."
fi



if [ $OPTION = 1 ]; then #стандартная установка
#update system
    echo "\033[31mUpdate system\033[0m"
    apt update
    apt full-upgrade -y #работает

    echo "\033[31mUpdate some packages\033[0m"
    PACKAGES="gcc g++ virtualbox steam radiotray snapd git pulseaudio" 
    apt-get -y install $PACKAGES

#sublime
    echo "\033[31mSublime\033[0m"
    snap install sublime-text --classic

#atom
    echo "\033[31mAtom\033[0m"
    snap install atom --classic

#telegram
    echo "\033[31mTelegram\033[0m"
    snap install telegram-desktop  

#spotify
    echo "\033[31mSpotify\033[0m"
    snap install spotify

#discord
    echo "\033[31mDiscord\033[0m"
    snap install discord

#удаление программ
    echo "\033[31m DELETED\033[0"
    echo "\033[31mRhytmbox\033[0m" 
    apt-get -y remove rhythmbox
    echo "\033[31mHex-chat\033[0m" 
    apt-get -y remove hexchat
    echo "\033[31mThunderbird\033[0m" 
    apt-get -y remove thunderbird
    echo "\033[31mSimple scan\033[0m" 
    apt-get -y remove simple-scan

#dropbox
   cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    ~/.dropbox-dist/dropboxd

#работает без дополнительнх установленных программ
#############################################################
elif  [ $OPTION = 2 ]; then #advanced

#slack
    echo "\033[31mSlack\033[0m"
    snap install slack --classic
#encfs
    echo "\033[31mEncfs\033[0m"
    apt-get -y install encfs
    mkdir -p ~/encrypted 
    mkdir -p ~/decrypted 
    #encfs ~/encrypted ~/decrypted #first inicialization
#meld
    echo "\033[31mMeld\033[0m"
    apt-get install meld
#python-lib
apt-get install python3-pyqt5 pyqt5-dev-tools
#git
    echo "\033[31mGit\033[0m"
    #git init
    git config --global user.email "sapfir999999@yandex.ru"
    git config --global user.name "Sapfir0"

#QT установка с GUI
    echo "\033[31mQT\033[0m"
    wget http://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run
    #cd ~/Загрузки/
    cd ~/Downloads/ 
    chmod u+x qt-unified-linux-x64-online.run
    ./qt-unified-linux-x64-online.run



####################################################
elif [ $OPTION = 3 ]; then 


OPTION=$(whiptail --title "Установка доп. пакетов" --menu "Что ты хочешь" 15 60 4 \
    "1" "Android studio" \
    "2" "Gradle&JDK" \
    "3" "Chromium" \
    "4" "---" 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "Вы выбрали установку:" $OPTION
else
    echo "Вы нажали отмену."
fi
    if [ $OPTION=1 ]; then
#android-studio
    echo "\033[31mAndroid-studio\033[0m"
    snap install android-studio --classic

    elif [ $OPTION=2 ]; then
#gradle
echo "\033[31mGradle\033[0m"
    add-apt-repository ppa:cwchien/gradle
    apt-get update
    apt-get install gradle
    elif [ $OPTION=3 ]; then
#Chromium
    echo "\033[31mChromium\033[0m"
    add-apt-repository ppa:saiarcot895/chromium-dev
    apt-get update
    apt install chromium-browser

    fi

fi

        


