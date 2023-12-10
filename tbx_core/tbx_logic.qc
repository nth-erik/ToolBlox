/*
==============================================================================

ToolBlox logic functions

Functions responsible for logical operations.

==============================================================================
*/



/*
-------------------------------------------------------------------
Check chance

Returns TRUE if something falls within provided success chance.

You may use logical constants instead of 0.0-1.0 values:
  */ float FALSE = 0; /*
  */ float UNLIKELY = 0.25; /*
  */ float POSSIBLE = 0.5; /*
  */ float LIKELY = 0.75; /*
  */ float TRUE = 1; /*

NOTE: Logical constants are too fundamental to use the TBX_ prefix.
-------------------------------------------------------------------
*/
float(float successFraction) CheckChance =
{
  return successFraction > tbx_GetRandomFloat();
};