# Description

This `Dockerfile` is based on the [one located on the original repo](https://github.com/Bottelet/DaybydayCRM/blob/2.2.1/Dockerfile).

# Changes

It has been modified to fix a few issues encountered:

* Upgrade to Node.js version to `14.x` to fix installation
* Upgrade to Python 3 to fix dependency installation
* Drop direct references to Nginx config and startup
* Fix the "mixed content" errors due to HTTP ([#287](https://github.com/Bottelet/DaybydayCRM/issues/287)
