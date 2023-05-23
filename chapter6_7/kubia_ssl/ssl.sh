#!/bin/bash

# 创建根证书
openssl genrsa -out ca.key 2048
openssl req -new -x509 -days 36500 -key ca.key -out ca.crt -subj "/C=CN/ST=GD/L=ShenZhen/O=BTC/OU=MOST/CN=han/emailAddress=2532771263@qq.com"

#签发证书
#创建私钥
openssl genrsa -out httpd.key 1024

#生成签发请求
openssl req -new -key httpd.key -out httpd.csr -subj "/C=CN/ST=GD/L=ShenZhen/O=BTC/OU=OPS/CN=han/emailAddress=2532771263@qq.com"

#使用CA证书进行签发
openssl x509 -req -sha256 -in httpd.csr -CA ca.crt -CAkey ca.key -CAcreateserial -days 36500 -out httpd.crt

#验证签发证书是否有效
openssl verify -CAfile ca.crt httpd.crt

mkdir -p  /etc/harbor/cert
cp httpd.crt httpd.key  /etc/harbor/cert/
