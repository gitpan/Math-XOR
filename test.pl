#!/usr/bin/perl

use strict;
use Test;

BEGIN { plan tests => 1 };

use Math::XOR;

ok(
 xor_buf("hello", "world"),
 chr(0x1f) . chr(0x0a) . chr(0x1e) . chr(0x00) . chr(0x0b)
);
