#!/bin/bash

if [ "$deploy" == "app1" ]
then
    cp -rf  /common/webapp1/*  /var/www/html/
    httpd -DFOREGROUND 
    # above command to start apache httpd service 
elif [ "$deploy" == "app2" ]
then
    cp -rf  /common/webapp2/*  /var/www/html/
    httpd -DFOREGROUND 

elif [ "$deploy" == "app3" ]
then
    cp -rf  /common/webapp3/*  /var/www/html/
    httpd -DFOREGROUND

else 
    echo "wrong variable name" >/var/www/html/index.html
    httpd -DFOREGROUND
fi
