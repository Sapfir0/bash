#!/bin/bash
#плагины для браузера 
#qt5 default скчать из магазина
#https://adblockplus.org/

mydir=$(cat /etc/issue.net)

OPTION=$(whiptail --title "$mydir" --menu "Choise your packet" 15 60 4 \
    "1" "Setup default packet" \
    "2" "Setup advanced packet(without sudo)" \
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

    add-apt-repository -y ppa:slytomcat/ppa #yandex-indicator
    add-apt-repository -y ppa:ubuntu-desktop/ubuntu-make #среды разработок
    add-apt-repository -y ppa:danielrichter2007/grub-customizer #grub
    add-apt-repository -y ppa:saiarcot895/chromium-dev
    
    echo "\033[31mUpdate system\033[0m"
    apt update
    apt full-upgrade -y #работает

    echo "\033[31mUpdate some packages\033[0m"
    PACKAGES="gcc g++ virtualbox steam radiotray snapd git pulseaudio deluge 
    csh vim vim-runtime fasm meld qt5-default gnome-tweak-tool grub-customizer 
    gnome-tweak-tool python3-pyqt5 pyqt5-dev-tools ubuntu-make chromium-browser 
    gnuplot tmux install yd-tools docky" 
    apt-get -y install $PACKAGES

    umake ide visual-studio-code
    umake ide sublime-text
    umake ide rider
    umake ide atom
#telegram
 #   echo "\033[31mTelegram\033[0m"
 #   snap install telegram-desktop  

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

#работает без дополнительнх установленных программ

#encfs
  #  echo "\033[31mEncfs\033[0m"
  #   apt-get -y install encfs
  #  mkdir -p ~/encrypted 
  #  mkdir -p ~/decrypted 
  #  encfs ~/encrypted ~/decrypted #first inicialization

#git
    echo "\033[31mGit\033[0m"
    git config --global user.email "sapfir999999@yandex.ru"
    git config --global user.name "Sapfir0"
#Яд
echo "\033[31mЯД\033[0m"
    echo "deb http://repo.yandex.ru/yandex-disk/deb/ stable main" | sudo tee -a /etc/apt/sources.list.d/yandex.list > /dev/null && wget http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG -O- | sudo apt-key add - && sudo apt-get update && sudo apt-get install -y yandex-disk
    yandex-disk setup
    yandex-disk-indicator

#############################################################
elif  [ $OPTION = 2 ]; then #advanced

#dropbox
    echo "\033[31mDropbox\033[0m"
    wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb

#QT установка с GUI
    echo "\033[31mQT\033[0m"
    echo "\033[31mDo you want to download offline packages?\033[0m (y/n)"

    read item
    case "$item" in
        y|Y) wget http://ftp.fau.de/qtproject/archive/qt/5.11/5.11.1/qt-opensource-linux-x64-5.11.1.run;;
        #cd ~/Загрузки/;

        n|N) wget http://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run;;
        #cd ~/Downloads/ ;;
        #chmod u+x qt-opensource-linux-x64-5.11.1.run
        #./qt-opensource-linux-x64-5.11.1.run;
    esac

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

        

