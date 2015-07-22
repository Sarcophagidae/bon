#
#===============================================================================
#
#         FILE: field.pm
#
#  DESCRIPTION: 
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: YOUR NAME (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 11.06.2015 15:00:24
#     REVISION: ---
#===============================================================================

package field;

use strict;
use warnings;
use cards;

our $VERSION = '0.01';
my $FIELD_SIZE = 7;

sub new{
	my $class = shift;
	my $self = bless ({}, $class);

	$self->{'player1'} 	=	undef;
	$self->{'field1'}	=	[0,0,0,0,0,0,0];
	$self->{'player2'} 	=	undef;
	$self->{'field2'}	=	[0,0,0,0,0,0,0];

	return $self;
}
 
sub free{
	my $self = shift;
	$self->getPlayer1->setField(undef);
	$self->getPlayer2->setField(undef);
}

sub setPlayer1{
	my $self 	= shift;
	my $player 	= shift;
	$self->{'player1'} = $player;
	$player->setField($self);
}

sub getPlayer1{
	my $self 	= shift;
	$self->{'player1'};
}

sub getPlayer2{
	my $self 	= shift;
	$self->{'player2'};
}

sub setPlayer2{
	my $self 	= shift;
	my $player 	= shift;
	$self->{'player2'} = $player;
	$player->setField($self);
}


1;
