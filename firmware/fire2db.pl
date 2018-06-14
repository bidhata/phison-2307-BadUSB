#!/usr/bin/perl
use strict;
use utf8;
use Encode qw/encode decode/;

do_patch('main.c');
do_patch('usb.c');

sub do_patch {
	my $file = shift;
	open my $fr, $file or die;
	binmode $fr;
	my $src = decode('UTF-8', do {local $/; <$fr>});
	close $fr;

	$src =~ s/([ \t]+)🔥\("(.+)", 0x([0-9A-Fa-f]+), 0x([0-9A-Fa-f]+)\)/replace_fire($1, $2, hex($3),  hex($4))/ge;

	open my $fw, '>', $file or die;
	binmode $fw;
	print $fw encode('UTF-8', $src);
	close $fw;
}

sub replace_fire {
	my ($indent, $file, $start, $end) = @_;
	my @res = ();
	
	open my $fr, $file or die;
	binmode $fr;
	my $data = do {local $/; <$fr>};
	close $fr;

	for my $i ($start..$end) {
		push @res, sprintf("%s.db 0x%02X", $indent, ord(substr($data, $i, 1)));
	}
	
	return join "\r\n", @res;
}