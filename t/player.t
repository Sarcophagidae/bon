#
#===============================================================================
#
#         FILE: player.t
#
#  DESCRIPTION: 
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: YOUR NAME (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 21.07.2011 16:52:39
#     REVISION: ---
#===============================================================================

use strict;
use warnings;

use Test::More tests =>4;                      # last test to print

use lib '../';

use_ok('player');

diag("Player creation");

my $player = player->new();
isa_ok ($player,'player');

$player->setHp(10);
is($player->getHp,10,'set-get hp');

$player->putInHand('card1',5);
$player->putInHand('card2',6);
is($player->showHand,"card1 = 5\ncard2 = 6\n",'putInHand\showHand');
