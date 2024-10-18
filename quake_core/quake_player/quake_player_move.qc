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
  tbx_PlaySound(
    self,
    TBX_SOUND_CHANNEL_VOICE,
    QUAKE_SOUND_PLAYER_HUH,
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
Plays grab sound.

soundFile: sound to play when grabbing
------------------------------------------
*/
void(string soundFile) quake_GrabLedge =
{
  if (quake_GetActionFlags(self) & QUAKE_FLAG_ACTION_LEDGEGRAB)
    return;

  tbx_PlaySound
  (
    self,
    TBX_SOUND_CHANNEL_BODY,
    soundFile,
    1,
    TBX_SOUND_FALLOFF_NORMAL
  );
  quake_SetActionFlags
  (
    self,
    tbx_AddFlags(quake_GetActionFlags(self), QUAKE_FLAG_ACTION_LEDGEGRAB)
  );
  tbx_PrintDebug(soundFile);
  tbx_PrintDebug(" grabbing\n");
};

/*
--------------------------------------------
Release ledge

Unsets the QUAKE_FLAG_ACTION_LEDGEGRAB flag.
--------------------------------------------
*/
void() quake_ReleaseLedge =
{
  if (!(quake_GetActionFlags(self) & QUAKE_FLAG_ACTION_LEDGEGRAB))
    return;

  quake_SetActionFlags
  (
    self,
    tbx_RemoveFlags
    (
      quake_GetActionFlags(self),
      QUAKE_FLAG_ACTION_LEDGEGRAB
    )
  );
  tbx_PrintDebug("releasing\n");
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
  local vector right = tbx_GetRelativeDirection
  (
    orientation,
    TBX_DIRECTIONFLAG_RIGHT
  );
  local vector flatDirection = direction;
  local vector ledgePosition;

  flatDirection_z = 0;
  right_z = 0;

  flatDirection = flatDirection * QUAKE_LEDGE_DISTANCE;
  right = right * 4;
  
  // waist level check
  start = waist;
  end = start + flatDirection;
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
  end = start + flatDirection;
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

  // find grab height
  start = waist + flatDirection;
  end = start;
  end_z = eye_z;
  tbx_Retrace();
  distanceData = tbx_GetTraceDistances
  (
    start,
    end,
    TBX_MONSTERCHECK_SKIP,
    self
  );
  ledgePosition = start;
  ledgePosition_z = ledgePosition_z + (end_z - start_z) * distanceData_x;
  tbx_PrintDebug(tbx_GetFloatString(distanceData_y));
  tbx_PrintDebug("\n");

  // check right slope
  start = ledgePosition;
  end = ledgePosition + right;
  tbx_Retrace();
  distanceData = tbx_GetTraceDistances
  (
    start,
    end,
    TBX_MONSTERCHECK_SKIP,
    self
  );

  // on right slope
  if (distanceData_x < 1)
  {
    quake_ReleaseLedge();
    return;
  }

  // check left slope
  start = ledgePosition;
  end = ledgePosition - right;
  tbx_Retrace();
  distanceData = tbx_GetTraceDistances
  (
    start,
    end,
    TBX_MONSTERCHECK_SKIP,
    self
  );

  // on left slope
  if (distanceData_x < 1)
  {
    quake_ReleaseLedge();
    return;
  }

  // ledge is available
  // dropping, break fall first
  if (velocity_z < 0)
  {
    tbx_AddVelocity
    (
      self,
      QUAKE_PLAYER_JUMPVELOCITY * 0.2
    );
    // FIXME: sound doesn't play here for some reason
    quake_GrabLedge(QUAKE_SOUND_FOLEY_LEDGESLIP);
    tbx_PrintDebug(tbx_GetFloatString(velocity_z));
    tbx_PrintDebug(" \bslowing\b\n");
    return;
  }

  // climb ledge
  velocity_z = 0;
  tbx_SetVelocity
  (
    self,
    velocity + QUAKE_PLAYER_JUMPVELOCITY
  );
  quake_GrabLedge(QUAKE_SOUND_FOLEY_LEDGEGRAB);
  tbx_PrintDebug(tbx_GetFloatString(velocity_z));
  tbx_PrintDebug(" climbing\n");
};