<VirtualHost *:80>
    ServerAdmin webmaster@${domain}
    DocumentRoot /www/${domain}
    ServerName ${domain}
    ErrorLog logs/${domain}-error.log
    CustomLog logs/${domain}-access.log common
</VirtualHost>
