#!/usr/bin/perl

package deck;

use strict;
use warnings;

our $VERSION = '0.01';

sub createDeck{
	my $class = shift;
	my $self = bless ({}, $class);

	$self->{'cards'} = ();
	
	return $self;
}

sub addCard{
	my $self = shift;
	my $card = shift;

	push $card, $self->{'cards'};
}

sub printiDeck{
	my $self = shift;
	print "$_\n" foreach $self->{'cards'};
}

sub check{
	"Ok";
}
1;
