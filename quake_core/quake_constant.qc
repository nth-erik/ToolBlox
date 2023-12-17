/*
==============================================================================

Quake constants

Pre-emptive constant value definitions for global referencing.

==============================================================================
*/



/*
=============
ToolBlox Core
=============
*/

/*
-------------
tbx_entity.qc
-------------
*/
// Eye positions
vector QUAKE_PLAYER_EYEPOSITION = '0 0 22';
// Armor amount
float QUAKE_ARMOR_NONE = 0;
float QUAKE_ARMOR_LIGHT = 100;
float QUAKE_ARMOR_STANDARD = 150;
float QUAKE_ARMOR_HEAVY = 200;



/*
==========
Quake Core
==========
*/

/*
---------------------
quake_player_spawn.qc
---------------------
*/
//init
float QUAKE_PLAYER_HEALTH = 100;
float QUAKE_PLAYER_MAXHEALTH = 250;

/*
--------------------
quake_player_move.qc
--------------------
*/
// movement
vector QUAKE_PLAYER_JUMPVELOCITY = '0 0 270';
vector QUAKE_PLAYER_EMERGEVELOCITY = '0 0 189';
vector QUAKE_PLAYER_WAISTPOSITION = '0 0 8';
float QUAKE_LEDGE_DISTANCE = 24;

/*
----------------------
quake_player_vitals.qc
----------------------
*/
// fall
float QUAKE_MAXVELOCITY = 2000;
float QUAKE_MAXFALLDAMAGE = 666;