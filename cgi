/etc/httpd/httpd.conf

LoadModule perl_module modules/libperl.so


first.pl
#!/usr/bin/perl
print "Content-type: text/html\n\n";
print "Hello, World.";
