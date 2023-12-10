/*
==============================================================================

Player start entity constructor

Please do not change this.

==============================================================================
*/



/*
================================================
ToolBlox callbacks

Do not change these here.
Assign your overrides in your mod files instead.

Example:
  tbx_OnSomeCallback = myMod_OnSomeCallback;
================================================
*/

/*
----------------------------------------
On before physics

Callback to run before applying physics.
Override this to add setup logic.
Defaults to doing nothing.
'self' is the current player here.
----------------------------------------
*/
void() tbx_OnBeforePhysics =
{
  tbx_DoNothing();
};

/*
---------------------------------------
On after physics

Callback to run after applying physics.
Override this to add setup logic.
Defaults to doing nothing.
'self' is the current player here.
---------------------------------------
*/
void() tbx_OnAfterPhysics =
{
  tbx_DoNothing();
};

/*
-------------------------------------------------------
On player suicide

Callback to run when a player types the 'kill' command.
Override this to add setup logic.
Defaults to doing nothing.
'self' is the current player here.
-------------------------------------------------------
*/
void() tbx_OnPlayerSuicide =
{
  tbx_DoNothing();
};

/*
---------------------------------------------
On player connect

Callback to run when a player joins the game.
Override this to add setup logic.
Defaults to doing nothing.
'self' is the current player here.
---------------------------------------------
*/
void() tbx_OnPlayerConnect =
{
  tbx_DoNothing();
};

/*
----------------------------------------------
On player spawn

Callback to run when the player avatar spawns.
Override this to add setup logic.
Defaults to doing nothing.
'self' is the current player here.
----------------------------------------------
*/
void() tbx_OnPlayerSpawn =
{
  tbx_DoNothing();
};

/*
----------------------------------------------
On player disconnect

Callback to run when a player leaves the game.
Override this to add setup logic.
Defaults to doing nothing.
'self' is the player here.
----------------------------------------------
*/
void() tbx_OnPlayerDisconnect =
{
  tbx_DoNothing();
};

/*
----------------------------------------------------
On player init

Callback to run to reset player stats and inventory.
Override this to add setup logic.
Defaults to doing nothing.
'self' is the player here.
----------------------------------------------------
*/
void() tbx_OnPlayerInit =
{
  tbx_DoNothing();
};

/*
--------------------------------------------------
On map change

Callback to run when the map changes.
Used for carrying over player stats and inventory.
Override this to add setup logic.
Defaults to doing nothing.
'self' is the player here.
--------------------------------------------------
*/
void() tbx_OnMapChange =
{
  tbx_DoNothing();
};



/*QUAKED info_player_start (1 0 0) (-16 -16 -24) (16 16 24) X X X X X X X X NOT_ON_EASY NOT_ON_NORMAL NOT_ON_HARD_OR_NIGHTMARE NOT_IN_DEATHMATCH NOT_IN_COOP NOT_IN_SINGLEPLAYER X NOT_ON_HARD_ONLY NOT_ON_NIGHTMARE_ONLY
{
model ("progs/player.mdl");
}
The normal starting point for a level.
*/
void() tbx_PlayerSpawner =
{
  tbx_InitMarker();
};
