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
void() quake_OnPlayerSpawn =
{
  local entity playerStart = tbx_FindNextPlayerStart(lastPlayerStart);
  local float startMaxHealth = tbx_GetMaxHealth(playerStart);
  local float startHealth = tbx_GetHealth(playerStart);
  local float startMinHealth = 25;

  if (startMaxHealth == 0)
  {
    startMaxHealth = QUAKE_PLAYER_MAXHEALTH;
  }

  if (startHealth == 0)
  {
    startHealth = QUAKE_PLAYER_HEALTH;
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

  tbx_SetEyePosition(self, QUAKE_PLAYER_EYEPOSITION);
  tbx_ScaleVelocity(self, 0);

  lastPlayerStart = playerStart;
};

/*
------------------
Handle player jump
------------------
*/
void() quake_HandlePlayerJump =
{
  // in air
  if (!(tbx_GetPositionFlags(self) & TBX_FLAG_POSITION_ANYGROUND))
    return;
  
  // still holding jump, don't bunny-hop
  if (!(tbx_GetActionFlags(self) & TBX_FLAG_ACTION_JUMPRELEASED))
    return;

  // can jump (also underwater!)
  tbx_AddVelocity(self, QUAKE_PLAYER_JUMPVELOCITY);
};

/*
------------------
Handle player swim
------------------
*/
void() quake_HandlePlayerSwim =
{
  local float isUnderwater = tbx_GetSubmersion(self) == TBX_SUBMERSION_EYE;

  if (isUnderwater)
  {
    local vector velocity = tbx_GetVelocity(self);

    // maximize upward movement at emerge velocity
    if (velocity_z < QUAKE_PLAYER_EMERGEVELOCITY_z)
    {
      tbx_AddVelocity(self, QUAKE_PLAYER_EMERGEVELOCITY / 5);
    }
    else
    {
      velocity_z = 0;
      tbx_SetVelocity(self, velocity + QUAKE_PLAYER_EMERGEVELOCITY);
    }
  }
};

/*
------------------------
Handle player ledge grab
------------------------
*/
void() quake_HandlePlayerLedgeGrab =
{
  local vector start;
  local vector end;
  local vector distanceData;
  local vector origin = tbx_GetOrigin(self);
  local vector orientation = tbx_GetOrientation(self);
  local vector velocity = tbx_GetVelocity(self);
  local vector waist = origin + QUAKE_PLAYER_WAISTPOSITION;
  local vector eye = origin + QUAKE_PLAYER_EYEPOSITION;
  local vector direction = tbx_GetRelativeDirection
  (
    orientation,
    TBX_DIRECTIONFLAG_FORWARD
  );
  local vector flatDirection = direction;

  flatDirection_z = 0;
  
  // waist level check
  start = waist;
  end = start + (flatDirection * QUAKE_LEDGE_DISTANCE);
  tbx_Retrace();
  distanceData = tbx_GetTraceDistances
  (
    start,
    end,
    TBX_MONSTERCHECK_SKIP,
    self
  );

  // no wall
  if (distanceData_x == 1)
    return;

  // eye level check
  start = eye;
  end = start + (flatDirection * QUAKE_LEDGE_DISTANCE);
  tbx_Retrace();
  distanceData = tbx_GetTraceDistances
  (
    start,
    end,
    TBX_MONSTERCHECK_SKIP,
    self
  );

  // no ledge
  if (distanceData_x < 1)
    return;

  velocity_z = 0;
  tbx_SetVelocity
  (
    self,
    velocity + QUAKE_PLAYER_JUMPVELOCITY
  );
};