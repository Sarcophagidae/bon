#!/usr/bin/perl

use strict;
use warnings;
no warnings 'experimental';
use 5.014;

package cards;

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
					'lay'	=> [7,0,0],
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
					'lay'	=> [5,1,1],
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
				},
	'teya'  => {'n' => 10,
					'rar'		=> 'ultra',
					'type'	=> 'hero',
					'lay'	=> [6,0,1],
					'element'=>	'mountains',
					'skills' => ['delay2','immun to spell'],
					'attack type'	=> 'ligtning',
					'cost'	=> 4,
					'attack' => 3,
					'hp'		=> 6,
			},

   'dwarf legionairre' => {'n' => 11,
               'rar'    => 'rare',
               'type'   => 'creature',
               'element'=> 'plains',
               'skills' => ['immun to arrow','mountain assasin1','commander1'],
               'attack type'  => 'basic',
               'cost'   => 3,
               'attack' => 1,
               'hp'     => 8,
         },

	'umpy' =>	{'n' => 12,
               'rar'    => 'common',
               'type'   => 'creature',
               'element'=> 'swamp',
               'skills' => [],
               'attack type'  => 'basic',
               'cost'   => 2,
               'attack' => 1,
               'hp'     => 4,
	}
);


sub getCardByName{
	my $name = shift;
	if (exists $cards{$name}){
		return $cards{$name};
	} else {return undef}
}

sub checkCard{
# Check that card exists
	my $name = shift;
	exists $cards{$name};
}

sub printCard{
# Just print info about card in fine format
# first param = card name
# second (optional) = style of printing string. Must contain letters which mean field of cards

	return unless  (exists($_[0]));
	my $name = $_[0];
	return unless (checkCard($name));
	
	my $style = 'ntAs';
	$style = $_[1] if (exists ($_[1]));
	
		foreach (split "", $style){
			given ($_){
				when (/n/){ print "$name"; } # Card name

				when (/N/){ print substr($name,0,7); } # Short name

				when (/t/){ 									 # Card type
					my $type;
					given($cards{$name}->{'type'}){
						when (/creature/) {$type = 'cre';}
						when (/hero/) {$type = 'H'; }
						when (/terrain/) {$type = 'Ter'; }
						when (/equip/) {$type = 'eq'; }
					}
					print "$type";
				}

				when (/A/){ 									 # Attack type
					if (($cards{$name}->{'type'} eq 'creature') || ($cards{$name}->{'type'} eq 'hero')){
						print $cards{$name}{'attack type'};
					}
				}

				when (/s/){ 									 # Skills 
					print "[";
					print "$_," foreach (@{$cards{$name}->{'skills'}});
					print "]";
				}
	
				when (/a/){ 									 # Atack of the creature 
					if (($cards{$name}->{'type'} eq 'creature') || ($cards{$name}->{'type'} eq 'hero')){
						print $cards{$name}->{'attack'};  
					}
				}

				when (/h/){ 									 # Hp of the creature
          if (($cards{$name}->{'type'} eq 'creature') || ($cards{$name}->{'type'} eq 'hero')){
            print $cards{$name}->{'hp'};
          }
				}

				when (/c/){ 									 # Cost of card
            print $cards{$name}->{'cost'};
				}

				when (/e/){ 									 # Element of card
            print $cards{$name}->{'element'};
				}

				when (/r/){ 									 # Rarity of card
            print $cards{$name}->{'rar'};
				}

				when (/#/){ 									 # Internal number of card
            print $cards{$name}->{'n'};
				}

			}
			print "\t";
		}

	print "\n";
}

sub printAllCards{
# Print all cards
# Can get cars with some params:
# first param - type of property
# second param - value of it
# now cant be used on list property (e.g. skills, lay)
	my $style = 'NtAs';
	if ((exists ($_[0])) && (exists ($_[1]))){
		$style = $_[2] if (exists ($_[2]));
		foreach (keys %cards){
				printCard($_, $style) if ((exists ($cards{$_}->{$_[0]})) && ($cards{$_}->{$_[0]} eq $_[1]));
		}
	} else {
		$style = $_[0] if (exists ($_[0]));
		foreach (keys %cards){
			printCard($_, $style);
		}
	}
}
