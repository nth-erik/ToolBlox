/*
==============================================================================

ToolBlox Quake core API functions

Functions responsible for core game state management.

==============================================================================
*/



/*
===========================
Engine API functions

Please do not change these.
===========================
*/

/*
#5 Removed
*/

/*
----------------------------------------------------------------------
Break

Drops out of process loops or decision branches.
Use with 'switch' statements to isolate cases in advanced compilers.
Works without parentheses.

NOTE: This simulates a statement, so the 'tbx_' prefix is not used.
      This is a direct duplicate of the original id_core API function.
----------------------------------------------------------------------
*/
// void() break = #6;

/*
-------------------------------------------
Error

Halts execution and displays error message.
Used for fatal (game-breaking) errors.

message: message to display in console
-------------------------------------------
*/
void(string message) tbx_Error = #10;

/*
---------------------------------------------------------
Entity error

Removes current entity and displays error message.
Used for manageable (non-breaking) entity errors.

sourceEntity: entity causing the error (defaults to self)
message:      message to display in console
---------------------------------------------------------
*/
void(entity sourceEntity, string message) tbx_EntityError =
{
  local entity oldSelf;

  oldSelf = self;
  self = sourceEntity;
  _11(message);
  self = oldSelf;
};

/*
#33 Removed
*/

/*
#39 Removed
*/

/*
#42 is the answer
*/

/*
----------------------------------------------------
Get console variable

Returns the value of the requested console variable.

variableName: console variable name to read out
----------------------------------------------------
*/
float(string variableName) tbx_GetConsoleVariable = #45;

/*
--------------------------------------------
Print server command

Sends a command to the server console.
Must be terminated with an escaped new line.

commandMessage: the command to execute
--------------------------------------------
*/
void(string commandMessage) tbx_PrintServerCommand = #46;

/*
#50 Removed
*/

/*
#60 Removed
*/

/*
#61 Removed
*/

/*
#62 Removed
*/

/*
#63 Removed
*/

/*
#64 Removed
*/

/*
#65 Removed
*/

/*
#66 Removed
*/

/*
-------------------------------------------------------------------
Load file

Quake progs compiler uses it to copy shareware files into PAK0.PAK.
No effect during gameplay.

filePath: file path to copy to PAK
-------------------------------------------------------------------
*/
string(string filePath) tbx_LoadFile= #68;

/*
#71 Removed
*/

/*
-----------------------------------------------------------------------------
Set console variable

Updates the value of the named console variable.

NOTE: May set the cvar to zero when the string value contains leading spaces.
      This is confirmed behavior for DOSQuake 1.08 and WinQuake 1.0.

variableName: console variable name to read out
newValue: string(!) value to update cvar with
-----------------------------------------------------------------------------
*/
void(string variableName, string newValue) tbx_SetConsoleVariable = #72;

/*
--------------------------------------------------------------------
Load registered file

Quake progs compiler uses it to copy registered files into PAK0.PAK.
No effect during gameplay.

filePath: file path to copy to PAK
--------------------------------------------------------------------
*/
string(string s) tbx_LoadRegisteredFile = #77;

/*
-------------------------------------------------------------
Write spawn parameters

Persists values of parm1-parm16 globals on server for entity.
Used at map start and co-op respawn.

player: The player to set the parm values for
-------------------------------------------------------------
*/
void(entity player) tbx_WriteSpawnParameters = #78;



/*
=======================================================================
Engine utility functions

Utility functions to safely manipulate engine-related game state.
For more information, consult the relevant id_core/id_engine.txt entry.

Please do not change these.
=======================================================================
*/

/*
-----------------------------------------------------------------------------
Add episode flags

Sets completed episode(s) as TRUE in the server flags:
  */ float EPISODEFLAG_DOOMED = 1; /* Dimension of the Doomed
  */ float EPISODEFLAG_BLACK = 2; /* The Realm of Black Magic
  */ float EPISODEFLAG_NETHER = 4; /* The Netherworld
  */ float EPISODEFLAG_ELDER = 8; /* The Elder World
  */ float EPISODEFLAG_ALL = 15; /* All episodes

This function does NOT manage flags other than the original episode runes.

targetEpisodeFlags: a flagset of runes to merge over the current server flags

NOTE: The server flags are carried over to the next map.
-----------------------------------------------------------------------------
*/
void(float targetEpisodeFlags) tbx_AddEpisodeFlags =
{
  if (targetEpisodeFlags > EPISODEFLAG_ALL)
  {
    serverflags = EPISODEFLAG_ALL;
    return;
  }

  if (targetEpisodeFlags < 0)
  {
    tbx_PrintDebug("tbx_AddEpisodeFlags cannot remove flags - ");
    tbx_PrintDebug("Use tbx_RemoveEpisodeFlags to unset them.\n");
    return;
  }

  serverflags = serverflags | targetEpisodeFlags;
};

/*
------------------------------------------------------------------------------
Remove episode flags

Sets completed episode(s) as FALSE in the server flags:
  // float EPISODEFLAG_DOOMED = 1; // Dimension of the Doomed
  // float EPISODEFLAG_BLACK = 2; // The Realm of Black Magic
  // float EPISODEFLAG_NETHER = 4; // The Netherworld
  // float EPISODEFLAG_ELDER = 8; // The Elder World
  // float EPISODEFLAG_ALL = 15; // All episodes

This function does NOT manage flags other than the original episode runes.

targetEpisodeFlags: a flagset of runes to remove from the current server flags

NOTE: The server flags are carried over to the next map.
------------------------------------------------------------------------------
*/
void(float targetEpisodeFlags) tbx_RemoveEpisodeFlags =
{
  if (targetEpisodeFlags > EPISODEFLAG_ALL)
  {
    serverflags = serverflags - (serverflags & EPISODEFLAG_ALL);
    return;
  }

  if (targetEpisodeFlags < 0)
  {
    tbx_PrintDebug("tbx_RemoveEpisodeFlags cannot add flags - ");
    tbx_PrintDebug("Use tbx_AddEpisodeFlags to set them.\n");
    return;
  }

  serverflags = serverflags - (serverflags & targetEpisodeFlags);
};

/*
------------------------------------------
Load main

Loads assets in main function for testing.
------------------------------------------
*/
void() tbx_LoadMain =
{
  tbx_LoadFile("progs.dat");
  tbx_LoadFile("gfx.wad");
  tbx_LoadFile("quake.rc");
  tbx_LoadFile("default.cfg");

  tbx_LoadFile("end1.bin");
  tbx_LoadRegisteredFile("end2.bin");

  tbx_LoadFile("demo1.dem");
  tbx_LoadFile("demo2.dem");
  tbx_LoadFile("demo3.dem");

  tbx_LoadFile("gfx/palette.lmp");
  tbx_LoadFile("gfx/colormap.lmp");

  // pop is registered-only
  tbx_LoadRegisteredFile("gfx/pop.lmp");

  tbx_LoadFile("gfx/complete.lmp");
  tbx_LoadFile("gfx/inter.lmp");

  tbx_LoadFile("gfx/ranking.lmp");
  tbx_LoadFile("gfx/vidmodes.lmp");
  tbx_LoadFile("gfx/finale.lmp");
  tbx_LoadFile("gfx/conback.lmp");
  tbx_LoadFile("gfx/qplaque.lmp");

  tbx_LoadFile("gfx/menudot1.lmp");
  tbx_LoadFile("gfx/menudot2.lmp");
  tbx_LoadFile("gfx/menudot3.lmp");
  tbx_LoadFile("gfx/menudot4.lmp");
  tbx_LoadFile("gfx/menudot5.lmp");
  tbx_LoadFile("gfx/menudot6.lmp");

  tbx_LoadFile("gfx/menuplyr.lmp");
  tbx_LoadFile("gfx/bigbox.lmp");
  tbx_LoadFile("gfx/dim_modm.lmp");
  tbx_LoadFile("gfx/dim_drct.lmp");
  tbx_LoadFile("gfx/dim_ipx.lmp");
  tbx_LoadFile("gfx/dim_tcp.lmp");
  tbx_LoadFile("gfx/dim_mult.lmp");
  tbx_LoadFile("gfx/mainmenu.lmp");

  tbx_LoadFile("gfx/box_tl.lmp");
  tbx_LoadFile("gfx/box_tm.lmp");
  tbx_LoadFile("gfx/box_tr.lmp");

  tbx_LoadFile("gfx/box_ml.lmp");
  tbx_LoadFile("gfx/box_mm.lmp");
  tbx_LoadFile("gfx/box_mm2.lmp");
  tbx_LoadFile("gfx/box_mr.lmp");

  tbx_LoadFile("gfx/box_bl.lmp");
  tbx_LoadFile("gfx/box_bm.lmp");
  tbx_LoadFile("gfx/box_br.lmp");

  tbx_LoadFile("gfx/sp_menu.lmp");
  tbx_LoadFile("gfx/ttl_sgl.lmp");
  tbx_LoadFile("gfx/ttl_main.lmp");
  tbx_LoadFile("gfx/ttl_cstm.lmp");

  tbx_LoadFile("gfx/mp_menu.lmp");

  tbx_LoadFile("gfx/netmen1.lmp");
  tbx_LoadFile("gfx/netmen2.lmp");
  tbx_LoadFile("gfx/netmen3.lmp");
  tbx_LoadFile("gfx/netmen4.lmp");
  tbx_LoadFile("gfx/netmen5.lmp");

  tbx_LoadFile("gfx/sell.lmp");

  tbx_LoadFile("gfx/help0.lmp");
  tbx_LoadFile("gfx/help1.lmp");
  tbx_LoadFile("gfx/help2.lmp");
  tbx_LoadFile("gfx/help3.lmp");
  tbx_LoadFile("gfx/help4.lmp");
  tbx_LoadFile("gfx/help5.lmp");

  tbx_LoadFile("gfx/pause.lmp");
  tbx_LoadFile("gfx/loading.lmp");

  tbx_LoadFile("gfx/p_option.lmp");
  tbx_LoadFile("gfx/p_load.lmp");
  tbx_LoadFile("gfx/p_save.lmp");
  tbx_LoadFile("gfx/p_multi.lmp");

  tbx_LoadSound("misc/menu1.wav");
  tbx_LoadSound("misc/menu2.wav");
  tbx_LoadSound("misc/menu3.wav");

  tbx_LoadSound("ambience/water1.wav");
  tbx_LoadSound("ambience/wind2.wav");

  // shareware
  tbx_LoadFile("maps/start.bsp");

  tbx_LoadFile("maps/e1m1.bsp");
  tbx_LoadFile("maps/e1m2.bsp");
  tbx_LoadFile("maps/e1m3.bsp");
  tbx_LoadFile("maps/e1m4.bsp");
  tbx_LoadFile("maps/e1m5.bsp");
  tbx_LoadFile("maps/e1m6.bsp");
  tbx_LoadFile("maps/e1m7.bsp");
  tbx_LoadFile("maps/e1m8.bsp");

  // registered
  tbx_LoadRegisteredFile("maps/e2m1.bsp");
  tbx_LoadRegisteredFile("maps/e2m2.bsp");
  tbx_LoadRegisteredFile("maps/e2m3.bsp");
  tbx_LoadRegisteredFile("maps/e2m4.bsp");
  tbx_LoadRegisteredFile("maps/e2m5.bsp");
  tbx_LoadRegisteredFile("maps/e2m6.bsp");
  tbx_LoadRegisteredFile("maps/e2m7.bsp");

  tbx_LoadRegisteredFile("maps/e3m1.bsp");
  tbx_LoadRegisteredFile("maps/e3m2.bsp");
  tbx_LoadRegisteredFile("maps/e3m3.bsp");
  tbx_LoadRegisteredFile("maps/e3m4.bsp");
  tbx_LoadRegisteredFile("maps/e3m5.bsp");
  tbx_LoadRegisteredFile("maps/e3m6.bsp");
  tbx_LoadRegisteredFile("maps/e3m7.bsp");

  tbx_LoadRegisteredFile("maps/e4m1.bsp");
  tbx_LoadRegisteredFile("maps/e4m2.bsp");
  tbx_LoadRegisteredFile("maps/e4m3.bsp");
  tbx_LoadRegisteredFile("maps/e4m4.bsp");
  tbx_LoadRegisteredFile("maps/e4m5.bsp");
  tbx_LoadRegisteredFile("maps/e4m6.bsp");
  tbx_LoadRegisteredFile("maps/e4m7.bsp");
  tbx_LoadRegisteredFile("maps/e4m8.bsp");

  tbx_LoadRegisteredFile("maps/end.bsp");

  tbx_LoadRegisteredFile("maps/dm1.bsp");
  tbx_LoadRegisteredFile("maps/dm2.bsp");
  tbx_LoadRegisteredFile("maps/dm3.bsp");
  tbx_LoadRegisteredFile("maps/dm4.bsp");
  tbx_LoadRegisteredFile("maps/dm5.bsp");
  tbx_LoadRegisteredFile("maps/dm6.bsp");
};



/*
=============================================================
Global lifecycle functions

Please do not change these.
Override the provided ToolBlox callbacks to design behaviors.
=============================================================
*/

/*
------------------------------------------
Main function

Main function.
Used for progs testing outside the engine.
------------------------------------------
*/
void() main =
{
  tbx_LoadMain();
};

/*
------------------------------------------------
Start frame

Runs at the start of each frame.
Uses */ float tbx_firstFrameDone; /* internally.
------------------------------------------------
*/
void() StartFrame =
{
  if (!tbx_firstFrameDone)
  {
    tbx_firstFrameDone = TRUE;
    tbx_OnFirstFrameStart();
  }

  tbx_OnFrameStart();
};