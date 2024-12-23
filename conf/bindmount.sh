#!/bin/bash
# File mounted as: /etc/sftp.d/bindmount.sh
# Just an example (make your own)

function bindmount() {
    if [ -d "$1" ]; then
        mkdir -p "$2"
    fi
    mount --bind $3 "$1" "$2"
}

# Remember permissions, you may have to fix them:
chown -R :users /data/upload

bindmount /data/upload /home/user1/upload
bindmount /data/upload /home/user2/upload
bindmount /data/upload /home/user3/upload

#bindmount /data/docs /home/peter/docs --read-only
