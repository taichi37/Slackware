vi /etc/httpd/httpd.conf
LoadModule cgi_module lib64/httpd/modules/mod_cgi.so

cd /var/www/cgi-bin/
vi first.pl
#!/usr/bin/perl
print "Content-type: text/html\n\n";
print "Hello, World.\n";

chmod 755 first.pl
perl first.pl

測試
http://localhost/cgi-bin/first.pl
