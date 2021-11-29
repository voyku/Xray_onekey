#!/bin/bash
~/.acme.sh/acme.sh --issue -d gdaban.125125.xyz --standalone --force
~/.acme.sh/acme.sh --installcert -d gdaban.125125.xyz --key-file /etc/ssl/private/smitho.key --fullchain-file /etc/ssl/private/smitho.crt
echo "Xray Certificates Renewed"
       
chmod 755 /etc/ssl/private && chmod 755 /etc/ssl/private/smitho.crt && chmod 755 /etc/ssl/private/smitho.key
echo "Read Permission Granted for Private Key"

sudo systemctl restart xray && systemctl reload nginx
echo "Xray&nginx  Restarted"