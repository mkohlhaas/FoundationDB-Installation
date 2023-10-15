#!/bin/bash

rm -rf /etc/foundationdb/
rm -rf /usr/include/foundationdb/
rm -rf /usr/lib/cmake/FoundationDB-Client/
rm -rf /usr/lib/foundationdb/
rm /usr/bin/dr_agent /usr/bin/fdbbackup /usr/bin/fdbcli /usr/bin/fdbdr /usr/bin/fdbrestore
rm /usr/lib/libfdb_c_shim.so /usr/lib/libfdb_c.so
rm /usr/lib/pkgconfig/foundationdb-client.pc
