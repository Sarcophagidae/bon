#!/usr/bin/perl
use strict;
use warnings;
use squad;
use cards;
use deck;
use Data::Dumper;

my $sqd = squad->create();
$sqd->addCard('zaral2');
$sqd->addCard('ripper');
$sqd->addCard('ice knolls of jor');
$sqd->addCard('deev3');
$sqd->addCard('naga leader3');
$sqd->addCard('angel of retribution');
$sqd->addCard('harpooneer3');
$sqd->addCard('irdly');

my $d = deck->create;
$d->addSquad($sqd);
$d->shuffle;
$d->print;
