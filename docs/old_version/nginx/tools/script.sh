#!/bin/bash

# if [ ! -z $BONUS ] ; then
# 	cp -f /etc/nginx/conf.d/default/nginx.conf /etc/nginx/conf.d/nginx.conf
# 	echo $'\n\ninclude /etc/nginx/conf.d/bonus/*.conf;' >> /etc/nginx/conf.d/nginx.conf
# else
# 	cp -f /etc/nginx/conf.d/default/nginx.conf /etc/nginx/conf.d/nginx.conf
# fi

cp -f /etc/nginx/conf.d/default/nginx.conf /etc/nginx/conf.d/nginx.conf
# 6 -> 1 

nginx -g "daemon off;"
