/*
==============================================================================

[Quake]: Entity config

==============================================================================
*/

/*
----------------------------------------------
Get old velocity

Gets previous velocity from entity.
Uses */ .vector quake_oldVelocity; /* field.

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