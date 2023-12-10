/*
==============================================================================

World entity constructor

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
------------------------------------
On world spawn

Callback to run as the world spawns.
Override this to add setup logic.
Defaults to doing nothing.
------------------------------------
*/
void() tbx_OnWorldSpawn =
{
  tbx_DoNothing();
};



/*
@SolidClass = worldspawn : "Map entity"
[
  message(string) : "Map title"
*/
void() worldspawn =
{
  tbx_LoadHardCodedSounds();
  tbx_LoadHardCodedModels();
  tbx_OnWorldSpawn();
};