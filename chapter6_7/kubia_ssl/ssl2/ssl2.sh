#!/bin/bash
openssl genrsa -out https.key 2048
openssl req -new -x509 -days 36500 -key https.key -out https.cert -subj "/C=CN/ST=GD/L=ShenZhen/O=BTC/OU=MOST/CN=han/emailAddress=2532771263@qq.com"
