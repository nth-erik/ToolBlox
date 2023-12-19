/*
================================================

ToolBlox callback functions

Example:
  tbx_OnSomeCallback = {
    quake_OnSomeCallback();
    myMod_OnSomeCallback();
  };
================================================
*/

/*
====================================
Player callbacks

These affect the player in the game.
'self' is the current player here.
====================================
*/

/*
----------------------------------------
On before physics

Callback to run before applying physics.
Add your mod function here.
'self' is the current player here.
----------------------------------------
*/
void() tbx_OnBeforePhysics = {
  if (tbx_GetHealth(self) <= 0)
  {
    tbx_SetMoveType(self, TBX_MOVETYPE_DROP);
    tbx_SetSolidType(self, TBX_SOLIDTYPE_NOT);
    tbx_SetEyePosition(self, '0 0 0');
    return;
  }

  local vector inputs = tbx_CheckInputs(self);

  // jump controls
  if (inputs_z) {
    quake_HandlePlayerJump();
    quake_HandlePlayerSwim();
    quake_HandlePlayerLedgeGrab();
    tbx_SetActionFlags
    (
      self,
      tbx_RemoveFlags
      (
        tbx_GetActionFlags(self),
        TBX_FLAG_ACTION_JUMPRELEASED
      )
    );

    return;
  }

  // not jumping, reset flag
  tbx_SetActionFlags
  (
    self,
    tbx_AddFlags
    (
      tbx_GetActionFlags(self),
      TBX_FLAG_ACTION_JUMPRELEASED
    )
  );
};

/*
---------------------------------------
On after physics

Callback to run after applying physics.
Add your mod function here.
'self' is the current player here.
---------------------------------------
*/
void() tbx_OnAfterPhysics = {
  quake_HandleSoak(self);
  quake_HandleFall(self);
  quake_SetOldVelocity(self);
  // update global timers
  quake_SetTick();
  quake_SetSecond();
};

/*
-------------------------------------------------------
On player suicide

Callback to run when a player types the 'kill' command.
Add your mod function here.
'self' is the current player here.
-------------------------------------------------------
*/
void() tbx_OnPlayerSuicide = {};

/*
---------------------------------------------
On player connect

Callback to run when a player joins the game.
Add your mod function here.
'self' is the current player here.
---------------------------------------------
*/
void() tbx_OnPlayerConnect = {};

/*
----------------------------------------------
On player spawn

Callback to run when the player avatar spawns.
Add your mod function here.
'self' is the current player here.
----------------------------------------------
*/
void() tbx_OnPlayerSpawn = {
    quake_OnPlayerSpawn();
};

/*
----------------------------------------------
On player disconnect

Callback to run when a player leaves the game.
Add your mod function here.
'self' is the player here.
----------------------------------------------
*/
void() tbx_OnPlayerDisconnect = {};

/*
----------------------------------------------------
On player init

Callback to run to reset player stats and inventory.
Add your mod function here.
'self' is the player here.
----------------------------------------------------
*/
void() tbx_OnPlayerInit = {};

/*
--------------------------------------------------
On map change

Callback to run when the map changes.
Used for carrying over player stats and inventory.
Add your mod function here.
'self' is the player here.
--------------------------------------------------
*/
void() tbx_OnMapChange = {};

/*
=====================================
World callbacks

These affect the map as it loads.
Precache map-independent assets here.
'self' is the current player here.
=====================================
*/

/*
------------------------------------
On world spawn

Callback to run as the world spawns.
Add your mod function here.
------------------------------------
*/
void() tbx_OnWorldSpawn = {};

/*
------------------------------------------------------------------
On first frame start

Callback to execute on the first frame, right after the map loads.
------------------------------------------------------------------
*/
void() tbx_OnFirstFrameStart = {};

/*
-----------------------------------
On frame start

Callback to execute on every frame.
-----------------------------------
*/
void() tbx_OnFrameStart = {};