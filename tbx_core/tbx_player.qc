/*
==============================================================================

ToolBlox player entity functions

Functions responsible for managing specifically player "client" entities.

==============================================================================
*/



/*
===========================
Engine API functions

Please do not change these.
===========================
*/

/*
------------------------------------------------------------------------
Get nearby player

Returns a player from the passed entity's PVS (potentially visible set).
Probably uses map VIS data.
You can temporarily replace "self" to use this on any entity.

sourceEntity: entity to find a player in the PVS for (defaults to self)
------------------------------------------------------------------------
*/
entity(entity sourceEntity) tbx_GetNearbyPlayer =
{
  local entity oldSelf;
  local entity nearbyPlayer;

  oldSelf = self;
  self = sourceEntity;
  nearbyPlayer = _17();
  self = oldSelf;

  return nearbyPlayer;
};

/*
---------------------------------------------------------------------------
Print client command

Types a command to the console from the entity.
If not terminated with an escaped new line, the text will remain typed into
the console.

targetEntity:   entity executing the command
commandMessage: the command to execute
---------------------------------------------------------------------------
*/
void(entity targetEntity, string commandMessage) tbx_PrintClientCommand = #21;

/*
-----------------------------------------------
Get weapon model

Returns the current entity weapon model path.
Only works with players:
  float TBX_FLAG_ROLE_PLAYER = 8;

sourceEntity: the entity to read the value from
-----------------------------------------------
*/
string(entity sourceEntity) tbx_GetWeaponModel =
{
  if (!(sourceEntity.flags & TBX_FLAG_ROLE_PLAYER))
    return "";

  return sourceEntity.weaponmodel;
};

/*
------------------------------------------------
Set weapon model

Updates the current entity weapon model path.
Only works with players:
  float TBX_FLAG_ROLE_PLAYER = 8;

targetEntity: the entity to change the value for
newModelPath: the new weapon model path
------------------------------------------------
*/
void(entity targetEntity, string newModelPath) tbx_SetWeaponModel =
{
  if (!(targetEntity.flags & TBX_FLAG_ROLE_PLAYER))
  {
    tbx_EntityError(
      targetEntity,
      "tbx_SetWeaponModel only applies to players."
    );
    return;
  }

  targetEntity.weaponmodel = newModelPath;
};

/*
--------------------------------------------------
Get weapon frame

Returns the current entity weapon animation frame.

sourceEntity: the entity to read the value from
--------------------------------------------------
*/
float(entity sourceEntity) tbx_GetWeaponFrame =
{
  if (!(sourceEntity.flags & TBX_FLAG_ROLE_PLAYER))
    return 0;

  return sourceEntity.weaponframe;
};

/*
---------------------------------------------------------
Set weapon frame

Updates the current entity weapon animation frame.
Use to change animation.

targetEntity: the entity to change the value for
newFrame:     the weapon frame number to set (zero-based)
---------------------------------------------------------
*/
void(entity targetEntity, float newFrame) tbx_SetWeaponFrame =
{
  if (!(targetEntity.flags & TBX_FLAG_ROLE_PLAYER))
  {
    tbx_EntityError(
      targetEntity,
      "tbx_SetWeaponFrame only applies to players."
    );
    return;
  }

  targetEntity.weaponframe = newFrame;
};

/*
----------------------------------------------------------
Next weapon frame

Increments the current entity weapon animation frame by 1.

targetEntity: the entity to change the value for
----------------------------------------------------------
*/
void(entity targetEntity) tbx_NextWeaponFrame =
{
  if (!(targetEntity.flags & TBX_FLAG_ROLE_PLAYER))
  {
    tbx_EntityError(
      targetEntity,
      "tbx_NextWeaponFrame only applies to players."
    );
    return;
  }

  targetEntity.weaponframe = targetEntity.weaponframe + 1;
};

/*
----------------------------------------------------------
Last weapon frame

Decrements the current entity weapon animation frame by 1.

targetEntity: the entity to change the value for
----------------------------------------------------------
*/
void(entity targetEntity) tbx_LastWeaponFrame =
{
  if (!(targetEntity.flags & TBX_FLAG_ROLE_PLAYER))
  {
    tbx_EntityError(
      targetEntity,
      "tbx_LastWeaponFrame only applies to players."
    );
    return;
  }

  targetEntity.weaponframe = targetEntity.weaponframe - 1;
};

/*
----------------------------------------------------------
Next weapon frame until

Increments the current entity weapon animation frame by 1.
Does not go beyond passed frame.

targetEntity: the entity to change the value for
frameLimit:   the frame to stop on
----------------------------------------------------------
*/
void(entity targetEntity, float frameLimit) tbx_NextWeaponFrameUntil =
{
  local float newFrame;

  if (!(targetEntity.flags & TBX_FLAG_ROLE_PLAYER))
  {
    tbx_EntityError(
      targetEntity,
      "tbx_NextWeaponFrameUntil only applies to players."
    );
    return;
  }

  newFrame = targetEntity.weaponframe + 1;

  if (newFrame > frameLimit)
    newFrame = frameLimit;

  targetEntity.weaponframe = newFrame;
};

/*
----------------------------------------------------------
Last weapon frame until

Decrements the current entity weapon animation frame by 1.
Does not go beyond passed frame.

targetEntity: the entity to change the value for
frameLimit:   the frame to stop on
----------------------------------------------------------
*/
void(entity targetEntity, float frameLimit) tbx_LastWeaponFrameUntil =
{
  local float newFrame;

  if (!(targetEntity.flags & TBX_FLAG_ROLE_PLAYER))
  {
    tbx_EntityError(
      targetEntity,
      "tbx_LastWeaponFrameUntil only applies to players."
    );
    return;
  }

  newFrame = targetEntity.weaponframe - 1;

  if (targetEntity.weaponframe < frameLimit)
    newFrame = frameLimit;

  targetEntity.weaponframe = newFrame;
};

/*
----------------------------------------------------------
Next weapon frame between

Increments the current entity weapon animation frame by 1.
Loops after end frame to start frame.

targetEntity: the entity to change the value for
startFrame:   the frame to restart on if end is passed
endFrame:     the final valid frame
----------------------------------------------------------
*/
void(
  entity targetEntity,
  float startFrame,
  float endFrame
) tbx_NextWeaponFrameBetween =
{
  local float newFrame;

  if (!(targetEntity.flags & TBX_FLAG_ROLE_PLAYER))
  {
    tbx_EntityError(
      targetEntity,
      "tbx_NextWeaponFrameBetween only applies to players."
    );
    return;
  }

  newFrame = startFrame;

  if (targetEntity.weaponframe <= endFrame)
    newFrame = newFrame + 1;

  targetEntity.weaponframe = newFrame;
};

/*
----------------------------------------------------------
Last weapon frame between

Decrements the current entity weapon animation frame by 1.
Loops after start frame to end frame.

targetEntity: the entity to change the value for
startFrame:   the final valid frame
endFrame:     the frame to restart on if start is passed
----------------------------------------------------------
*/
void(
  entity targetEntity,
  float startFrame,
  float endFrame
) tbx_LastWeaponFrameBetween =
{
  local float newFrame;

  if (!(targetEntity.flags & TBX_FLAG_ROLE_PLAYER))
  {
    tbx_EntityError(
      targetEntity,
      "tbx_NextWeaponFrameBetween only applies to players."
    );
    return;
  }

  newFrame = endFrame;

  if (targetEntity.weaponframe >= startFrame)
    newFrame = newFrame - 1;

  targetEntity.weaponframe = newFrame;
};

/*
-----------------------------------------------------
Get current weapon ammo

Returns the current entity current weapon ammo count.

NOTE: Displayed on player HUD.

sourceEntity: the entity to read the value from
-----------------------------------------------------
*/
float(entity sourceEntity) tbx_GetCurrentWeaponAmmo =
{
  if (!(sourceEntity.flags & TBX_FLAG_ROLE_PLAYER))
    return 0;

  return sourceEntity.currentammo;
};

/*
-----------------------------------------------------
Set current weapon ammo

Updates the current entity current weapon ammo count.

targetEntity: the entity to change the value for
newAmmo:      the amount of ammo to set
-----------------------------------------------------
*/
void(entity targetEntity, float newAmmo) tbx_SetCurrentWeaponAmmo =
{
  if (!(targetEntity.flags & TBX_FLAG_ROLE_PLAYER))
  {
    tbx_EntityError(
      targetEntity,
      "tbx_SetCurrentWeaponAmmo only applies to players."
    );
    return;
  }

  targetEntity.currentammo = newAmmo;
};



/*
=======================================================================
Engine utility functions

Utility functions to safely manipulate engine-related game state.
For more information, consult the relevant id_core/id_engine.txt entry.

Please do not change these.
=======================================================================
*/

/*
-------------------------------------------------------------
Get stored value

Returns the stored parameter for provided index:
  float STOREDVALUE_ITEMFLAGS = 1;
  float STOREDVALUE_HEALTH = 2;
  float STOREDVALUE_ARMORHEALTH = 3;
  float STOREDVALUE_SHELLS = 4;
  float STOREDVALUE_NAILS = 5;
  float STOREDVALUE_ROCKETS = 6;
  float STOREDVALUE_CELLS = 7;
  float STOREDVALUE_WEAPONFLAGS = 8;
  float STOREDVALUE_ARMORTYPE = 9;   // armor type times 100

10-16 are customizable for modding.
Set new constants in your mod files.
Please follow the above naming convention.
These values are carried across map changes for each player.

valueIndex: index of the server-side parameter to write
-------------------------------------------------------------
*/
float(float valueIndex) tbx_GetStoredValue =
{
  if (valueIndex == STOREDVALUE_ITEMFLAGS)
    return parm1;

  if (valueIndex == STOREDVALUE_HEALTH)
    return parm2;

  if (valueIndex == STOREDVALUE_ARMORHEALTH)
    return parm3;

  if (valueIndex == STOREDVALUE_SHELLS)
    return parm4;

  if (valueIndex == STOREDVALUE_NAILS)
    return parm5;

  if (valueIndex == STOREDVALUE_ROCKETS)
    return parm6;

  if (valueIndex == STOREDVALUE_CELLS)
    return parm7;

  if (valueIndex == STOREDVALUE_WEAPONFLAGS)
    return parm8;

  if (valueIndex == STOREDVALUE_ARMORTYPE)
    return parm9;

  if (valueIndex == 10)
    return parm10;

  if (valueIndex == 11)
    return parm11;

  if (valueIndex == 12)
    return parm12;

  if (valueIndex == 13)
    return parm13;

  if (valueIndex == 14)
    return parm14;

  if (valueIndex == 15)
    return parm15;

  if (valueIndex == 16)
    return parm16;

  tbx_PrintDebug("Store value index '");
  tbx_PrintDebug(tbx_GetFloatString(valueIndex));
  tbx_PrintDebug("' is out of bounds.\n");
  tbx_Error("Stored value does not exist!");

  return FALSE;
};

/*
-------------------------------------------------------------
Set stored value

Sets the stored parameter to the provided value at the index:
  float STOREDVALUE_ITEMFLAGS = 1;
  float STOREDVALUE_HEALTH = 2;
  float STOREDVALUE_ARMORHEALTH = 3;
  float STOREDVALUE_SHELLS = 4;
  float STOREDVALUE_NAILS = 5;
  float STOREDVALUE_ROCKETS = 6;
  float STOREDVALUE_CELLS = 7;
  float STOREDVALUE_WEAPONFLAGS = 8;
  float STOREDVALUE_ARMORTYPE = 9;   // armor type times 100

10-16 are customizable for modding.
Set new constants in your mod files.
Please follow the above naming convention.
These values are carried across map changes for each player.

valueIndex: index of the server-side parameter to write
newValue:   new value to store at provided index
-------------------------------------------------------------
*/
void(float valueIndex, float newValue) tbx_SetStoredValue =
{
  if (valueIndex == STOREDVALUE_ITEMFLAGS)
  {
    parm1 = newValue;
    return;
  }

  if (valueIndex == STOREDVALUE_HEALTH)
  {
    parm2 = newValue;
    return;
  }

  if (valueIndex == STOREDVALUE_ARMORHEALTH)
  {
    parm3 = newValue;
    return;
  }

  if (valueIndex == STOREDVALUE_SHELLS)
  {
    parm4 = newValue;
    return;
  }

  if (valueIndex == STOREDVALUE_NAILS)
  {
    parm5 = newValue;
    return;
  }

  if (valueIndex == STOREDVALUE_ROCKETS)
  {
    parm6 = newValue;
    return;
  }

  if (valueIndex == STOREDVALUE_CELLS)
  {
    parm7 = newValue;
    return;
  }

  if (valueIndex == STOREDVALUE_WEAPONFLAGS)
  {
    parm8 = newValue;
    return;
  }

  if (valueIndex == STOREDVALUE_ARMORTYPE)
  {
    parm9 = newValue;
    return;
  }

  if (valueIndex == 10)
  {
    parm10 = newValue;
    return;
  }

  if (valueIndex == 11)
  {
    parm11 = newValue;
    return;
  }

  if (valueIndex == 12)
  {
    parm12 = newValue;
    return;
  }

  if (valueIndex == 13)
  {
    parm13 = newValue;
    return;
  }

  if (valueIndex == 14)
  {
    parm14 = newValue;
    return;
  }

  if (valueIndex == 15)
  {
    parm15 = newValue;
    return;
  }

  if (valueIndex == 16)
  {
    parm16 = newValue;
    return;
  }

  tbx_PrintDebug("Store value index '");
  tbx_PrintDebug(tbx_GetFloatString(valueIndex));
  tbx_PrintDebug("' is out of bounds.\n");
  tbx_Error("Store value index does not exist!");
};



/*
===========================
Global lifecycle functions

Please do not change these.
===========================
*/

/*
--------------------------------------------------------
Player pre-think

Function called by the engine before each physics check.
'self' is current player.
--------------------------------------------------------
*/
void() PlayerPreThink =
{
  tbx_OnBeforePhysics();
};

/*
-------------------------------------------------------
Player post-think

Function called by the engine after each physics check.
'self' is current player.
-------------------------------------------------------
*/
void() PlayerPostThink =
{
  tbx_OnAfterPhysics();
};

/*
------------------------------------------------------------------------
Client kill

Function called by the engine when a client suicides via "kill" command.
------------------------------------------------------------------------
*/
void() ClientKill =
{
  tbx_OnPlayerSuicide();
};

/*
-------------------------------------------------------------------------
Client connect

Function called by the engine when a client connects to the current game.
Used for doing the usual join announcements.
-------------------------------------------------------------------------
*/
void() ClientConnect =
{
  tbx_OnPlayerConnect();
};

/*
------------------------------------------------------------------------
Put client in server

Function called by the engine when a client is spawned in the server.
------------------------------------------------------------------------
*/
void() PutClientInServer =
{
  tbx_OnPlayerSpawn();
};

/*
------------------------------------------------------------------------
Client disconnect

Function called by the engine when a client disconnects from the server.
Used for doing the usual leave announcements.
------------------------------------------------------------------------
*/
void() ClientDisconnect =
{
  tbx_OnPlayerDisconnect();
};

/*
-------------------------------------------------------------------
Set new parameters

Function called by the engine when a client connects to the server.
It initializes and assigns parm1-parm16 to the client.
This should set starting stats and inventory for the player.
-------------------------------------------------------------------
*/
void() SetNewParms =
{
  tbx_OnPlayerInit();
};

/*
--------------------------------------------------------------
Set level-change parameters

Function called by the engine on level transition.
This should set carry-over stats and inventory for the player.
--------------------------------------------------------------
*/
void() SetChangeParms =
{
  tbx_OnMapChange();
};



/*
================================================
ToolBlox player functions

Utility functions to efficiently set up players.

Please do not change these.
================================================
*/

entity(entity afterEntity) tbx_FindNextPlayerStart =
{
  local entity playerStart = tbx_FindEntity(afterEntity, classname, "tbx_PlayerStart");

  if (playerStart != world)
    return playerStart;

  playerStart = tbx_FindEntity(afterEntity, classname, "tbx_PlayerStart");

  if (playerStart != world)
    return playerStart;

  tbx_PrintDebug("\btbx_PlayerStart\b not found.\nFalling back to \binfo_player_start\b...\n");
  playerStart = tbx_FindEntity(afterEntity, classname, "info_player_start");

  if (playerStart != world)
    return playerStart;

  tbx_PrintDebug("\binfo_player_start\b not found.\n");
  tbx_Error("No player spawn point found.");
  return playerStart;
};