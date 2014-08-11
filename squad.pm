#!/usr/bin/perl

package squad;

use strict;
use warnings;
use cards;

our $VERSION = '0.01';

sub create{
	my $class = shift;
	my $self = bless ({}, $class);

	$self->{'cards'} = [];
	
	return $self;
}

sub addCard{
	my $self = shift;
	my $card = shift;

	push $self->{'cards'},$card;
}

sub print{
	my $self = shift;
	foreach (@{$self->{'cards'}}){
		my $card = cards::getCardByName($_); 
		print $_." ".$card->{'element'}." ".$card->{'type'}."\n";	
#		print "$_\n";
	}
}

sub getHero{
	my $self = shift;
	foreach (@{$self->{'cards'}}){	
		return $_ if (cards::getCardByName($_)->{'type'} eq 'hero');
	}
	return undef;
}

sub check{
	my $self = shift;
	foreach (@{$self->{'cards'}}){
		unless (cards::checkCard($_)){
			return [0,"Card \"$_\" does not exists"];
		}
	}
	
	return [0,"Count of card are not equal 8"] if ((scalar @{$self->{'cards'}}) != 8);
	
	my $lay;
	my %count;
	$count{cards::getCardByName($_)->{'type'}}++ foreach (@{$self->{'cards'}});
	if (exists $count{'hero'}){
		return [0,"Squad has more than one hero"] if ($count{'hero'} > 1);
	} else {
		return [0,"Squad has no hero"];
	}
	
	$lay = cards::getCardByName($self->getHero())->{'lay'};	
	if (exists $count{'creature'}){
		return [0,"Amount of creature not correct"] if ($lay->[0] != $count{'creature'});
	} else {
		return [0,"Squad has no creature"];
	}
			
	if ($lay->[1] > 0){
		if (exists $count{'equip'}){
			return [0,"Amount of equip are not correct"] if ($lay->[0] != $count{'equip'});
		} else {
			return [0,"Amount of equip are not correct"];
		}
	}
	
	if ($lay->[2] > 0){
		if (exists $count{'terrain'}){
			return [0,"Amount of terrain are not correct"] if ($lay->[0] != $count{'terrain'});
		} else {
			return [0,"Amount of terrain are not correct"];
		}
	}
	
	my $elem = cards::getCardByName($self->getHero())->{'element'};

	foreach (@{$self->{'cards'}}){
		unless ((cards::getCardByName($_)->{'element'} eq $elem) || 
	  		 (cards::getCardByName($_)->{'element'} eq 'neutral')){
			return [0,"Squad has incorrect element card"];
		}
	}

	[1,"Ok"];
}
1;
