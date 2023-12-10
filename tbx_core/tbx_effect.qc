/*
==============================================================================

ToolBlox effect functions

Functions responsible for managing special effects.

==============================================================================
*/



/*
===========================
Engine API functions

Please do not change these.
===========================
*/

/*
----------------------------------------
Spawn particles

Creates a mass of dropping particles.

sourceOrigin: starting origin point
velocity      velocity vector
color:        color index
density:      particle density in volume
----------------------------------------
*/
void(
  vector sourceOrigin,
  vector velocity,
  float color,
  float density
) tbx_SpawnParticles = #48;