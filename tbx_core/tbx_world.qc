/*
==============================================================================

ToolBlox worldspawn functions

Functions responsible for managing the worldspawn entity.

==============================================================================
*/



/*
===========================
Engine API functions

Please do not change these.
===========================
*/

/*
---------------------------------------------------------------------------
Point content

Returns content value of the point based on BSP tree:
  */ float TBX_POINTCONTENT_EMPTY = -1; /* Empty (air)
  */ float TBX_POINTCONTENT_SOLID = -2; /* Solid (wall)
  */ float TBX_POINTCONTENT_WATER = -3; /* Water (swim)
  */ float TBX_POINTCONTENT_SLIME = -4; /* Slime (swim, low damage)
  */ float TBX_POINTCONTENT_LAVA = -5; /* Lava (swim, high frequent damage)
  */ float TBX_POINTCONTENT_SKY = -6; /* Sky (wall, despawns projectiles)

sourcePoint: point to check contents of
---------------------------------------------------------------------------
*/
float(vector sourcePoint) tbx_PointContent = #41;

/*
------------------------------------------------------------
Load map

Loads the map at the given path in place of the current one.
Executes the console command "changelevel" + mapname.

mapPath: map path (relative to id1/maps/)
------------------------------------------------------------
*/
void(string mapPath) tbx_LoadMap = #70;



/*
=======================================================================
Engine utility functions

Utility functions to safely manipulate engine-related game state.
For more information, consult the relevant id_core/id_engine.txt entry.

Please do not change these.
=======================================================================
*/

/*
-----------------------------------------
Add secret count

Increments total count of secrets by 1.
Use this to safely add a secret at spawn.
-----------------------------------------
*/
void() tbx_AddSecretCount =
{
  total_secrets = total_secrets + 1;
};

/*
-------------------------------------------
Find secret

Increments count of found secrets by 1.
Use this to safely increment found secrets.
-------------------------------------------
*/
void() tbx_FindSecret =
{
  found_secrets = found_secrets + 1;
  tbx_WriteNetworkByte(TBX_NETWORKCHANNEL_BROADCAST, TBX_MESSAGEBYTE_SECRET_FOUND);
};

/*
------------------------------------------------------
Find super-secret

Increments count of both total and found secrets by 1.
Use this to safely reveal a found 'super secret'.
------------------------------------------------------
*/
void() tbx_FindSuperSecret =
{
  total_secrets = total_secrets + 1;
  found_secrets = found_secrets + 1;
  tbx_WriteNetworkByte(TBX_NETWORKCHANNEL_BROADCAST, TBX_MESSAGEBYTE_SECRET_FOUND);
};

/*
-------------------------------------------------
Add monster count

Increments total count of monsters by 1.
Use this to safely add to monster total at spawn.
-------------------------------------------------
*/
void() tbx_AddMonsterCount =
{
  total_monsters = total_monsters + 1;
};

/*
---------------------------------------------------
Kill monster

Increments count of killed monsters by 1.
Use this to safely increase the monster kill count.
---------------------------------------------------
*/
void() tbx_KillMonster =
{
  killed_monsters = killed_monsters + 1;
  tbx_WriteNetworkByte(TBX_NETWORKCHANNEL_BROADCAST, TBX_MESSAGEBYTE_MONSTER_KILLED);
};
