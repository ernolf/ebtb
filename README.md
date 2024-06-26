# ebtb
## ernolfs bash tool box - scripts for nextcloud admins

---
With this toolbox, complex scripts can be created quickly because recurring tasks are consistently modularized. They only need to be listed as dependencies at the beginning of a script in the correct order.

The modules as well as the scripts are usually signed and hosted on my Nextcloud web server, which is the home of the scripts. From there, you can download signed versions that are always up-to-date and self-updating.

This is how you can install such a signed script:

```sh
sudo wget -O /usr/local/bin/$scriptname https://global-social.net/script/$scriptname
sudo chmod +x /usr/local/bin/$scriptname
```

These are the scripts available for installation:

- **nc-apps**
  - A command-line Appstore client for the Nextcloud Appstore
- **nc-integrity-fix**
  - Resolve "*`Some files have not passed the integrity check`*" warnings
- **nc-mimecheck**
  - A mimetype checker script to integrate with flow external script
- **nc-occ**
  - Interactively create your *`occ`* commands. This brings you the feature you have always wanted and missed most, without even knowing. (Nextcloud All-in-One is supported)
- **nc-shares**
  - List shares with their tokens and full path on the command line
- **nc-sharetoken-length**
  - Define the length of the Nextcloud share token, which is normally 15 characters long, to any length between 4 and 32
- **nc-sql**
  - A command-line client for the nextcloud database (for MySQL/MariaDB and PostgreSQL, no SQLite3. Nextcloud All-in-One is supported)
- **nc-subscribed-calendar**
  - Define the refresh rate of subscribed calendars per calendar instead of one refresh rate for all subscribed calendars
- **nc-who**
  - Follow live who is logged in on your Nextcloud server. (Nextcloud All-in-One is supported)
- **php-module-builder**
  - Build PHP modules on your ubuntu/debian based server that cannot be built with PECL, like Lua
- **php-updater**
  - Update PHP on your ubuntu/debian based server and switch back and forth between versions without much hassle

---

Since the scripts are very restrictive with the integrity check and do not allow any changes to the code — modified modules are immediately deleted and replaced by the module server — I have integrated a local module server that allows anyone to host the modules on their own localhost independently of any outside web server. If the scripts are built that way, the local module server starts and stops together with the script and takes over the provision of the modules.

The config/configure file is already set up to build the scripts with the local web server.

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

I hope you enjoy it a lot!

ernolf
