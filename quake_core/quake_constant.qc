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
float QUAKE_PLAYER_MINHEALTH = 25;

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
float QUAKE_FLAG_ACTION_LEDGEGRAB = 2048;

/*
----------------------
quake_entity_vitals.qc
----------------------
*/
// fall
float QUAKE_MAXVELOCITY = 2000;
float QUAKE_MAXFALLDAMAGE = 666;
float QUAKE_SOAKDAMAGE_KNEE = 1;
float QUAKE_SOAKDAMAGE_WAIST = 1.7;
float QUAKE_SOAKDAMAGE_EYE = 2.3;
float QUAKE_SOAKDAMAGE_MAX = 5; // divisor for 0..1 scaling
string QUAKE_SOUND_PLAYER_FRACTURE = "player/land2.wav";
string QUAKE_SOUND_PLAYER_UGH = "player/land.wav";
string QUAKE_SOUND_PLAYER_HUH = "player/plyrjmp8.wav";
string QUAKE_SOUND_PLAYER_PAIN1 = "player/pain1.wav";
string QUAKE_SOUND_PLAYER_PAIN2 = "player/pain2.wav";
string QUAKE_SOUND_PLAYER_PAIN3 = "player/pain3.wav";
string QUAKE_SOUND_PLAYER_PAIN4 = "player/pain4.wav";
string QUAKE_SOUND_PLAYER_PAIN5 = "player/pain5.wav";
string QUAKE_SOUND_PLAYER_PAIN6 = "player/pain6.wav";
string QUAKE_SOUND_PLAYER_SLIMEBURN = "player/slimbrn2.wav";
string QUAKE_SOUND_PLAYER_SCREAM1 = "player/lburn1.wav";
string QUAKE_SOUND_PLAYER_SCREAM2 = "player/lburn2.wav";
string QUAKE_SOUND_PLAYER_GULP1 = "player/drown1.wav";
string QUAKE_SOUND_PLAYER_GULP2 = "player/drown2.wav";
string QUAKE_SOUND_PLAYER_DROWN = "player/h2odeath.wav";
string QUAKE_SOUND_PLAYER_DEATH1 = "player/death1.wav";
string QUAKE_SOUND_PLAYER_DEATH2 = "player/death2.wav";
string QUAKE_SOUND_PLAYER_DEATH3 = "player/death3.wav";
string QUAKE_SOUND_PLAYER_DEATH4 = "player/death4.wav";
string QUAKE_SOUND_PLAYER_DEATH5 = "player/death5.wav";
string QUAKE_SOUND_PLAYER_GASP = "player/gasp1.wav";
string QUAKE_SOUND_PLAYER_COUGH = "player/gasp2.wav";
string QUAKE_SOUND_FOLEY_LEDGEGRAB = "quake/foley/ledge1.wav";
string QUAKE_SOUND_FOLEY_LEDGESLIP = "quake/foley/ledge2.wav";
float QUAKE_SOUNDSET_PLAYER = 0;
float QUAKE_SOUNDSET_PLAYERALT = 1;
float QUAKE_PLAYER_MAXAIRSUPPLY = 30;
float QUAKE_PLAYER_MINAIRSUPPLY = -15;