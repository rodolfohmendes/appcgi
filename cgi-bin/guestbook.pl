#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use File::Path qw(make_path);

my $q = CGI->new;
my $file = "/usr/local/apache2/cgi-bin/guestbook.txt";

print $q->header(-type => 'text/html', -charset => 'UTF-8');

if ($q->request_method eq 'POST') {
    my $nome = $q->param('nome') || 'Anônimo';
    my $msg  = $q->param('mensagem') || '';
    open my $fh, '>>', $file or die "Não consegui abrir $file: $!";
    print $fh "$nome: $msg\n";
    close $fh;
}

if (-e $file) {
    open my $fh, '<', $file or die "Não consegui ler $file: $!";
    while (<$fh>) {
        chomp;
        print "<p>$_</p>\n";
    }
    close $fh;
} else {
    print "<p>Sem mensagens ainda.</p>\n";
}
