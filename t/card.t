#
#===============================================================================
#
#         FILE: card.t
#
#  DESCRIPTION: 
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: YOUR NAME (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 21.07.2015 16:52:39
#     REVISION: ---
#===============================================================================

use strict;
use warnings;

use Test::More tests =>5;                      # last test to print

use lib '../';

use_ok('card');

diag("Card creation");

my $card = card->new('card_name');
isa_ok ($card,'card');

$card->setHp(10);
is($card->getHp,10,'set-get hp');

$card->setAttack(1);
is($card->getAttack,1,'set-get attack');

is($card->getName,'card_name','getName');
