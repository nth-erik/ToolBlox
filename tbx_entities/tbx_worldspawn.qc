/*
==============================================================================

World entity constructor

Please do not change this.

==============================================================================
*/

void() worldspawn =
{
  tbx_LoadHardCodedSounds();
  tbx_LoadHardCodedModels();
  tbx_OnWorldSpawn();
};