/*
==============================================================================

ToolBlox print functions

Functions responsible for displaying text.

==============================================================================
*/



/*
===========================
Engine API functions

Please do not change these.
===========================
*/

/*
---------------------------------------------------
Print broadcast

Sends global message to all players.
Can be overloaded with multiple message parameters.

broadcastMessage: message to broadcast
---------------------------------------------------
*/
void(string broadcastMessage) tbx_PrintBroadcast = #23;

/*
---------------------------------------------------
Print local

Sends local message to a specific player.
Can be overloaded with multiple message parameters.

player: entity to receive
playerMessage: message to send
---------------------------------------------------
*/
void(entity player, string playerMessage) tbx_PrintLocal = #24;

/*
-----------------------------------------------------------------------------
Print local centered

Sends message centered on screen of a specific player.
Can be overloaded with multiple message parameters.

NOTE: In the original engine, all of the strings for a centered message are
      concatenated into a single  256-character buffer, therefore excessively
      long messages should be avoided.

player: entity to receive
centeredMessage: message to send
centeredMessage[1-7]: [2-7] substrings to concatenate into centered message.
-----------------------------------------------------------------------------
*/
void(entity player, string centeredMessage) tbx_PrintLocalCentered = #73;
void(
  entity player,
  string centeredMessage,
  string centeredMessage2
) tbx_PrintLocalCentered2 = #73;
void(
  entity player,
  string centeredMessage1,
  string centeredMessage2,
  string centeredMessage3
) tbx_PrintLocalCentered3 = #73;
void(
  entity player,
  string centeredMessage1,
  string centeredMessage2,
  string centeredMessage3,
  string centeredMessage4
) tbx_PrintLocalCentered4 = #73;
void(
  entity player,
  string centeredMessage1,
  string centeredMessage2,
  string centeredMessage3,
  string centeredMessage4,
  string centeredMessage5
) tbx_PrintLocalCentered5 = #73;
void(
  entity player,
  string centeredMessage1,
  string centeredMessage2,
  string centeredMessage3,
  string centeredMessage4,
  string centeredMessage5,
  string centeredMessage6
) tbx_PrintLocalCentered6 = #73;
void(
  entity player,
  string centeredMessage1,
  string centeredMessage2,
  string centeredMessage3,
  string centeredMessage4,
  string centeredMessage5,
  string centeredMessage6,
  string centeredMessage7
) tbx_PrintLocalCentered7 = #73;