#!/bin/bash

#Version="V1"
#Author="ByCh4n"
#Developer="Alvatador"

#Colors
white="\033[1;37m"
grey="\033[0;37m"
purple="\033[0;35m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
purple="\033[0;35m"
cyan="\033[0;36m"
cafe="\033[0;33m"
fiuscha="\033[0;35m"
blue="\033[1;34m"
tp="\e[0m"

clear



#john check

if [[ $(command -v john) != "" ]] ; then
    echo "ok" &> /dev/null
else
    echo "Download John"
    sudo apt install john &> /dev/null
    sleep 0.7
    echo "Starting"
clear
fi


banner ()
{
echo -e """$blue           ____   _____      ____ ____      _    ____ _  _______ ____  
          |  _ \ |__  /     / ___|  _ \    / \  / ___| |/ / ____|  _ \ 
          | |_) |  / /_____| |   | |_) |  / _ \| |   | ' /|  _| | |_) |
          |  _ <  / /|_____| |___|  _ <  / ___ \ |___| . \| |___|  _ < 
          |_| \_\/____|     \____|_| \_\/_/   \_\____|_|\_\_____|_| \_|
$tp"""  
}
banner
echo -ne "\n"
echo -e "$yellow               1-)$white ZIP Kırma"
echo -e "$yellow               2-)$white RAR Kırma"
echo -e "$red               3-)$white Bilgi Almak İçin"
echo ""
echo -ne "${green}Option:$red "
read option

if [[ $option = "1" ]] ; then
clear
echo -ne "${blue}Zip Dosyasının Adını Yazınız Ör: crack.zip$tp: "
read zip
sudo zip2john  "$zip" > hash.txt 
sudo john hash.txt --pot=sifre.txt 
fi



if [[ $option = "2" ]] ; then
clear
echo -ne "${blue}Rar Dosyasının Adını Yazınız Ör: crack.rar$tp: "
read rar
sudo rar2john  "$rar" > hash.txt 
sudo john hash.txt --pot=sifre.txt 
fi


if [[ -f sifre.txt ]] ; then
clear
    echo -e "${green}Sifre Kırıldı $yellow"
    echo " "
    sudo cat sifre.txt
else 
    echo "Hata!"     
fi


if [[ $option = "3" ]] ; then
clear
echo -e "${blue}Version=V1
${red}Author=ByCh4n
${yellow}Developer=Alvatador"
fi


