#!/bin/bash
set -x  > /tmp/debug.txt
echo -e "\e[1;32m ***** Going to install Apache Tomcat9 on Remote Servers *****" $(date '+%Y-%m-%d %H:%M:%S')
#Switch user to the root account
sudo su 
cat <<"EOF"
 ___           _        _ _ _                               _ 
|_ _|_ __  ___| |_ __ _| | (_)_ __   __ _    __ _ _ __   __| |
 | || '_ \/ __| __/ _` | | | | '_ \ / _` |  / _` | '_ \ / _` |
 | || | | \__ \ || (_| | | | | | | | (_| | | (_| | | | | (_| |
|___|_| |_|___/\__\__,_|_|_|_|_| |_|\__, |  \__,_|_| |_|\__,_|
                                    |___/                     
                  __ _                  _             
  ___ ___  _ __  / _(_) __ _ _   _ _ __(_)_ __   __ _ 
 / __/ _ \| '_ \| |_| |/ _` | | | | '__| | '_ \ / _` |
| (_| (_) | | | |  _| | (_| | |_| | |  | | | | | (_| |
 \___\___/|_| |_|_| |_|\__, |\__,_|_|  |_|_| |_|\__, |
                       |___/                    |___/ 
    _                     _            _____                         _    ___  
   / \   _ __   __ _  ___| |__   ___  |_   _|__  _ __ ___   ___ __ _| |_ / _ \ 
  / _ \ | '_ \ / _` |/ __| '_ \ / _ \   | |/ _ \| '_ ` _ \ / __/ _` | __| (_) |
 / ___ \| |_) | (_| | (__| | | |  __/   | | (_) | | | | | | (_| (_| | |_ \__, |
/_/   \_\ .__/ \__,_|\___|_| |_|\___|   |_|\___/|_| |_| |_|\___\__,_|\__|  /_/ 
        |_|                                                                    
EOF
sleep 4
cd /tmp/
pwd
yum update -y
yum install -y wget
yum install -y java
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.64/bin/apache-tomcat-9.0.64.tar.gz
wget https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war
ls -lart
tar -xf apache-tomcat-9.0.64.tar.gz
sleep 3
rm -rf apache-tomcat-9.0.64.tar.gz
mkdir /opt/tomcat9
cd /opt/tomcat9/
pwd
sleep 3
cp -R /tmp/apache-tomcat-9.0.64 .
cp -R /tmp/SampleWebApp.war /opt/tomcat9/apache-tomcat-9.0.64/webapps/
sleep 3
cd /opt/tomcat9/apache-tomcat-9.0.64/bin/
./startup.sh
sleep 10
ls -l /opt/tomcat9/apache-tomcat-9.0.64/webapps > /tmp/webapps_files.txt
cat /opt/tomcat9/apache-tomcat-9.0.64/logs/catalina.out > /tmp/tomcat_log.txt
sh /opt/tomcat9/apache-tomcat-9.0.64/bin/shutdown.sh
cd /opt/tomcat9/apache-tomcat-9.0.64/webapps/SampleWebApp
cat << 'END_HTML' >index.html
<html>
<body>
   <h1 style="color: red; font-size: 40px;" align="center"> This is Azure DevOps Deployment </h1>
   <h2 style="color: green; font-size: 20px;" align="center"> Sample Web archive deployed in Apache Tomcat Web Server </h2>
   </body>
   </html>
END_HTML
sleep 5
cat /opt/tomcat9/apache-tomcat-9.0.64/webapps/SampleWebApp/index.html > /tmp/index.html
sh /opt/tomcat9/apache-tomcat-9.0.64/bin/startup.sh
sleep 10
cat /opt/tomcat9/apache-tomcat-9.0.64/logs/catalina.out > /tmp/re_start_log.txt
exit
