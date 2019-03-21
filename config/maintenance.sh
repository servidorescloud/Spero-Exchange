#!/bin/bash

if [ "$1" == "off" ]; then
  echo "switch off maintenance mode"
  ln -sf /home/spero/peatio/config/nginx.conf /etc/nginx/conf.d/peatio.conf
  mv /home/spero/peatio/public/404.html.old /home/spero/peatio/public/404.html
  service nginx reload
else
  echo "switch on maintenance mode"
  ln -sf /home/spero/peatio/config/nginx_maintenance.conf /etc/nginx/conf.d/peatio.conf
  mv //home/spero/peatio/public/404.html /home/spero/peatio/public/404.html.old
  cp /home/spero/peatio/public/503.html /home/spero/peatio/public/404.html
  service nginx reload
fi