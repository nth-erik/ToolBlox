/*
==============================================================================

ToolBlox lightmap functions

Functions responsible for managing the light styles.

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
Set light style

Define a lightstyle in the engine.
Style indices range from 0-63.
Values are an [a-z] string of characters where "a" is black and "z" is white.
32-62 are automatically set for switchable lights by light.exe at build time.

style: light style index to define (defaults to self.style)
value: light value animation string (defaults to "m")
-----------------------------------------------------------------------------
*/
void(float newStyle, string value) tbx_SetLightStyle = #35;



/*
===========================
ToolBlox utility functions

Please do not change these.
===========================
*/

/*
----------------------------------------------------------------------
Get light level

Returns constant light level string based on passed 0.0-1.0 intensity:
  float TBX_LIGHTLEVEL_A = 0.00; // "a"
  float TBX_LIGHTLEVEL_B = 0.04; // "b"
  float TBX_LIGHTLEVEL_C = 0.08; // "c"
  float TBX_LIGHTLEVEL_D = 0.12; // "d"
  float TBX_LIGHTLEVEL_E = 0.16; // "e"
  float TBX_LIGHTLEVEL_F = 0.20; // "f"
  float TBX_LIGHTLEVEL_G = 0.24; // "g"
  float TBX_LIGHTLEVEL_H = 0.28; // "h"
  float TBX_LIGHTLEVEL_I = 0.32; // "i"
  float TBX_LIGHTLEVEL_J = 0.36; // "j"
  float TBX_LIGHTLEVEL_K = 0.40; // "k"
  float TBX_LIGHTLEVEL_L = 0.44; // "l"
  float TBX_LIGHTLEVEL_M = 0.48; // "m"
  float TBX_LIGHTLEVEL_N = 0.52; // "n"
  float TBX_LIGHTLEVEL_O = 0.56; // "o"
  float TBX_LIGHTLEVEL_P = 0.60; // "p"
  float TBX_LIGHTLEVEL_Q = 0.64; // "q"
  float TBX_LIGHTLEVEL_R = 0.68; // "r"
  float TBX_LIGHTLEVEL_S = 0.72; // "s"
  float TBX_LIGHTLEVEL_T = 0.76; // "t"
  float TBX_LIGHTLEVEL_U = 0.80; // "u"
  float TBX_LIGHTLEVEL_V = 0.84; // "v"
  float TBX_LIGHTLEVEL_W = 0.88; // "w"
  float TBX_LIGHTLEVEL_X = 0.92; // "x"
  float TBX_LIGHTLEVEL_Y = 0.96; // "y"
  float TBX_LIGHTLEVEL_Z = 1.00; // "z"

Use this to create advanced lighting animations.

lightIntensity: 0.0-1.0 intensity to convert to light level
----------------------------------------------------------------------
*/
string(float lightIntensity) tbx_GetLightLevel =
{
  if (lightIntensity < TBX_LIGHTLEVEL_B)
    return "a";

  if (lightIntensity < TBX_LIGHTLEVEL_C)
    return "b";

  if (lightIntensity < TBX_LIGHTLEVEL_D)
    return "c";

  if (lightIntensity < TBX_LIGHTLEVEL_E)
    return "d";

  if (lightIntensity < TBX_LIGHTLEVEL_F)
    return "e";

  if (lightIntensity < TBX_LIGHTLEVEL_G)
    return "f";

  if (lightIntensity < TBX_LIGHTLEVEL_H)
    return "g";

  if (lightIntensity < TBX_LIGHTLEVEL_I)
    return "h";

  if (lightIntensity < TBX_LIGHTLEVEL_J)
    return "i";

  if (lightIntensity < TBX_LIGHTLEVEL_K)
    return "j";

  if (lightIntensity < TBX_LIGHTLEVEL_L)
    return "k";

  if (lightIntensity < TBX_LIGHTLEVEL_M)
    return "l";

  if (lightIntensity < TBX_LIGHTLEVEL_N)
    return "m";

  if (lightIntensity < TBX_LIGHTLEVEL_O)
    return "n";

  if (lightIntensity < TBX_LIGHTLEVEL_P)
    return "o";

  if (lightIntensity < TBX_LIGHTLEVEL_Q)
    return "p";

  if (lightIntensity < TBX_LIGHTLEVEL_R)
    return "q";

  if (lightIntensity < TBX_LIGHTLEVEL_S)
    return "r";

  if (lightIntensity < TBX_LIGHTLEVEL_T)
    return "s";

  if (lightIntensity < TBX_LIGHTLEVEL_U)
    return "t";

  if (lightIntensity < TBX_LIGHTLEVEL_V)
    return "u";

  if (lightIntensity < TBX_LIGHTLEVEL_W)
    return "v";

  if (lightIntensity < TBX_LIGHTLEVEL_X)
    return "w";

  if (lightIntensity < TBX_LIGHTLEVEL_Y)
    return "x";

  if (lightIntensity < TBX_LIGHTLEVEL_Z)
    return "y";

  if (lightIntensity == TBX_LIGHTLEVEL_Z)
    return "z";

  tbx_Error("Light intensity out of range.");
  return "a";
};