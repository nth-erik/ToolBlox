/*
==============================================================================

[Quake]: Player vital signs config

==============================================================================
*/

/*
-----------------------------------------
Lose health

Applies damage over a certain drop speed.
-----------------------------------------
*/
void(entity targetEntity, float damage) quake_LoseHealth =
{
  // Pentagram prevents life loss
  if (tbx_GetItemFlags(targetEntity) & TBX_ITEMFLAG_PENTAGRAM || damage < 1)
    return;

  tbx_PrintDebug("\nHealth damage: ");
  tbx_PrintDebug(tbx_GetFloatString(damage));
  tbx_PrintDebug("\n");

  local float health = tbx_GetHealth(targetEntity);
  tbx_AddHealth(targetEntity, -damage, health - damage, health);
};

/*
----------------------------------------------
Handle fall

Applies fall damage over a certain drop speed.

targetEntity: Entity to fall-check
----------------------------------------------
*/
void(entity targetEntity) quake_HandleFall =
{
  local vector oldVelocity = quake_GetOldVelocity(targetEntity);
  local vector velocity = tbx_GetVelocity(self);

  // not falling
  if (velocity_z > 0 || oldVelocity_z >= 0 || oldVelocity_z >= velocity_z)
    return;

  local float hitSpeed = velocity_z - oldVelocity_z;
  // we scale speed delta to range between 0.0 - 1.0
  local float hitForce = hitSpeed / QUAKE_MAXVELOCITY;

  // we scale force up exponentially toward max damage (Gib a Shambler)
  hitForce =
  (
    hitForce * hitForce * hitForce * hitForce * hitForce *
    QUAKE_MAXFALLDAMAGE 
  ) * (1 - tbx_GetSubmersion(targetEntity) / 10);

  quake_LoseHealth(targetEntity, hitForce);
};