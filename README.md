### FoundationDB Installation on Void Linux

Here are the latest [FoundationDB Releases](https://github.com/apple/foundationdb/releases/).

#### Clone this repository into `/tmp` directory
```shell
git clone https://github.com/mkohlhaas/FoundationDB-Installation.git /tmp/FoundationDB-Installation
cd /tmp/FoundationDB-Installation`
```

#### Set FoundationDB version and subversion in `fdb.conf`, e.g.
```
FOUNDATIONDBVERSION=7.3.19
SUBVERSION=1
```

#### 1. Install Client
```shell
cd 1-Client/
sudo ./install.sh
```

#### 2. Install Server

```shell
cd ../2-Server/
sudo ./install.sh
```

#### Uninstall software and Clean artefacts with in `1-Client` or `2-Server`:

```shell
sudo ./uninstall.sh
sudo ./clean.sh
```
NOTE: Uninstall removes **everything** including databases and configuration files.
