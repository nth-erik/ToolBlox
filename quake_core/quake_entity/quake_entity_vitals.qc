/*
==============================================================================

[Quake]: Entity vital signs config

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
-----------------------------------------------------
Handle fall

Applies fall damage after stopping vertical movement.

targetEntity: Entity to fall-check
-----------------------------------------------------
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

  // we scale force up exponentially toward max damage (gib a Shambler)
  hitForce =
  (
    hitForce * hitForce * hitForce * hitForce * hitForce *
    QUAKE_MAXFALLDAMAGE 
  ) * (1 - tbx_GetSubmersion(targetEntity) / 10);

  quake_LoseHealth(targetEntity, hitForce);
};

/*
---------------------------------------------
Handle Soak Effect

Applies effects based on soak state.
---------------------------------------------
*/
void(entity targetEntity) quake_HandleSoakEffect =
{
  local vector soakTypes = quake_GetSoakTypes(targetEntity);
  local float damageSum = 0;
  
  // frequent
  if (quake_GetTick())
  {
    // burn from lava
    if (soakTypes_x == TBX_POINTCONTENT_LAVA)
      damageSum = damageSum + 1;

    if (soakTypes_y == TBX_POINTCONTENT_LAVA)
      damageSum = damageSum + 1.7;

    if (soakTypes_z == TBX_POINTCONTENT_LAVA)
      damageSum = damageSum + 2.3;
  }
      
  if (quake_GetSecond())
  {
    // burn from slime
    if (soakTypes_x == TBX_POINTCONTENT_SLIME)
      damageSum = damageSum + 1;

    if (soakTypes_y == TBX_POINTCONTENT_SLIME)
      damageSum = damageSum + 1.7;

    if (soakTypes_z == TBX_POINTCONTENT_SLIME)
      damageSum = damageSum + 2.3;

    // dry off
    soakTypes_x = soakTypes_y;
    soakTypes_y = soakTypes_z;
    soakTypes_z = TBX_POINTCONTENT_EMPTY;
    quake_SetSoakTypes(targetEntity, soakTypes);
  }

  quake_LoseHealth(targetEntity, damageSum);
};

/*
--------------------------------------------
Handle Soak

Manages aftereffects of exposure to liquids.
--------------------------------------------
*/
void(entity targetEntity) quake_HandleSoak =
{
  local float environment = tbx_GetEnvironmentType(targetEntity);

  // in liquid
  if
  (
    environment <= TBX_POINTCONTENT_WATER &&
    environment >= TBX_POINTCONTENT_LAVA
  )
  {
    local float submersion = tbx_GetSubmersion(targetEntity);
    local vector newSoakTypes;

    if(submersion > TBX_SUBMERSION_DRY)
      newSoakTypes_x = environment;

    if(submersion > TBX_SUBMERSION_KNEE)
      newSoakTypes_y = environment;

    if(submersion > TBX_SUBMERSION_WAIST)
      newSoakTypes_z = environment;
    
    quake_SetSoakTypes(targetEntity, newSoakTypes);
  }

  quake_HandleSoakEffect(targetEntity);
};