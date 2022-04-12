# Web Application Firewall (WAF) Lab

## Context

This is a laboratory to run a Apache web server in centos7 virtual machines using vagrant and virtualbox provider.

The key here is to show how to protect this web server installing **ModSecurity** and **mod_evasive**.

These are free Apache modules which protect your web server from various brute force or (D)DoS attacks, including SQL injection, cross-site scripting, session hijacking, and many others.

Hope it helps you harden your infrastructure :)

## Pre-requisites

- [Vagrant](https://www.vagrantup.com/downloads)  installed
- [Virtualbox](https://www.virtualbox.org/wiki/Downloads) installed

## Usage

1. Clone this repository
2. Run `vagrant up`
3. Access https://localhost:8080 to example page
4. Your can try to break the web server, and check that the plugins will protect it from many threats


## References

- [how-to-configure-modsecurity-and-mod_evasive-for-apache-on-centos](https://devops.ionos.com/tutorials/how-to-configure-modsecurity-and-mod_evasive-for-apache-on-centos-7.html)
- [analyzing-mod-security-logs](https://resources.infosecinstitute.com/topic/analyzing-mod-security-logs/)