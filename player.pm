#
#===============================================================================
#
#         FILE: palyer.pm
#
#  DESCRIPTION: 
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: YOUR NAME (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 11.06.2015 15:08:11
#     REVISION: ---
#===============================================================================

package player;

use strict;
use warnings;
use Data::Dumper;
 
sub new{
    my $class = shift;
    my $self = bless ({}, $class);

    $self->{'field'} = undef;
    $self->{'hp'} = undef;
    $self->{'hand'} = [];

    return $self;
}



sub setField{
    my $self    = shift;
    my $field  = shift;
    $self->{'field'} = $field;
}

sub getField{
    my $self    = shift;
    $self->{'field'};
}

sub setHp{
    my $self    = shift;
    my $hp  = shift;
    $self->{'hp'} = $hp;
}

sub getHp{
    my $self    = shift;
    $self->{'hp'};
}

sub putInHand{
    my $self    	= shift;
    my $cardName  	= shift;
    my $cardCost 	= shift;
	
	push $self->{'hand'}, {name => $cardName, cost => $cardCost};	
}

sub showHand{
	my $self = shift;
	my $str = '';
	foreach my $card (@{$self->{'hand'}}){
		$str .= "$card->{name} = $card->{cost}\n";
	}
	$str;
}

sub allCostDec{
	my $self = shift;
	my $count = shift || 1;
	
	foreach my $card (@{$self->{'hand'}}){
		if ($card->{cost} - $count >= 0){
			$card->{cost} -= $count;
		} else {
			$card->{cost} = 0;
		}
	}
}

sub getFromHand{
    my $self    = shift;
	my $id 		= shift || return undef;

# id must be is human readable
# card1 card2 card3
# 		 /\
#   1     2     3
# marked card have id 2 (not programming 1)

	return undef if(scalar @{$self->{hand}}<$id);

	my $card = @{$self->{hand}}[$id-1];

	splice @{$self->{hand}},$id-1,1;
	$card;
}

1;
