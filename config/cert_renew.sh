#!/bin/bash
~/.acme.sh/acme.sh --issue -d xxx --standalone --force
~/.acme.sh/acme.sh --installcert -d xxx --key-file /root/ssl/xray.key --fullchain-file /root/ssl/xray.crt
echo "Xray Certificates Renewed"
       
chmod 755 /root/ssl && chmod 755 /root/ssl/xray.crt && chmod 755 /root/ssl/xray.key
echo "Read Permission Granted for Private Key"

sudo systemctl restart xray && systemctl reload nginx
echo "Xray&nginx  Restarted"
