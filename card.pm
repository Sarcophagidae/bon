#
#===============================================================================
#
#         FILE: card.pm
#
#  DESCRIPTION: 
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: YOUR NAME (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 21.07.2015 15:15:03
#     REVISION: ---
#===============================================================================

package card;

use strict;
use warnings;
 
sub new {
    my $class = shift;
	my $name = shift;
    my $self = bless ({}, $class);

    $self->{'name'}=$name;
	$self->{'atack'}=undef;
	$self->{'hp'}=undef;
	$self->{'skills'}=();

    return $self;
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

sub setAttack{
    my $self    = shift;
    my $hp  = shift;
    $self->{'attack'} = $hp;
}

sub getAttack{
    my $self    = shift;
    $self->{'attack'};
}

sub getSkills{
    my $self    = shift;
    $self->{'skills'};
}

sub addSkills{
	my $self = shift;
	my $skill = shift;
	push($self->{'skills'}, $skill);
}

sub getName{
	my $self = shift;
	$self->{'name'};
}

1;
