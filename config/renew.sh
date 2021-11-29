#!/bin/bash
~/.acme.sh/acme.sh --issue --dns dns_cf -d xxx --force 
~/.acme.sh/acme.sh --installcert -d xxx --key-file /ssl/xray.key --fullchain-file /ssl/xray.crt
echo "Xray Certificates Renewed"
       
chmod 755 /ssl/xray.crt && chmod 755 /ssl/xray.key
echo "Read Permission Granted for Private Key"

sudo systemctl restart xray && systemctl reload nginx
echo "Xray&nginx  Restarted"
