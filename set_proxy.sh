#!/bin/bash
#
# Quickly set and unset proxy without the need to do it manually or simply want to save yourself all the hustle (like me ;-D)
#
# Written by - Kevcoh - kevikoech[at]gmail(.)com

export u="$USER"
export wdir="$(pwd)"

echo "Apply System wide proxy settings ? (Y/N)"
read addproxy
 if [ "$addproxy" = "y" ]; then
 sudo cp $wdir/script/proxy.sh /etc/profile.d

cd /etc/profile.d
sudo chown $u proxy.sh
echo "Please wait.."
sleep 3
 
echo "Adding proxy through sudo"
sudo touch /tmp/sudoers
sudo touch /tmp/tmpfile
sudo cp /etc/sudoers /tmp/sudoers
sudo sh -c "sed '/env_reset/i\Defaults env_keep +=\"http_proxy ftp_proxy https_proxy all_proxy no_proxy\"' /tmp/sudoers > /tmp/tmpfile ; mv /tmp/tmpfile /tmp/sudoers"  

sudo chmod 400 /tmp/sudoers
sudo visudo -c -f /tmp/sudoers
sudo mv /tmp/sudoers /etc/sudoers

sleep 2
echo "Restart to take effect"

 else 
 if [ "$addproxy" = "n" ]; then 
 echo "Removing proxy...."  
sudo rm -f /etc/profile.d/proxy.sh
sleep 3
sudo touch /tmp/sudoers
sudo touch /tmp/tmpfile
sudo cp /etc/sudoers /tmp/sudoers

#check if string exists
if grep -q "Defaults env_keep +=\"http_proxy ftp_proxy https_proxy all_proxy no_proxy\"" /tmp/sudoers; then
sudo sh -c "sed '/Defaults env_keep +=\"http_proxy ftp_proxy https_proxy all_proxy no_proxy\"/d' /tmp/sudoers > /tmp/tmpfile ; mv /tmp/tmpfile /tmp/sudoers" 

sudo chmod 400 /tmp/sudoers
sudo visudo -c -f /tmp/sudoers
sudo mv /tmp/sudoers /etc/sudoers

echo "Done configuring proxy_settings"
echo
fi

sleep 3          
echo "Proxy settings unset. Restart to take effect"
fi
fi
