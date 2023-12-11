/*
==============================================================================

ToolBlox sound functions

Functions responsible for managing models.

==============================================================================
*/



/*
===========================
Engine API functions

Please do not change these.
===========================
*/

/*
--------------------------------------------
Load model

Preloads shareware model for use in the map.
Models must be loaded in a constructor.

modelPath: model path to use
--------------------------------------------
*/
string(string modelPath) tbx_LoadModel = #20;

/*
---------------------------------------------
Load registered model

Preloads registered model for use in the map.
Models must be loaded in a constructor.

modelPath: model path to use
---------------------------------------------
*/
string(string modelPath) tbx_LoadRegisteredModel = #75;



/*
=========================================
Critical assets

Not loading these assets crashes the map.

Please do not change these.
=========================================
*/

/*
---------------------------------------------------------------------------
Load hard-coded models

Loads models directly referenced by the engine.
These must be loaded from the script, or the map will crash:
  string TBX_MODEL_PLAYER = "progs/player.mdl"; // player avatar

NOTE: Replace these model files with copies of 'progs/null.lmp' for greater
      control over what and when gets emitted by entities and effects.
---------------------------------------------------------------------------
*/
void() tbx_LoadHardCodedModels =
{
  tbx_LoadModel(TBX_MODEL_PLAYER);
};