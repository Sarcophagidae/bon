#!/usr/bin/perl
use Test::More tests => 13;
use lib '../';


use_ok('squad');
use_ok('cards');

diag("Squad unit creation");

my $sqd = squad->create();
isa_ok ($sqd,'squad');

my $sqd = squad->create();
$sqd->addCard('zaral2');
$sqd->addCard('ripper');
$sqd->addCard('ice knolls of jor');
$sqd->addCard('deev3');
$sqd->addCard('naga leader3');
$sqd->addCard('angel of retribution');
$sqd->addCard('harpooneer3');
$sqd->addCard('irdly');
is($sqd->check()->[0],0,"Correct squad");



diag("Check command");

$sqd = squad->create();
$sqd->addCard('zeleboba4');
is($sqd->check()->[1],'Card "zeleboba4" does not exists',"Fake card");

$sqd = squad->create();
$sqd->addCard('irdly');
is($sqd->check()->[1],'Count of card are not equal 8','Failed amount');

$sqd = squad->create();
for (my $i=1;$i<=8;$i++){
	$sqd->addCard('irdly')
}
is($sqd->check()->[1],'Squad has no hero','Squad has no hero');


$sqd = squad->create();
$sqd->addCard('zaral2');
$sqd->addCard('zaral2');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
is($sqd->check()->[1],'Squad has more than one hero','Two heros');


$sqd = squad->create();
$sqd->addCard('zaral2');
$sqd->addCard('ice knolls of jor');
$sqd->addCard('ice knolls of jor');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
is($sqd->check()->[1],'Amount of equip are not correct','Not enougth equip');

$sqd = squad->create();
$sqd->addCard('zaral2');
$sqd->addCard('ripper');
$sqd->addCard('ripper');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
is($sqd->check()->[1],'Amount of equip are not correct','Too much equip');


$sqd = squad->create();
$sqd->addCard('teya');
$sqd->addCard('ripper');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
is($sqd->check()->[1],'Amount of terrain are not correct','Not enougth terrain');

$sqd = squad->create();
$sqd->addCard('aquarch2');
$sqd->addCard('ice knolls of jor');
$sqd->addCard('ice knolls of jor');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
is($sqd->check()->[1],'Amount of creature not correct','Too much terrain');


$sqd = squad->create();
$sqd->addCard('aquarch2');
$sqd->addCard('dwarf legionairre');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
$sqd->addCard('irdly');
is($sqd->check()->[1],'Squad has incorrect element card','Bad element');
 


