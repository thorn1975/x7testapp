#!/bin/sh

BIN_DIR=$(cd "$(dirname "$0")"; pwd)
ROOT_DIR=$(dirname "$BIN_DIR")

echo "root:$SSH_PASS" | chpasswd
sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

cp "$ROOT_DIR/files/geth" ~/