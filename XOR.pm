package Math::XOR;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require DynaLoader;
require AutoLoader;

@ISA = qw(Exporter DynaLoader);
@EXPORT = qw(
 xor_buf	
);
$VERSION = '0.02';

bootstrap Math::XOR $VERSION;

1;
__END__

=pod

=head1 NAME

Math::XOR - Package to handle XOR encryption of string buffers

=head1 SYNOPSIS

	use XOR;
	print xor_buf("hello", "world"), "\n";

=head1 DESCRIPTION

The XOR module allows you to quickly XOR two strings together.
This is the only method of encryption that (assuming the randomness of the
pattern used as an encryption key) truly cannot be broken. It also has
interesting, very direct mathematical properties which can be fun to
play with:

XOR string 1 and string 2, you get string 3
XOR string 1 and string 3, you get string 2
XOR string 2 and string 3, you get string 1

=head1 FUNCTIONS

=over 4

=item xor_buf($string1, $string2)

This function will return a scalar, which is the result of XORing the two strings passed
to it together. The strings may contain binary data.

If $string2 is not at least as many characters long as $string1, xor_buf() will print an error
and return undef. Only as many characters as there are in $string1 will be returned; excess
characters in $string2 will be ignored. For this reason, when encrypting data it is good to
think of $string1 as your "data" and $string2 as your "key".

=back

=head1 VERSION

This is XOR version 0.01, also known as "project abscondiac".

=head1 COPYRIGHT

Copyright 2002 The Guild of the Green Lion.
This module may be redistributed under the same terms as perl itself.
Written by Tyler MacDonald <japh@crackerjack.net> on 2002/08/16

=cut

