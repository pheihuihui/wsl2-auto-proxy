#!/bin/bash

nameserver=`cat /etc/resolv.conf | grep nameserver | awk '{print $2}'`


##########.bashrc##########
# export http_proxy=http://${nameserver}:10800
# export https_proxy=http://${nameserver}:10800
###########################

apt_http=Acquire::http::Proxy\ \"http://$nameserver:10800/\"\;
apt_https=Acquire::https::Proxy\ \"http://$nameserver:10800/\"\;

echo $apt_http > /etc/apt/apt.conf.d/30proxy
echo $apt_https >> /etc/apt/apt.conf.d/30proxy
