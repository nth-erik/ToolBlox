/*
==============================================================================

ToolBlox network functions

Functions responsible for managing network messages.

==============================================================================
*/



/*
===========================
Engine API functions

Please do not change these.
===========================
*/

/*
-----------------------------------------------------------------------------
Write network byte

Writes a network message byte.

networkChannel: reliability channel
  */ float TBX_NETWORKCHANNEL_BROADCAST = 0; /* unreliable reception
  */ float TBX_NETWORKCHANNEL_PLAYER = 1; /* reliable client reception
  */ float TBX_NETWORKCHANNEL_SYNC = 2; /* reliable synchronized reception
  */ float TBX_NETWORKCHANNEL_INIT = 3; /* initialization string reception

messageByte:    byte to send, init message with below enums
  */ float TBX_MESSAGEBYTE_UPDATE_STAT = 3; /* update game stat
  */ float TBX_MESSAGEBYTE_CAM_VIEWPORT = 5; /* (unused) set camera viewport
  */ float TBX_MESSAGEBYTE_CAM_ANGLES = 10; /* (unused) set camera angles
  */ float TBX_MESSAGEBYTE_TEMP_ENTITY = 23; /* start of temporary entity
  */ float TBX_MESSAGEBYTE_MONSTER_KILLED = 27; /* +1 monster killed
  */ float TBX_MESSAGEBYTE_SECRET_FOUND = 28; /* +1 secret found
  */ float TBX_MESSAGEBYTE_INTERMISSION_START = 30; /* show intermission
  */ float TBX_MESSAGEBYTE_EPILOGUE_START = 31; /* show episode end paragraph
  */ float TBX_MESSAGEBYTE_CHANGE_MUSIC = 32; /* change CD track
  */ float TBX_MESSAGEBYTE_SELL_SCREEN = 33; /* enter shill mode
  */ float TBX_MESSAGEBYTE_CUTSCENE_START = 34; /* (unused) start cutscene
  */ float TBX_MESSAGEBYTE_UPDATE_ENTITY = 128; /* (unused) updates entity
-----------------------------------------------------------------------------
*/
void(float networkChannel, float messageByte) tbx_WriteNetworkByte = #52;

/*
-----------------------------------
Write network character

Unused.

networkChannel: reliability channel
messageChar:    character to send
-----------------------------------
*/
void(float networkChannel, float messageChar) tbx_WriteNetworkChar = #53;

/*
--------------------------------------
Write network short integer

Unused.

networkChannel:  reliability channel
messageShortInt: short integer to send
--------------------------------------
*/
void(
  float networkChannel,
  float messageShortInt
) tbx_WriteNetworkShortInt = #54;

/*
-------------------------------------------
Write network long integer

Used for updating total number of monsters.

networkChannel: reliability channel
messageLongInt: long integer to send
-------------------------------------------
*/
void(
  float networkChannel,
  float messageLongInt
) tbx_WriteNetworkLongInt = #55;

/*
---------------------------------------------------------------
Write network coodrinate

Used for origin of temporary entities, once for each dimension.

networkChannel:    reliability channel
messageCoordinate: scalar float for _x, _y or _z
---------------------------------------------------------------
*/
void(
  float networkChannel,
  float messageCoordinate
) tbx_WriteNetworkCoordinate = #56;

/*
----------------------------------------------------------------------
Write network angle

This function writes a single byte that represents 256 * (angle / 380)

Unused.

networkChannel:    reliability channel
messageCoordinate: scalar float for _x, _y or _z
----------------------------------------------------------------------
*/
void(
  float networkChannel,
  float messageCoordinate
) tbx_WriteNetworkAngle = #57;

/*
-------------------------------------------------------------
Write network string

Used for writing episode finale paragraphs.
Writes a string, terminated by "\0" (the null character in C)

networkChannel: reliability channel
messageString:  "\0" terminated string
-------------------------------------------------------------
*/
void(float networkChannel, string messageString) tbx_WriteNetworkString = #58;

/*
---------------------------------------------
Write network entity

Used with lightnings.
Writes an entity reference, taking two bytes.

networkChannel: reliability channel
messageEntity:  entity reference to send
---------------------------------------------
*/
void(float networkChannel, entity messageEntity) tbx_WriteNetworkEntity = #59;



/*
=======================================================================
Engine utility functions

Utility functions to safely manipulate engine-related game state.
For more information, consult the relevant id_core/id_engine.txt entry.

Please do not change these.
=======================================================================
*/

/*
----------------------------------------------------------------
Get local message player

Returns the player currently receiving private network messages.
----------------------------------------------------------------
*/
entity() tbx_GetLocalMessagePlayer =
{
  return msg_entity;
};

/*
-----------------------------------------------------------------
Set local message player

Updates the player which should receive private network messages.

newPlayer: the player to receive private messages.
-----------------------------------------------------------------
*/
void(entity newPlayer) tbx_SetLocalMessagePlayer =
{
  msg_entity = newPlayer;
};