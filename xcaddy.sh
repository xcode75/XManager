#!/bin/bash
  
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m' 
plain='\033[0m'
 
cur_dir=$(pwd)
 
# check root
[[ $EUID -ne 0 ]] && echo -e "${red}Error：${plain} This script must be run as root user！\n${red}错误：${plain} 必须使用root用户运行此脚本！\n" && exit 1
 
# check os
if [[ -f /etc/redhat-release ]]; then
    release="centos"
elif cat /etc/issue | grep -Eqi "debian"; then
    release="debian"
elif cat /etc/issue | grep -Eqi "ubuntu"; then
    release="ubuntu"
elif cat /etc/issue | grep -Eqi "centos|red hat|redhat"; then
    release="centos"
elif cat /proc/version | grep -Eqi "debian"; then
    release="debian"
elif cat /proc/version | grep -Eqi "ubuntu"; then
    release="ubuntu"
elif cat /proc/version | grep -Eqi "centos|red hat|redhat"; then
    release="centos"
else
    echo -e "${red}No system version detected, please contact the script author！${plain}\n${red}未检测到系统版本，请联系脚本作者！${plain}\n" && exit 1
fi

if [ "$(getconf WORD_BIT)" != '32' ] && [ "$(getconf LONG_BIT)" != '64' ] ; then
    echo "This software does not support 32-bit system (x86), please use 64-bit system (x86_64), if the detection is wrong, please contact the author \n本软件不支持 32 位系统(x86)，请使用 64 位系统(x86_64)，如果检测有误，请联系作者"
    exit 2
fi

os_version=""

# os version
if [[ -f /etc/os-release ]]; then
    os_version=$(awk -F'[= ."]' '/VERSION_ID/{print $3}' /etc/os-release)
fi
if [[ -z "$os_version" && -f /etc/lsb-release ]]; then
    os_version=$(awk -F'[= ."]+' '/DISTRIB_RELEASE/{print $2}' /etc/lsb-release)
fi

if [[ x"${release}" == x"centos" ]]; then
    if [[ ${os_version} -le 6 ]]; then
        echo -e "${red}Use CentOS 7 Or higher system！${plain}\n${red}请使用 CentOS 7 或更高版本的系统！${plain}\n" && exit 1
    fi
elif [[ x"${release}" == x"ubuntu" ]]; then
    if [[ ${os_version} -lt 16 ]]; then
        echo -e "${red}Use Ubuntu 16 Or higher system！${plain}\n${red}请使用 Ubuntu 16 或更高版本的系统！${plain}\n" && exit 1
    fi
elif [[ x"${release}" == x"debian" ]]; then
    if [[ ${os_version} -lt 8 ]]; then
        echo -e "${red}Use Debian 8 Or higher system！${plain}\n${red}请使用 Debian 8 或更高版本的系统！${plain}\n" && exit 1
    fi
fi

install_base() {
    if [[ x"${release}" == x"centos" ]]; then
        yum install epel-release -y
        yum install wget curl unzip crontabs socat bash -y
    else
        apt install wget curl unzip cron socat bash -y
    fi
}


function checkport(){
	Port80=`netstat -tlpn | awk -F '[: ]+' '$1=="tcp"{print $5}' | grep -w 80`
	Port443=`netstat -tlpn | awk -F '[: ]+' '$1=="tcp"{print $5}' | grep -w 443`
	if [ -n "$Port80" ]; then
	    process80=`netstat -tlpn | awk -F '[: ]+' '$5=="80"{print $9}'`
	    echo "==========================================================="
	    echo -e "${red} It is detected that port 80 is occupied/检测到端口80被占用:${green} ${process80}${plain}，\n${red}This installation is cancelled/此安装已取消${plain}"
	    echo "==========================================================="
	    exit 1
	fi
}


install_Xray() {
	checkport
	
	install_base
	
	curl -sL https://get.acme.sh | bash
	
	if [ -z "$(which docker)" ];then
		install_docker
	fi
	
	if [ ! -f "/usr/bin/docker-compose" ];then
		install_docker_compose
	fi
	
	if [ -f "/usr/bin/Xray" ];then
		rm -rf /usr/bin/Xray
	fi
	
	if [ -f "/usr/bin/xray" ];then
		rm -rf /usr/bin/xray
	fi
	
	if [ ! -f "/root/Xray.zip" ];then
		curl -o /root/Xray.zip -Ls https://github.com/xcode75/XManager/raw/xray_caddy/XCaddy.zip
		unzip /root/Xray.zip
		mv /root/Xray /etc/Xray
		chmod -R 777 /etc/Xray
		rm -rf /root/Xray.zip
	fi
	
    curl -o /usr/bin/Xray -Ls https://raw.githubusercontent.com/xcode75/XManager/xray_caddy/Xray
    chmod +x /usr/bin/Xray
    ln -s /usr/bin/Xray /usr/bin/xray 
    chmod +x /usr/bin/xray
	
	echo -e ""
	echo ""
	echo "------------------------------------------"
	echo "Xray              - Show Menu/显示菜单"
	echo "Xray start        - Start/启动 Xray"
	echo "Xray stop         - Stop/停止 Xray"
	echo "Xray restart      - Restart/重启 Xray"
	echo "Xray log          - Log/日志 Xray "
	echo "Xray update       - Update/更新 Xray"
	echo "------------------------------------------"
}

function install_docker(){
	curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
	chkconfig docker on
	systemctl start docker
	systemctl enable docker
	usermod -aG docker $USER
}

function install_docker_compose(){
    curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
	ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose     
}

install_Xray
