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

use Test::More tests =>11;                      # last test to print

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

$player->allCostDec();
is($player->showHand,"card1 = 4\ncard2 = 5\n",'showHand\allCostDec try default value: decreased by 1');

$player->allCostDec(2);
is($player->showHand,"card1 = 2\ncard2 = 3\n",'showHand\allCostDec decreased by 2');

$player->allCostDec(3);
is($player->showHand,"card1 = 0\ncard2 = 0\n",'showHand\allCostDec decreased by 3: cost not less zero');

$player->allCostDec(-1);
is($player->showHand,"card1 = 1\ncard2 = 1\n",'showHand\allCostDec increase by 1');

$player->putInHand('card3',88);
$player->putInHand('card4',99);

is($player->getFromHand(),undef,"getFromHand: return undef without param");
is($player->getFromHand(5),undef,"getFromHand: return undef if id > card count");
is(eq_hash($player->getFromHand(3),{name => 'card3', cost => 88}),1,"getFromHand: return card from hand");

