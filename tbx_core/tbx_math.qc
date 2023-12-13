/*
==============================================================================

ToolBlox math functions

Functions responsible for calculating scalar numbers.

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
Get random float

Returns a random floating point value.
Relatively costly to produce, use sparingly.
--------------------------------------------
*/
float() tbx_GetRandomFloat = #7;

/*
--------------------------------------------------
Get rounded integer

Returns number rounded to nearest integer (whole).

rawValue: float to round
--------------------------------------------------
*/
float(float rawValue) tbx_GetRounded = #36;

/*
--------------------------------------------------------
Get floor integer

Returns number rounded to nearest lower integer (whole).

rawValue: float to round down
--------------------------------------------------------
*/
float(float rawValue) tbx_GetFloor = #37;

/*
---------------------------------------------------------
Get ceiling integer

Returns number rounded to nearest higher integer (whole).

rawValue: float to round up
---------------------------------------------------------
*/
float(float rawValue) tbx_GetCeiling = #38;

/*
--------------------------------------------
Get absolute float

Returns the absolute value of the float.

rawValue: float to return absolute value for
--------------------------------------------
*/
float(float rawValue) tbx_GetAbsolute = #43;

/*
-----------------------------------------
Get sign

Returns the sign (+1 or -1) of the float.

rawValue: float to return sign for
-----------------------------------------
*/
float(float rawValue) tbx_GetSign =
{
  return 1 - (rawValue < 0) * 2;
};



/*
===========================
ToolBlox utility functions

Please do not change these.
===========================
*/

/*
----------------------------------------------------
Average float

Returns the unweighted average of the passed floats.

value1: first float
value2: second float
----------------------------------------------------
*/
float(float value1, float value2) tbx_GetAverage =
{
  return (value1 + value2) / 2;
};

/*
----------------------------------------------------------------------------
Weighted average float

Returns the weighted average of the passed floats.
To make the weight 1:3 in favor of the second argument, use a value of 0.25.

value1: first float
value2: second float
weight: balance of weights

NOTE: Use this to interpolate between abrupt value changes by reducing the
      weight over time.
----------------------------------------------------------------------------
*/
float(float value1, float value2, float weight) tbx_GetWeightedAverage =
{
  return (value1 * weight + value2 * (1 - weight)) / 2;
};

/*
----------------------------------------
Get maximum float

Returns the higher of the passed floats.

value1: first float
value2: second float
----------------------------------------
*/
float(float value1, float value2) tbx_GetMaximum =
{
  if (value1 < value2)
    return value2;

  return value1;
};

/*
---------------------------------------
Get minimum float

Returns the lower of the passed floats.

value1: first float
value2: second float
---------------------------------------
*/
float(float value1, float value2) tbx_GetMinimum =
{
  if (value1 > value2)
    return value2;

  return value1;
};
