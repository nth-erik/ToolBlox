/*
==============================================================================

[Quake]: Player movement config

==============================================================================
*/

/*
------------------------------------
Handle player jump

Applies upward force when on ground.
------------------------------------
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
  // TODO: load and add actual sound
  tbx_PlaySound(
    self,
    TBX_SOUND_CHANNEL_VOICE,
    TBX_SOUND_SPARKHIT,
    1,
    TBX_SOUND_FALLOFF_NORMAL
  );
};

/*
-----------------------------------
Handle player swim

Applies upward force when in water.
-----------------------------------
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
      return;
    }

    velocity_z = 0;
    tbx_SetVelocity(self, velocity + QUAKE_PLAYER_EMERGEVELOCITY);
  }
};

/*
------------------------------------------
Grab ledge

Sets the QUAKE_FLAG_ACTION_LEDGEGRAB flag.
------------------------------------------
*/
void() quake_GrabLedge =
{
  quake_SetActionFlags
  (
    self,
    tbx_AddFlags(quake_GetActionFlags(self), QUAKE_FLAG_ACTION_LEDGEGRAB)
  );
  // TODO: load and add actual sound
  tbx_PlaySound
  (
    self,
    TBX_SOUND_CHANNEL_VOICE,
    TBX_SOUND_SPARKHIT,
    0.5,
    TBX_SOUND_FALLOFF_NORMAL
  );
};

/*
--------------------------------------------
Release ledge

Unsets the QUAKE_FLAG_ACTION_LEDGEGRAB flag.
--------------------------------------------
*/
void() quake_ReleaseLedge =
{
  quake_SetActionFlags
  (
    self,
    tbx_RemoveFlags
    (
      quake_GetActionFlags(self),
      QUAKE_FLAG_ACTION_LEDGEGRAB
    )
  );
};

/*
-----------------------------------------
Handle player ledge grab

Applies upward force when facing a ledge.

NOTE: Does NOT use hacky waterjump flag.
-----------------------------------------
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
  {
    quake_ReleaseLedge();
    return;
  }

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
  {
    quake_ReleaseLedge();
    return;
  }

  // ledge is available

  // play sound when finding ledge
  if (!(quake_GetActionFlags(self) & QUAKE_FLAG_ACTION_LEDGEGRAB))
  {
    quake_GrabLedge();
  }

  // dropping, break fall first
  if (velocity_z < 0)
  {
    tbx_AddVelocity
    (
      self,
      QUAKE_PLAYER_JUMPVELOCITY / 5
    );
    return;
  }

  // climb ledge
  velocity_z = 0;
  tbx_SetVelocity
  (
    self,
    velocity + QUAKE_PLAYER_JUMPVELOCITY
  );
};