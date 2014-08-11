#!/usr/bin/perl
use strict;
use warnings;
use squad;
use cards;
use Data::Dumper;


sub createTestCorrectSquad{
	my $deck = squad->create();
   #print Dumper(cards::getCardByName("irdly"));


	$deck->addCard('zaral2');
	$deck->addCard('ripper');
	$deck->addCard('ice knolls of jor');
	$deck->addCard('deev3');
	$deck->addCard('naga leader3');
	$deck->addCard('angel of retribution');
	$deck->addCard('harpooneer3');
	$deck->addCard('irdly');
	if ($deck->check()->[0]==0){
		print 'Squad failed with :"'.$deck->check()->[1]."\"\n";
		return;
	} else { print "Squad ok\n"}
	$deck->print;
}

sub createFailedSquads{
$|=1;


print "test 1 fake card\n";
	my $sqd = squad->create();
	$sqd->addCard('zeleboba4');
   print 'Squad failed with :"'.$sqd->check()->[1]."\"\n\n" if ($sqd->check()->[0]==0);


print "test 2 failed amount\n";
	$sqd = squad->create();
	$sqd->addCard('irdly');
   print 'Squad failed with :"'.$sqd->check()->[1]."\"\n\n" if ($sqd->check()->[0]==0);

print "test 3 no hero\n";
	$sqd = squad->create();
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
   print 'Squad failed with :"'.$sqd->check()->[1]."\"\n\n" if ($sqd->check()->[0]==0);

print "test 4 two hero\n";
	$sqd = squad->create();
	$sqd->addCard('zaral2');
	$sqd->addCard('zaral2');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
   print 'Squad failed with :"'.$sqd->check()->[1]."\"\n\n" if ($sqd->check()->[0]==0);

print "test 5 not enougth equip\n";
	$sqd = squad->create();
	$sqd->addCard('zaral2');
	$sqd->addCard('ice knolls of jor');
	$sqd->addCard('ice knolls of jor');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
   print 'Squad failed with :"'.$sqd->check()->[1]."\"\n\n" if ($sqd->check()->[0]==0);

print "test 6 too much equip\n";
	$sqd = squad->create();
	$sqd->addCard('zaral2');
	$sqd->addCard('ripper');
	$sqd->addCard('ripper');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
   print 'Squad failed with :"'.$sqd->check()->[1]."\"\n\n" if ($sqd->check()->[0]==0);

print "test 7 not enougth terrain\n";
	$sqd = squad->create();
	$sqd->addCard('teya');
	$sqd->addCard('ripper');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
   print 'Squad failed with :"'.$sqd->check()->[1]."\"\n\n" if ($sqd->check()->[0]==0);

print "test 8 too much terrain\n";
#dont know how to check this
	$sqd = squad->create();
	$sqd->addCard('aquarch2');
	$sqd->addCard('ice knolls of jor');
	$sqd->addCard('ice knolls of jor');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
   print 'Squad failed with :"'.$sqd->check()->[1]."\"\n\n" if ($sqd->check()->[0]==0);

print "test 9 bad element\n";
#dont know how to check this
	$sqd = squad->create();
	$sqd->addCard('aquarch2');
	$sqd->addCard('dwarf legionairre');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
	$sqd->addCard('irdly');
   print 'Squad failed with :"'.$sqd->check()->[1]."\"\n\n" if ($sqd->check()->[0]==0);

}

#createTestCorrectSquad();
createFailedSquads();

