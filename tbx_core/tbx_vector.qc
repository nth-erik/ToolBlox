/*
==============================================================================

ToolBlox vector functions

Functions responsible for working with vectors.

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
Produce relative unit vectors

Produces the forward, upward and rightward pointing unit vectors based on the
input orientation and stores them in the following global variables:
  - v_forward: forward facing unit vector
  - v_up:      upward facing unit vector
  - v_right:   rightward facing unit vector

The input orientation is cached in */ vector tbx_v_lastAngles; /* so it will
not be recalculated until it changes.

sourceAngles: Facing pitch-yaw-roll to derive axes from
-----------------------------------------------------------------------------
*/
void(vector sourceAngles) tbx_ProduceRelativeUnitVectors =
{
  if (sourceAngles != tbx_v_lastAngles){
    tbx_v_lastAngles = sourceAngles;
    _1(sourceAngles);
  }
};

/*
---------------------------------------------
Get unit vector

Returns a unit-length directional vector.
Used for calculating velocity or dot product.

rawVector: vector to normalize
---------------------------------------------
*/
vector(vector rawVector) tbx_GetUnitVector = #9;

/*
------------------------------------------
Get vector length

Returns the scalar absolute vector length.
Used for measuring distance.

sourceVector: vector to measure
------------------------------------------
*/
float(vector sourceVector) tbx_GetVectorLength = #12;

/*
-----------------------------------------
Get vector yaw

Returns the horizontal angle of a vector.

sourceVector: vector to extract yaw from
-----------------------------------------
*/
float(vector sourceVector) tbx_GetVectorYaw = #13;

/*
---------------------------------------------------
Get vector angles

Returns the pitch, yaw and roll angles of a vector.
Roll is always 0.

sourceVector: vector to extract angles from
---------------------------------------------------
*/
vector(vector sourceVector) tbx_GetVectorAngles = #51;



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
Get relative direction

Returns a relative direction unit vector for the requested orientation(s):
  */ float DIRECTIONFLAG_RIGHT = 1; /*
  */ float DIRECTIONFLAG_FORWARD = 2; /*
  */ float DIRECTIONFLAG_UP = 4; /*
  */ float DIRECTIONFLAG_LEFT = 8; /*
  */ float DIRECTIONFLAG_BACKWARD = 16; /*
  */ float DIRECTIONFLAG_DOWN = 32; /*

You can freely combine the direction flags to get diagonal units as well.

sourceAngles: Facing pitch-yaw-roll to derive axes from
targetDirection: Relative direction vector to get using the above constants

NOTE: The direction flags DO NOT STACK.
-----------------------------------------------------------------------------
*/
vector(vector sourceAngles, float targetDirection) tbx_GetRelativeDirection =
{
  local vector combinedDirection;

  combinedDirection = '0 0 0';
  tbx_ProduceRelativeUnitVectors(sourceAngles);

  if (targetDirection & DIRECTIONFLAG_RIGHT)
    combinedDirection = combinedDirection + v_right;

  if (targetDirection & DIRECTIONFLAG_FORWARD)
    combinedDirection = combinedDirection + v_forward;

  if (targetDirection & DIRECTIONFLAG_UP)
    combinedDirection = combinedDirection + v_up;

  if (targetDirection & DIRECTIONFLAG_LEFT)
    combinedDirection = combinedDirection - v_right;

  if (targetDirection & DIRECTIONFLAG_BACKWARD)
    combinedDirection = combinedDirection - v_forward;

  if (targetDirection & DIRECTIONFLAG_DOWN)
    combinedDirection = combinedDirection - v_up;

  return tbx_GetUnitVector(combinedDirection);
};