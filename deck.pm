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
	}
}

sub getCard{
   my $self = shift;
}

sub putCardBack{
   my $self = shift;
}
