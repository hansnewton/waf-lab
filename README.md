# Web Application Firewall (WAF) Lab

## Context

This is a laboratory to run a WAF using Apache web server in centos7 virtual machines using vagrant and virtualbox provider.

It will be installed a apache web server and configured with mod_security and mod_evasive plugins.

## Pre-requisites

- [Vagrant](https://www.vagrantup.com/downloads)  installed
- [Virtualbox](https://www.virtualbox.org/wiki/Downloads) installed

## Usage:

1. Clone this repository
2. Run `vagrant up`
3. Access https://localhost:8080


## References

- [how-to-configure-modsecurity-and-mod_evasive-for-apache-on-centos](https://devops.ionos.com/tutorials/how-to-configure-modsecurity-and-mod_evasive-for-apache-on-centos-7.html)
- [analyzing-mod-security-logs](https://resources.infosecinstitute.com/topic/analyzing-mod-security-logs/)