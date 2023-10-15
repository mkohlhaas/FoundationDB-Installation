#!/bin/bash

[ -r ../fdb.conf ] && . ../fdb.conf

wget "https://github.com/apple/foundationdb/releases/download/$FOUNDATIONDBVERSION/foundationdb-clients_${FOUNDATIONDBVERSION}-${SUBVERSION}_amd64.deb"
ark -b "foundationdb-clients_${FOUNDATIONDBVERSION}-${SUBVERSION}_amd64.deb"
mkdir destdir
ark -b -o destdir data.tar.gz
rsync -r destdir/ /
ldconfig
getent passwd foundationdb >/dev/null || useradd --system --user-group --no-create-home --home-dir "$VARLIBFDB" --comment "FoundationDB" --shell /bin/false foundationdb
chown foundationdb:foundationdb "$SERVERCONFDIR"
chmod 775 "$SERVERCONFDIR"
