First shell script to install the stack on AWS.

#!/bin/bash
# Check whether the user is root user or not. If it's a not root user, alert him to execurte as a root user.

# Exit codes can be from 0 to 255 whilst 0 is graceful exit rest of them are Partial or Full Failures

FUSER="student"
APACHE_URL="http://apachemirror.wuchna.com/tomcat/tomcat-8/v8.5.65/bin/apache-tomcat-8.5.65.tar.gz "
SQL_CONNECTOR="https://cloudcareers-devops.s3.ap-south-1.amazonaws.com/mysql-connector.jar"

ID=$(id -u)
if [ $(id -u) -ne 0  ] ; then
    echo -e "\e[31m You should run this as a root user \e[0m "
    exit 2
fi

stat(){
    if [ $1 -eq 0 ]; then 
         echo -e "\e[32m Success \e[0m "
    else 
         echo -e "\e[31m Failure \e[0m "
         exit 1 
    fi
}

echo -n "Installing HTTP webServer :"
yum install httpd -y  &> /tmp/stack.log 
stat $?


echo -n "Configuring Reverse Proxy: "
echo -e 'ProxyPass "/student" "http://localhost:8080/student" \nProxyPassReverse "/student"  "http://localhost:8080/student"' >  /etc/httpd/conf.d/app-proxy.conf 
stat $?

echo -n "Configuring the StudentApp Index file"
sudo curl -s https://cloudcareers-devops.s3.ap-south-1.amazonaws.com/index.html -o /var/www/html/index.html
stat $?

echo -n "Restarting Httpd Service :"
systemctl enable httpd 
systemctl restart httpd &> /tmp/stack.log 
stat $?

echo -n "Installing Java"
yum install java -y &> /tmp/stack.log 
stat $?     

echo -n "Creating Student Functional User : "
id ${FUSER} &> /tmp/stack.log 
if [ $? -eq  0 ] ; then 
   echo -e "\e[33m Skipping \e[0m "
else 
    useradd ${FUSER}  &> /tmp/stack.log 
stat $?
fi 


echo -n "Downloading Tomcat :"
cd /home/${FUSER}/
rm -rf apache*  &> /tmp/stack.log 
wget ${APACHE_URL} &> /tmp/stack.log 
tar -xf apache-tomcat-8.5.65.tar.gz && mv apache-tomcat-8.5.65 apache-tomcat  && chown -R ${FUSER}:${FUSER} apache-tomcat
stat $? 

echo -n "Downloading the warfile : "
cd apache-tomcat/webapps  
rm -f student.war  &> /tmp/stack.log 
wget https://cloudcareers-devops.s3.ap-south-1.amazonaws.com/student.war &> /tmp/stack.log 
stat $? 

echo -n "Downloading the SQL connector"
cd ../lib   
wget ${SQL_CONNECTOR} &> /tmp/stack.log  && chown -R ${FUSER}:${FUSER} mysql-connector.jar
stat $? 


echo -n "Defining the context.xml file for student project"
cp context.xml ../conf/context.xml &> /tmp/stack.log  && chown -R ${FUSER}:${FUSER} ../conf/context.xml
stat $? 

echo -n "starting the studentapp"
cd ../bin/
./shutdown.sh &> /tmp/stack.log
./startup.sh &> /tmp/stack.log
stat $? 



































