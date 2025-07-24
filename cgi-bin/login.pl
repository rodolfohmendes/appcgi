#!/usr/bin/perl
use strict;
use warnings;
use utf8;
use CGI;
binmode STDOUT, ':encoding(UTF-8)';

my $q = CGI->new;
my $user = $q->param('username') || '';
my $pass = $q->param('password') || '';

if ($user eq 'admin' && $pass eq 'admin') {
    print $q->redirect('/guestbook.html');
} else {
    print $q->header(-type => 'text/html', -charset => 'UTF-8');
    print "<p style='color:red'>Login inválido. <a href='/index.html'>Tentar novamente</a></p>";
}
