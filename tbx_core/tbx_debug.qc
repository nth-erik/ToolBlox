/*
==============================================================================

ToolBlox debugging functions

Functions responsible for providing debugging features.

==============================================================================
*/



/*
===========================
Engine API functions

Please do not change these.
===========================
*/

/*
-------------------------------------------------------
Print debug

Sends message to all players when "developer 1" is set.
Can be overloaded with multiple message parameters.

debugMessage: message to send
-------------------------------------------------------
*/
void(string debugMessage) tbx_PrintDebug = #25;

/*
-------------------------------
Core dump

Prints all entities to console.
Used for debugging.
-------------------------------
*/
void() tbx_CoreDump = #28;

/*
------------------------
Start function tracing

Begins function tracing.
Used for debugging.
------------------------
*/
void() tbx_StartFunctionTracing = #29;

/*
----------------------
Stop function tracing

Ends function tracing.
Used for debugging.
----------------------
*/
void() tbx_StopFunctionTracing = #30;

/*
-----------------------------------
Print entity

Print details of entity to console.
Used for debugging.

sourceEntity: entity to print
-----------------------------------
*/
void(entity sourceEntity) tbx_PrintEntity = #31;



/*
===========================
ToolBlox utility functions

Please do not change these.
===========================
*/

/*
---------------------------------------------------------------------
Print deprecation

Prints a deprecation warning to the console if debug mode is enabled.

oldFunction: deprecated function name
newFunction: new function name to use
---------------------------------------------------------------------
*/
void(string oldFunction, string newFunction) tbx_PrintDeprecation =
{
  tbx_PrintDebug("\nWarning: '");
  tbx_PrintDebug(oldFunction);
  tbx_PrintDebug("' is deprecated.\n");
  tbx_PrintDebug("Please use '");
  tbx_PrintDebug(newFunction);
  tbx_PrintDebug("' instead.\n");
};