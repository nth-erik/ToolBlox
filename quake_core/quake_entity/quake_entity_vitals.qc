/*
==============================================================================

[Quake]: Entity vital signs config

==============================================================================
*/

/*
---------------
Lose health

Applies damage.
---------------
*/
void(entity targetEntity, float damage) quake_LoseHealth =
{
  // Pentagram prevents life loss, minor damage doesn't wound
  if (tbx_GetItemFlags(targetEntity) & TBX_ITEMFLAG_PENTAGRAM || damage < 1)
    return;

  tbx_PrintDebug("\nHealth damage: ");
  tbx_PrintDebug(tbx_GetFloatString(damage));
  tbx_PrintDebug("\n");

  local float health = tbx_GetHealth(targetEntity);
  tbx_AddHealth(targetEntity, -damage, health - damage, health);
  targetEntity.dmg_take = damage;
};

/*
------------------------------------------
Hit armor

Applies protection-capped damage to armor.

Returns unprotected health damage.
------------------------------------------
*/
float(entity targetEntity, float damage) quake_HitArmor =
{
  local float armor = tbx_GetArmor(targetEntity);
  float armorDamage = tbx_GetCeiling(
    tbx_GetMinimum(
      tbx_GetArmorProtection(targetEntity) * damage,
      armor
    )
  );
  float healthDamage = damage - armorDamage;

  tbx_PrintDebug("\nArmor damage: ");
  tbx_PrintDebug(tbx_GetFloatString(armorDamage));
  tbx_PrintDebug(", remainder: ");
  tbx_PrintDebug(tbx_GetFloatString(healthDamage));
  tbx_PrintDebug("\n");

  tbx_AddArmor(targetEntity, -armorDamage, 0, armor);
  
  if (healthDamage <= 0)
    tbx_PrintClientCommand(targetEntity, "bf\n");

  return healthDamage;
};

/*
------------------------------------------------------
Melt armor

Applies full damage to armor.
Use this for environment damage enveloping the player.

Returns unprotected health damage.
------------------------------------------------------
*/
float(entity targetEntity, float damage) quake_MeltArmor =
{
  local float armor = tbx_GetArmor(targetEntity);
  float preventedDamage = tbx_GetCeiling(
    tbx_GetMinimum(
      tbx_GetArmorProtection(targetEntity) * damage,
      armor
    )
  );
  float healthDamage = damage - preventedDamage;

  tbx_PrintDebug("\nArmor damage: ");
  tbx_PrintDebug(tbx_GetFloatString(damage));
  tbx_PrintDebug(", health damage: ");
  tbx_PrintDebug(tbx_GetFloatString(healthDamage));
  tbx_PrintDebug("\n");

  tbx_AddArmor(targetEntity, -damage, 0, armor);

  if (healthDamage < 1)
    tbx_PrintClientCommand(targetEntity, "bf\n");

  return healthDamage;
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
  // we scale force down when underwater
  hitForce =
  (
    hitForce * hitForce * hitForce * hitForce * hitForce *
    QUAKE_MAXFALLDAMAGE 
  ) * (1 - tbx_GetSubmersion(targetEntity) * 0.1);

  quake_LoseHealth(targetEntity, hitForce);

  // thud volume determined by impact force
  tbx_PlaySound
  (
    self,
    TBX_SOUND_CHANNEL_BODY,
    TBX_SOUND_DROPTHUD,
    tbx_GetMinimum(hitForce * 0.5, 1),
    TBX_SOUND_FALLOFF_NORMAL
  );

  // play voice based on impact
  if (hitForce < 0.4)
    return;

  if (hitForce < 1)
  {
    tbx_PlaySound
  (
    self,
    TBX_SOUND_CHANNEL_VOICE,
    QUAKE_SOUND_PLAYER_UGH,
    1,
    TBX_SOUND_FALLOFF_NORMAL
  );
    return;
  }

  if (hitForce < 5)
  {
    tbx_PlaySound
  (
    self,
    TBX_SOUND_CHANNEL_VOICE,
    quake_GetPainSound(QUAKE_SOUNDSET_PLAYERPAIN),
    1,
    TBX_SOUND_FALLOFF_NORMAL
  );
    return;
  }

  tbx_PlaySound
  (
    self,
    TBX_SOUND_CHANNEL_VOICE,
    QUAKE_SOUND_PLAYER_FRACTURE,
    1,
    TBX_SOUND_FALLOFF_NORMAL
  );
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
      damageSum = damageSum + QUAKE_SOAKDAMAGE_KNEE;

    if (soakTypes_y == TBX_POINTCONTENT_LAVA)
      damageSum = damageSum + QUAKE_SOAKDAMAGE_WAIST;

    if (soakTypes_z == TBX_POINTCONTENT_LAVA)
      damageSum = damageSum + QUAKE_SOAKDAMAGE_EYE;
  }
      
  if (quake_GetSecond())
  {
    // burn from slime
    if (soakTypes_x == TBX_POINTCONTENT_SLIME)
      damageSum = damageSum + QUAKE_SOAKDAMAGE_KNEE;

    if (soakTypes_y == TBX_POINTCONTENT_SLIME)
      damageSum = damageSum + QUAKE_SOAKDAMAGE_WAIST;

    if (soakTypes_z == TBX_POINTCONTENT_SLIME)
      damageSum = damageSum + QUAKE_SOAKDAMAGE_EYE;
  }

  if (quake_Get3Seconds())
  {
    // dry off
    soakTypes_x = soakTypes_y;
    soakTypes_y = soakTypes_z;
    soakTypes_z = TBX_POINTCONTENT_EMPTY;
    quake_SetSoakTypes(targetEntity, soakTypes);
  }

  if (damageSum)
  {
    local float healthLoss = quake_MeltArmor(targetEntity, damageSum);

    tbx_PlaySound
    (
      self,
      TBX_SOUND_CHANNEL_BODY,
      QUAKE_SOUND_PLAYER_SLIMEBURN,
      damageSum / QUAKE_SOAKDAMAGE_MAX,
      TBX_SOUND_FALLOFF_NORMAL
    );

    if (healthLoss >= 1)
    {
      quake_LoseHealth(
        targetEntity,
        healthLoss
      );

      if (tbx_GetHealth(self) <= 0)
      {
        tbx_SetVitals(self, TBX_VITALS_DYING);
        // add death sound here
        return;
      }

      tbx_PlaySound
      (
        self,
        TBX_SOUND_CHANNEL_VOICE,
        quake_GetPainSound(QUAKE_SOUNDSET_PLAYERBURN),
        1,
        TBX_SOUND_FALLOFF_NORMAL
      );
    }
  }
};

/*
---------------------------------------------
Handle Soak

Manages after-effects of exposure to liquids.
---------------------------------------------
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