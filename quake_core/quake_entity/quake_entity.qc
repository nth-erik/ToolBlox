/*
==============================================================================

[Quake]: Entity config

==============================================================================
*/

/*
----------------------------------------------
Get old velocity

Gets previous velocity from entity.
Uses // .vector quake_oldVelocity; // field.

sourceEntity: Entity to get old velocity from.
----------------------------------------------
*/
vector(entity sourceEntity) quake_GetOldVelocity =
{
  return sourceEntity.quake_oldVelocity;
};

/*
--------------------------------------------------------
Set old velocity

Sets previous velocity for entity from current velocity.

targetEntity: Entity to set old velocity from.
--------------------------------------------------------
*/
void(entity targetEntity) quake_SetOldVelocity =
{
  // NOTE: use standard getters like this
  targetEntity.quake_oldVelocity = tbx_GetVelocity(targetEntity);
};

/*
---------------------------------------------------------------------------
Get soak types

Returns the soak types per height from entity as a vector of pointcontents:
  float TBX_POINTCONTENT_EMPTY = -1; // Empty (air)
  float TBX_POINTCONTENT_SOLID = -2; // Solid (wall)
  float TBX_POINTCONTENT_WATER = -3; // Water (swim)
  float TBX_POINTCONTENT_SLIME = -4; // Slime (swim, low damage)
  float TBX_POINTCONTENT_LAVA = -5;  // Lava (swim, high frequent damage)
  float TBX_POINTCONTENT_SKY = -6;   // Sky (wall, despawns projectiles)
Coordinates:
  _x: type at knee
  _y: type at waist
  _z: type at eyes

Uses // .vector quake_soakTypes; // internally.

sourceEntity: Entity to get value from.
---------------------------------------------------------------------------
*/
vector(entity sourceEntity) quake_GetSoakTypes =
{
  return sourceEntity.quake_soakTypes;
};

/*
-------------------------------------------------------------------------
Set soak types

Sets the soak types per height from entity as a vector of pointcontents:
  float TBX_POINTCONTENT_EMPTY = -1; // Empty (air)
  float TBX_POINTCONTENT_SOLID = -2; // Solid (wall)
  float TBX_POINTCONTENT_WATER = -3; // Water (swim)
  float TBX_POINTCONTENT_SLIME = -4; // Slime (swim, low damage)
  float TBX_POINTCONTENT_LAVA = -5;  // Lava (swim, high frequent damage)
  float TBX_POINTCONTENT_SKY = -6;   // Sky (wall, despawns projectiles)

Uses // .vector quake_soakTypes; // internally.

targetEntity: Entity to set value for.
newSoakTypes: Soak types for coordinates. 0 keeps original pointcontent.
  _x: type at knee
  _y: type at waist
  _z: type at eyes
-------------------------------------------------------------------------
*/
void
(
  entity targetEntity,
  vector newSoakTypes
) quake_SetSoakTypes =
{
  if (newSoakTypes_x)
    targetEntity.quake_soakTypes_x = newSoakTypes_x;

  if (newSoakTypes_y)
    targetEntity.quake_soakTypes_y = newSoakTypes_y;

  if (newSoakTypes_z)
    targetEntity.quake_soakTypes_z = newSoakTypes_z;
};

/*
------------------------------------------------------------------------------
Get action flags

Returns the current entity action flags:
  float QUAKE_FLAG_ACTION_LEDGEGRAB = 2048;  // Vaulting ledge

Uses // .vector quake_flags; // internally.

sourceEntity: the entity to read the value from
------------------------------------------------------------------------------
*/
float(entity sourceEntity) quake_GetActionFlags =
{
  local float actionFlags =
  (
    sourceEntity.quake_flags & QUAKE_FLAG_ACTION_LEDGEGRAB
  );

  return actionFlags;
};

/*
------------------------------------------------------------------------
Set action flags

Updates the current entity action flags:
  float QUAKE_FLAG_ACTION_LEDGEGRAB = 2048;  // Vaulting ledge

Uses // .vector quake_flags; // internally.

NOTE: This setter pre-filters the flagset.

targetEntity: the entity to change the value for
newFlags:     new action flags
------------------------------------------------------------------------
*/
void(entity targetEntity, float newFlags) quake_SetActionFlags =
{
  // keep only action flags
  local float actionFlags = newFlags & QUAKE_FLAG_ACTION_LEDGEGRAB;

  targetEntity.quake_flags = (
    tbx_RemoveFlags(targetEntity.quake_flags, QUAKE_FLAG_ACTION_LEDGEGRAB) |
    actionFlags
  );
};