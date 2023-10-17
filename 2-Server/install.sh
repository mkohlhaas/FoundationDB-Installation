#!/bin/bash

[ -r ../fdb.conf ] && . ../fdb.conf

wget "https://github.com/apple/foundationdb/releases/download/$FOUNDATIONDBVERSION/$DEBSERVER.deb"
ark -b "$DEBSERVER"
mkdir destdir
ark -b -o destdir data.tar.gz
rm -rf destdir/etc/init.d/
cp -r sv/ destdir/etc/

rsync -r destdir/ /

chown -R foundationdb:foundationdb "$VARLIBFDB" "$VARLOGFDB"
chmod -R 0700 "$VARLIBFDB" "$VARLOGFDB"

if [ ! -f "$CLUSTERCONF" ]; then
    description=$(LC_CTYPE=C tr -dc A-Za-z0-9 < /dev/urandom | head -c 8)
    random_str=$(LC_CTYPE=C tr -dc A-Za-z0-9 < /dev/urandom | head -c 8)
    echo "$description":"$random_str"@127.0.0.1:4500 > "$CLUSTERCONF"
    chown foundationdb:foundationdb "$CLUSTERCONF"
    chmod 0664 "$CLUSTERCONF"
    NEWDB=1
fi

ln -f -s /etc/sv/foundationdb/ /var/service/
sv up foundationdb

[[ -v NEWDB ]]; fdbcli -C "$CLUSTERCONF" --exec "configure new single ssd; status" --timeout 20
