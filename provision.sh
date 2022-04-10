
# Source:
# https://devops.ionos.com/tutorials/how-to-configure-modsecurity-and-mod_evasive-for-apache-on-centos-7.html
# https://resources.infosecinstitute.com/topic/analyzing-mod-security-logs/

# commands must be executed in privileged mode
systemctl restart network

yum install -y centos-release net-tools vim curl wget;

rpm -ivh https://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-14.noarch.rpm

yum install -y httpd
systemctl enable httpd --now

rm -f /etc/httpd/conf.d/welcome.conf

cat <<EOF > /var/www/html/index.html 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Teste de pagina</h1>
</body>
</html>
EOF

echo "-> install mod_evasive mod_security"
yum -y --enablerepo=epel install mod_security mod_evasive

echo "-> check if mod_evasive was installed"
httpd -M | grep evasive

echo "-> check if mod_security was installed"
httpd -M | grep security

echo "-> download owasp rules"
mkdir -p /etc/httpd/crs
cd /etc/httpd/crs
curl -LO https://github.com/coreruleset/coreruleset/archive/refs/tags/v3.3.2.tar.gz
tar -xvf v3.3.2.tar.gz
mv coreruleset-3.3.2 owasp-coreruleset-3.3.2
cd owasp-coreruleset-3.3.2
cp crs-setup.conf.example crs-setup.conf

echo "-> configure apache to use mod_security"
cat <<EOF > /etc/httpd/modsecurity.d/mod_security.conf
<IfModule mod_security2.c>
    SecRuleEngine On
    SecRequestBodyAccess On
    SecResponseBodyAccess On 
    SecResponseBodyMimeType text/plain text/html text/xml application/octet-stream 
    SecDataDir /tmp
</IfModule>
EOF

echo "-> configure apache to use mod_security"
cat <<EOF >> /etc/httpd/conf/httpd.conf
<IfModule security2_module>
    Include /etc/httpd/crs/owasp-coreruleset-3.3.2/crs-setup.conf
    Include /etc/httpd/crs/owasp-coreruleset-3.3.2/rules/*.conf
</IfModule>
EOF

echo "-> configure mod_evasive if you want"
cat /etc/httpd/conf.d/mod_evasive.conf

# Optionally you can modify theses parameters manually
# <IfModule mod_evasive20.c>
#     DOSHashTableSize    3097
#     DOSPageCount        2
#     DOSSiteCount        50
#     DOSPageInterval     1
#     DOSSiteInterval     1
#     DOSBlockingPeriod   10
# </IfModule>

# DOSEmailNotify	you@yourdomain.com
# DOSSystemCommand	"su - someuser -c '/sbin/... %s ...'"
# DOSLogDir		"/var/lock/mod_evasive"

apachectl restart