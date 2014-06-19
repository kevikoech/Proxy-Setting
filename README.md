# Instructions
#### This program is distributed in the hope that it will be useful, but without any warranty. Use it at your own risk.

This script sets and unsets proxy since some Corporates/Colleges/Universities requires a proxy in order to access the outside network. I needed a permanent solution to access the network since some terminal applications needed them; so this script was born.

1.Edit proxy.sh in script directory and add your proxy configuration.

2.If authentication is required do this:

     http_proxy=http://username:passwd@proxy:port
     ftp_proxy=http://username:passwd@proxy:port
     all_proxy=http://username:passwd@proxy:port
     https_proxy=http://username:passwd@proxy:port

3.Otherwise if authentication is not required,replace 'username:port' with appropriate address and port e.g `https_proxy=http://192.168.0.254:3128/`

4.Run `Chmod +x ./set_proxy`

5.Then run `./set_proxy` and follow prompt

6.You are done. Cheers!

7.To unset run `./set_proxy.sh` and follow prompt.

8.Run `echo $http_proxy` to make sure proxy is set or unset after restarting your computer.

