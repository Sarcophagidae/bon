package deck;

use strict;
use warnings;
use cards;
use squad;

our $VERSION = '0.01';

sub create{
   my $class = shift;
   my $self = bless ({}, $class);

   $self->{'squads'} = [];
	$self->{'cards'}=[];
	
   return $self;
}

sub addSquad{
   my $self = shift;
   my $squad = shift;

   push $self->{'squads'},$squad;
}

sub checkDeck{
   my $self = shift;
	foreach ($self->{'squads'}){
		$_->check();
	}
}

sub shuffle{
	my $self = shift;	
	foreach ($self->{'squads'}){
		push $_->getCards, $self->{'cards'};
	}
}

sub print{
   my $self = shift;
   foreach (@{$self->{'cards'}}){
      my $card = cards::getCardByName($_);
      print $_." ".$card->{'element'}." ".$card->{'type'}."\n";
   }
}


sub getCard{
   my $self = shift;
}

sub putCardBack{
   my $self = shift;
}
