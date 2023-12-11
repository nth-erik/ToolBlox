/*
==============================================================================

[Quake]: Player config

==============================================================================
*/

/*
-------------------------------------------------------------------
Player Spawn handler

Looks up the next player start point and initializes the player.
Updates last player start point.

Uses: */ entity lastPlayerStart; /* to iterate through start spots.
-------------------------------------------------------------------
*/
void() quake_OnPlayerSpawn = {
  local entity playerStart = tbx_FindNextPlayerStart(lastPlayerStart);
  local float startMaxHealth = tbx_GetMaxHealth(playerStart);
  local float startHealth = tbx_GetHealth(playerStart);
  local float startMinHealth = 25;

  if (startMaxHealth == 0)
  {
    startMaxHealth = 250;
  }

  if (startHealth == 0)
  {
    startHealth = 100;
  }

  tbx_SetMaxHealth(self, startMaxHealth);
  tbx_SetHealth(self, startHealth, startMinHealth, startMaxHealth);
  tbx_SetVulnerability(self, TBX_VULNERABILITY_ALL);

  tbx_SetSolidType(self, TBX_SOLIDTYPE_SLIDEBOX);
  tbx_SetMoveType(self, TBX_MOVETYPE_MOVE);

  tbx_SetRoleFlags(self, TBX_FLAG_ROLE_PLAYER);

  tbx_SetOrigin(self, tbx_GetOrigin(playerStart));
  tbx_SetOrientation(self, tbx_GetOrientation(playerStart));
  tbx_SnapOrientation(self);

  tbx_SetModel(self, TBX_MODEL_PLAYER);
  tbx_SetBounds(self, TBX_SMALL_BOUNDS_MIN, TBX_SMALL_BOUNDS_MAX);

  tbx_SetEyePosition(self, TBX_PLAYER_EYE_POSITION);
  tbx_ScaleVelocity(self, 0);

  lastPlayerStart = playerStart;
};