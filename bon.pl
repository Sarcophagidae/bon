#!/usr/bin/perl
use strict;
use warnings;
use deck;

my %cards = (
	'deev3' => {'n' => 1,
					'rar'		=> 'ultra',
					'type'	=> 'creature',
					'element'=>	'mountains',
					'skills' => ['fligth','armor'],
					'attack type'	=> 'basic',
					'cost'	=> 3,
					'attack' => 2,
					'hp'		=> 8,
				},

	'naga leader3' => {'n' => 2,
					'rar'		=> 'promo',
					'type'	=> 'creature',
					'element'=>	'mountains',
					'skills' => ['catcher','shuffle'],
					'attack type'	=> 'basic',
					'cost'	=> 3,
					'attack' => 1,
					'hp'		=> 8,
				},

	'harpooneer3' => {'n' => 3,
					'rar'		=> 'ultra',
					'type'	=> 'creature',
					'element'=>	'mountains',
					'skills' => ['immunity','mountain odium3'],
					'attack type'	=> 'throw',
					'cost'	=> 3,
					'attack' => 2,
					'hp'		=> 9,
				},

	'angel of retribution' => {'n' => 4,
					'rar'		=> 'promo',
					'type'	=> 'creature',
					'element'=>	'neutral',
					'skills' => ['full heal','flight', 'prayer'],
					'attack type'	=> 'basic',
					'cost'	=> 4,
					'attack' => 2,
					'hp'		=> 6,
				},

	'aquarch2'  => {'n' => 5,
					'rar'		=> 'ultra',
					'type'	=> 'hero',
					'lay'	=> 700,
					'element'=>	'mountains',
					'skills' => ['herald1'],
					'attack type'	=> 'throw',
					'cost'	=> 3,
					'attack' => 2,
					'hp'		=> 9,
				},

	'zaral2'  => {'n' => 6,
					'rar'		=> 'promo',
					'type'	=> 'hero',
					'lay'	=> 511,
					'element'=>	'mountains',
					'skills' => ['mountain lead3'],
					'attack type'	=> 'basic',
					'cost'	=> 5,
					'attack' => 4,
					'hp'		=> 7,
	},

	'ice knolls of jor'  => {'n' => 7,
					'rar'		=> 'ultra',
					'type'	=> 'terrain',
					'element'=>	'mountains',
					'skills' => ['wall of shields3'],
					'cost'	=> 2,
	},

	'ripper'  => {'n' => 8,
					'rar'		=> 'super',
					'type'	=> 'equip',
					'element'=>	'mountains',
					'skills' => ['attack2','terror1'],
   				'cost'	=> 3,
	},

	'irdly'  => {'n' => 9,
					'rar'		=> 'ultra',
					'type'	=> 'creature',
					'element'=>	'mountains',
					'skills' => ['jubilate1'],
					'attack type'	=> 'spell',
					'cost'	=> 4,
					'attack' => 1,
					'hp'		=> 7,
				}
);

use Data::Dumper;
sub printAllCards{
#	print $cards{$_}->{'n'}."\n" foreach keys %cards;
# simple procedural interface
	#my %h = ('12312' => 'asdf');
	print Dumper(\%cards);
}

sub createTestDeck{
	my $deck = createDeck();
	$deck->addCard('zaral2');
	$deck->addCard('repper');
	$deck->addCard('ice knolls of jor');
	$deck->addCard('deev3');
	$deck->addCard('naga leader3');
	$deck->addCard('angel of retribution');
	$deck->addCard('harpooneer3');
	$deck->addCard('irdly');
	print $deck->check();
	$deck->print;
};

printAllCards();
