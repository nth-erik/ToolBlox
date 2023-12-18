/*
==============================================================================

ToolBlox Quake core API functions

Functions responsible for core game state management.

==============================================================================
*/

/*
-------------------------------------------
Check tick

Returns if a tick (0.2 seconds) has passed.
Uses // float quake_tick; // internally.
-------------------------------------------
*/
float() quake_GetTick =
{
  return quake_tick < time;
};

/*
----------------------------------------
Set tick

Resets tick to time + 0.2 seconds.
Uses // float quake_tick; // internally.
----------------------------------------
*/
void() quake_SetTick =
{
  if (quake_tick < time)
    quake_tick = time + 0.2;
};

/*
------------------------------------------
Check second

Returns if a second has passed.
Uses // float quake_second; // internally.
------------------------------------------
*/
float() quake_GetSecond =
{
  return quake_second < time;
};

/*
------------------------------------------
Set second

Resets second to time + 1 second.
Uses // float quake_second; // internally.
------------------------------------------
*/
void() quake_SetSecond =
{
  if (quake_second < time)
    quake_second = time + 1;
};