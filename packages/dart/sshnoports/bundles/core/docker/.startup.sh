#!/bin/bash
ssh-keygen -A
ls /atsign/.atsign/keys
/usr/sbin/sshd -D -o "ListenAddress 127.0.0.1" -o "PasswordAuthentication no"  &
sudo -u atsign /usr/local/at/sshnpd "$@"
