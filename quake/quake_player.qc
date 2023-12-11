/*
==============================================================================

[Quake]: Player config

==============================================================================
*/

/*
-------------------------------------------------------------------------
Player Spawn handler

Looks up the next player start point and initializes the player.
Updates last player start point.

Uses:
  */ entity lastPlayerStart; /*
  */ float TBX_VULNERABILITY_ALL = 2; /*
  */ float TBX_SOLIDTYPE_SLIDEBOX = 3; /*
  */ float TBX_MOVETYPE_MOVE = 3; /*
  */ float TBX_FLAG_ROLE_PLAYER = 8; /*
  */ vector TBX_PLAYER_EYE_POSITION = '0 0 22'; /*
  */ vector TBX_SMALL_BOUNDS_MIN = '-16 -16 -24'; /*
  */ vector TBX_SMALL_BOUNDS_MAX = '16 16 32'; /*
  */ entity(entity afterEntity) tbx_FindNextPlayerStart; /*
  */ float(entity sourceEntity) tbx_GetHealth; /*
  */ float(entity sourceEntity) tbx_GetMaxHealth; /*
  */ vector(entity sourceEntity) tbx_GetOrigin; /*
  */ vector(entity sourceEntity) tbx_GetOrientation; /*
  */ void(entity sourceEntity) tbx_SnapOrientation; /*
  */ void(
       entity targetEntity,
       float new,
       float min,
       float max
     ) tbx_SetHealth; /*
  */ void(entity targetEntity, float new) tbx_SetMaxHealth; /*
  */ void(entity targetEntity, float newType) tbx_SetVulnerability /*
  */ void(entity targetEntity, float newType) tbx_SetSolidType /*
  */ void(entity targetEntity, float newType) tbx_SetMoveType /*
  */ void(entity targetEntity, float newType) tbx_SetRoleFlags /*
  */ void(entity targetEntity, vector newVec) tbx_SetOrigin /*
  */ void(entity targetEntity, vector newVec) tbx_SetOrientation /*
  */ void(entity targetEntity, string path) tbx_SetModel /*
  */ void(entity targetEntity, vector vmin, vector vmax) tbx_SetBounds /*
  */ void(entity targetEntity, vector eyePosition) tbx_SetEyePosition /*
  */ void(entity targetEntity, float scale) tbx_ScaleVelocity /*
-------------------------------------------------------------------------
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

  tbx_SetModel(self, "progs/player.mdl");
  tbx_SetBounds(self, TBX_SMALL_BOUNDS_MIN, TBX_SMALL_BOUNDS_MAX);

  tbx_SetEyePosition(self, TBX_PLAYER_EYE_POSITION);
  tbx_ScaleVelocity(self, 0);

  lastPlayerStart = playerStart;
};