# ebtb
## ernolfs bash tool box - scripts for nextcloud admins

With this toolbox, complex scripts can be created quickly because recurring tasks are consistently modularized. They only need to be listed as dependencies at the beginning of a script in the correct order.

The modules as well as the scripts are usually signed and hosted on my Nextcloud web server, which is the home of the scripts. From there, you can download signed versions that are always up-to-date and self-updating.

> [!IMPORTANT]
> The scripts are designed for and on [debian based distributions](https://en.wikipedia.org/wiki/List_of_Linux_distributions#Debian-based). Whether and to what extent they work on non-debian systems has not been tested.
> 

---
**These are the scripts available for installation:**

## janitor
- ### janitor
  - installer and launcher for all the other scripts
  - provides extensive system information
  - > <details>
    >   <summary>install janitor</summary>
    >
    > ```sh
    > sudo wget -O /usr/local/bin/janitor https://global-social.net/script/janitor
    > sudo chmod +x /usr/local/bin/janitor
    > ```
    > </details>

---
## scripts to interact with a nextcloud installation

> [!NOTE]
> These scripts are primarily developed for [baremetal](https://docs.nextcloud.com/server/latest/admin_manual/installation/index.html) and [vm](https://github.com/nextcloud/vm) installations and partially adapted for [Nextcloud All-in-One](https://github.com/nextcloud/all-in-one). Other containerized solutions like snap or docker are not (yet) supported.

- ### nc-apps
  command-line client for the Nextcloud appstore
  - [x] Nextcloud All-in-One
  - [ ] Nextcloud snap
  - [x] MySQL/MariaDB
  - [x] PostgreSQL
  - [x] SQLite3
  - > <details>
    >   <summary>install nc-apps</summary>
    >
    > - either by the `janitor`or:
    > ```sh
    > sudo wget -O /usr/local/bin/nc-apps https://global-social.net/script/nc-apps
    > sudo chmod +x /usr/local/bin/nc-apps
    > ```
    > </details>

- ### nc-integrity-fix
  resolve "*`Some files have not passed the integrity check`*" warnings
  - [ ] Nextcloud All-in-One
  - [ ] Nextcloud snap
  - [x] MySQL/MariaDB
  - [x] PostgreSQL
  - [ ] SQLite3
  - > <details>
    >   <summary>install nc-integrity-fix</summary>
    >
    > - either by the `janitor`or:
    > ```sh
    > sudo wget -O /usr/local/bin/nc-integrity-fix https://global-social.net/script/nc-integrity-fix
    > sudo chmod +x /usr/local/bin/nc-integrity-fix
    > ```
    > </details>

- ### nc-occ
  completely reinvented interactive *`occ`* interface that makes it easier to find the right command with the available options and arguments for your task, with the ability to save your most used *`occ`* commands as favorites
  - [x] Nextcloud All-in-One
  - [ ] Nextcloud snap
  - [x] MySQL/MariaDB
  - [x] PostgreSQL
  - [x] SQLite3
  - > <details>
    >   <summary>install nc-occ</summary>
    >
    > - either by the `janitor`or:
    > ```sh
    > sudo wget -O /usr/local/bin/nc-occ https://global-social.net/script/nc-occ
    > sudo chmod +x /usr/local/bin/nc-occ
    > ```
    > </details>

- ### nc-who
  similar to [unix who](https://en.wikipedia.org/wiki/Who_(Unix)), follow live who is logged in on your Nextcloud server
  - [x] Nextcloud All-in-One
  - [ ] Nextcloud snap
  - [x] MySQL/MariaDB
  - [x] PostgreSQL
  - [ ] SQLite3
  - > <details>
    >   <summary>install nc-who</summary>
    >
    > - either by the `janitor`or:
    > ```sh
    > sudo wget -O /usr/local/bin/nc-who https://global-social.net/script/nc-who
    > sudo chmod +x /usr/local/bin/nc-who
    > ```
    > </details>

- ### nc-sql
  command-line client for the nextcloud database
  - [x] Nextcloud All-in-One
  - [ ] Nextcloud snap
  - [x] MySQL/MariaDB
  - [x] PostgreSQL
  - [ ] SQLite3
  - > <details>
    >   <summary>install nc-sql</summary>
    >
    > - either by the `janitor`or:
    > ```sh
    > sudo wget -O /usr/local/bin/nc-sql https://global-social.net/script/nc-sql
    > sudo chmod +x /usr/local/bin/nc-sql
    > ```
    > </details>

- ### nc-shares
  list shares with their tokens and full path on the command line
  - [ ] Nextcloud All-in-One
  - [ ] Nextcloud snap
  - [x] MySQL/MariaDB
  - [x] PostgreSQL
  - [ ] SQLite3
  - > <details>
    >   <summary>install nc-shares</summary>
    >
    > - either by the `janitor`or:
    > ```sh
    > sudo wget -O /usr/local/bin/nc-shares https://global-social.net/script/nc-shares
    > sudo chmod +x /usr/local/bin/nc-shares
    > ```
    > </details>

- ### nc-subscribed-calendar
  define the refresh rate of subscribed calendars per calendar instead of one refresh rate for all subscribed calendars
  - [ ] Nextcloud All-in-One
  - [ ] Nextcloud snap
  - [x] MySQL/MariaDB
  - [x] PostgreSQL
  - [ ] SQLite3
  - > <details>
    >   <summary>install nc-subscribed-calendar</summary>
    >
    > - either by the `janitor`or:
    > ```sh
    > sudo wget -O /usr/local/bin/nc-subscribed-calendar https://global-social.net/script/nc-subscribed-calendar
    > sudo chmod +x /usr/local/bin/nc-subscribed-calendar
    > ```
    > </details>

- ### nc-mimecheck
  mimetype checker script to integrate with flow external script
  - [ ] Nextcloud All-in-One
  - [ ] Nextcloud snap
  - [x] MySQL/MariaDB
  - [x] PostgreSQL
  - [x] SQLite3
  - > <details>
    >   <summary>install nc-mimecheck</summary>
    >
    > - either by the `janitor`or:
    > ```sh
    > sudo wget -O /usr/local/bin/nc-mimecheck https://global-social.net/script/nc-mimecheck
    > sudo chmod +x /usr/local/bin/nc-mimecheck
    > ```
    > </details>

---
## scripts to maintain PHP on your server

- ### php-updater
  update PHP on your ubuntu/debian based server and switch back and forth between versions without much hassle
  - [x] actual and common debian based distributions with packaged php versions from "Debian PHP Maintainers" ([Ondřej Surý](https://deb.sury.org/)) like
    - Debian [stable and oldstable releases](https://www.debian.org/releases/index.en.html) (no extended LTS support)
    - Ubuntu LTS releases during the [5 years of standard security maintenance support](https://ubuntu.com/about/release-cycle)
  - > <details>
    >   <summary>install php-updater</summary>
    >
    > - either by the `janitor`or:
    > ```sh
    > sudo wget -O /usr/local/bin/php-updater https://global-social.net/script/php-updater
    > sudo chmod +x /usr/local/bin/php-updater
    > ```
    > </details>

- ### php-module-builder
  build PHP modules on your ubuntu/debian based server that cannot be built with PECL, like Lua
  - [x] [debian based distributions](https://en.wikipedia.org/wiki/List_of_Linux_distributions#Debian-based) with dpkg
  - > <details>
    >   <summary>install php-module-builder</summary>
    >
    > ```sh
    > sudo wget -O /usr/local/bin/php-module-builder https://global-social.net/script/php-module-builder
    > sudo chmod +x /usr/local/bin/php-module-builder
    > ```
    > </details>

  - > <details>
    >   <summary>supported modules</summary>
    >
    > Columns 8.0 to 8.5: available packaged versions for Debian/Ubuntu from "Debian PHP Maintainers" ([Ondřej Surý](https://deb.sury.org/))
    >
    > | | | | | | | | |
    > | :- | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
    > | Module | 8.0 | 8.1 | 8.2 | 8.3 | 8.4 | 8.5 | *php-module-builder* |
    > | | | | | | | | |
    > amqp          | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > apcu          | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :white_check_mark:
    > ast           | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > bcmath        | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > brotli        | :red_circle:   | :red_circle:   | :red_circle:   | :red_circle:   | :red_circle:   | :red_circle:   | :white_check_mark:
    > bz2           | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > cgi           | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > cli           | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > common        | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > curl          | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > dba           | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > decimal       | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :white_check_mark:
    > dev           | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > dio           | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > ds            | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > enchant       | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > excimer       | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :white_check_mark:
    > facedetect    | :green_circle: | :green_circle: | :red_circle:   | :red_circle:   | :red_circle:   | :red_circle:   | :white_check_mark:
    > fpm           | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > gd            | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > gearman       | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > gmagick       | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > gmp           | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > gnupg         | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > grpc          | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > http          | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > igbinary      | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :white_check_mark:
    > imagick       | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :white_check_mark:
    > imap          | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > inotify       | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :white_check_mark:
    > interbase     | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > intl          | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > ldap          | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > libvirt-php   | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :red_circle:   |
    > lua           | :red_circle:   | :red_circle:   | :red_circle:   | :red_circle:   | :red_circle:   | :red_circle:   | :white_check_mark:
    > lz4           | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :white_check_mark:
    > mailparse     | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > maxminddb     | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > mbstring      | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > mcrypt        | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > memcache      | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :red_circle:   | :white_check_mark:
    > memcached     | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :white_check_mark:
    > mongodb       | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > msgpack       | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :white_check_mark:
    > mysql         | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > oauth         | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > odbc          | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > opcache       | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :red_circle:   |
    > openswoole    | :red_circle:   | :red_circle:   | :green_circle: | :green_circle: | :green_circle: | :red_circle:   |
    > opentelemetry | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > pcov          | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > pgsql         | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > phalcon       | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :red_circle:   |
    > phalcon5      | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :red_circle:   | :red_circle:   |
    > phpdbg        | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > pinba         | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :red_circle:   | :red_circle:   |
    > pq            | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > propro        | :green_circle: | :green_circle: | :green_circle: | :red_circle:   | :red_circle:   | :red_circle:   |
    > protobuf      | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > ps            | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > pspell        | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > psr           | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > raphf         | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > rdkafka       | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > readline      | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > redis         | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :white_check_mark:
    > rrd           | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :red_circle:   | :white_check_mark:
    > smbclient     | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :white_check_mark:
    > snmp          | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > soap          | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > solr          | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :white_check_mark:
    > sqlite3       | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > ssh2          | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :white_check_mark:
    > stomp         | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :white_check_mark:
    > swoole        | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :red_circle:   | :white_check_mark:
    > sybase        | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > tideways      | :green_circle: | :green_circle: | :green_circle: | :red_circle:   | :red_circle:   | :red_circle:   | :white_check_mark:
    > tidy          | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > uopz          | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :white_check_mark:
    > uploadprogress| :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :white_check_mark:
    > uuid          | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :white_check_mark:
    > vips          | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :white_check_mark:
    > xdebug        | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :white_check_mark:
    > xhprof        | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :white_check_mark:
    > xlswriter     | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > xml           | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > xmlrpc        | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > xsl           | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > yac           | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :white_check_mark:
    > yaml          | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :white_check_mark:
    > zip           | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > zmq           | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: |
    > zstd          | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :green_circle: | :white_check_mark:
    >
    > </details>

---
## [standalone wrapper-scripts](wrapper)

- ### [nc-cron-logger](wrapper/nc-cron-logger)
  lightweight wrapper script for running Nextcloud’s cron.php reliably.\
  It ensures that PHP is configured correctly (memory limits, APCu CLI), captures both stdout and stderr, and writes them into structured log files with timestamps.

---
<details>
  <summary>Development setup</summary>

Since the scripts are very restrictive with the integrity check and do not allow any changes to the code — modified modules are immediately deleted and replaced by the module server — I have integrated a local module server that allows anyone to host the modules on their own localhost independently of any outside web server. If the scripts are built that way, the local module server starts and stops together with the script and takes over the provision of the modules.

The [config/configure file](config/configure) is already set up to build the scripts with the local web server.

These are the steps to build:

```sh
# Be sure to cleanup older builds
sudo make clean

# Be sure to perform a pull beforehand to get the latest version.
git pull origin main

sudo make and-install-all-scripts
sudo make modules
sudo make sign-and-release-all-modules
```

That way, the modules will be served with their hashes, so they are protected against changes. Therefore, you have to make any desired changes before you build them.
</details>

I hope you enjoy it a lot!

ernolf

