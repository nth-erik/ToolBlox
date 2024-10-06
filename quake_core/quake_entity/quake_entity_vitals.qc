/*
==============================================================================

[Quake]: Entity vital signs config

==============================================================================
*/

/*
--------------------------------------------------
Check if alive

Checks if the entity is dying or should die.
Triggers death sound and sequence.

targetEntity: entity to check and manage death for

Returns FALSE if entity is dead or dying.
Returns TRUE if entity is alive.
--------------------------------------------------
*/
float(entity sourceEntity) quake_CheckAlive =
{
  // dying or dead, don't scream
  if (tbx_GetVitals(self) != TBX_VITALS_ALIVE)
    return FALSE;

  // entity got killed, trigger dying
  if (tbx_GetHealth(self) <= 0)
  {
    tbx_SetVitals(self, TBX_VITALS_DYING);
    tbx_PlaySound
    (
      self,
      TBX_SOUND_CHANNEL_VOICE,
      quake_GetDeathSound(QUAKE_SOUNDSET_PLAYER),
      1,
      TBX_SOUND_FALLOFF_NORMAL
    );

    return FALSE;
  }

  // player is alive
  return TRUE;
};

/*
-----------------------------------------------
Get air supply

Returns the current entity air supply.

sourceEntity: the entity to read the value from
-----------------------------------------------
*/
float(entity sourceEntity) quake_GetAirSupply =
{
  return sourceEntity.quake_supply;
};

/*
---------------------------------------------------
Set air supply

Updates the current entity air supply.
Value is clamped between given minimum and maximum.

targetEntity:  the entity to change the value for
newAirSupply:     air supply to set
minimumAirSupply: low cap
maximumAirSupply: high cap
---------------------------------------------------
*/
void(
  entity targetEntity,
  float newAirSupply,
  float minimumAirSupply,
  float maximumAirSupply
) quake_SetAirSupply =
{
  if (newAirSupply < minimumAirSupply)
    newAirSupply = minimumAirSupply;

  if (newAirSupply > maximumAirSupply)
    newAirSupply = maximumAirSupply;

  tbx_PrintDebug("\nSet air supply: ");
  tbx_PrintDebug(tbx_GetFloatString(newAirSupply));
  tbx_PrintDebug("\n");

  targetEntity.quake_supply = newAirSupply;
};

/*
------------------------------------------------------
Add air supply

Adjusts the current entity air supply by passed value.
Value is clamped between given minimum and maximum.

Uses // .float supply // internally.

targetEntity:     the entity to change the value for
addAirSupply:     air supply to add (can be negative)
minimumAirSupply: low cap
maximumAirSupply: high cap
------------------------------------------------------
*/
void(
  entity targetEntity,
  float addAirSupply,
  float minimumAirSupply,
  float maximumAirSupply
) quake_AddAirSupply =
{
  float newAirSupply = targetEntity.quake_supply + addAirSupply;

  if (newAirSupply < minimumAirSupply)
    newAirSupply = minimumAirSupply;

  if (newAirSupply > maximumAirSupply)
    newAirSupply = maximumAirSupply;

  tbx_PrintDebug("\nAir supply: ");
  tbx_PrintDebug(tbx_GetFloatString(newAirSupply));
  tbx_PrintDebug("\n");

  targetEntity.quake_supply = newAirSupply;
};

/*
------------------------------
Lose health

Applies damage to health.

targetEntity: entity to damage
damage:       damage to apply
------------------------------
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

targetEntity: entity to damage
damage:       damage to apply

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

targetEntity: entity to damage
damage:       damage to apply

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
    quake_GetPainSound(QUAKE_SOUNDSET_PLAYER),
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
------------------------------------
Handle Drown Effect

Applies effects based on air supply.
------------------------------------
*/
void(entity targetEntity) quake_HandleDrownEffect =
{
  if (!quake_CheckAlive(targetEntity))
    return;

  local float airSupply = quake_GetAirSupply(targetEntity);
  local float isSubmerged =
  (
    tbx_GetSubmersion(targetEntity) > TBX_SUBMERSION_WAIST
  );

  if (isSubmerged)
  {
    if (quake_GetSecond())
    {
      // must_hold_breath
      quake_AddAirSupply(targetEntity, -1, QUAKE_PLAYER_MINAIRSUPPLY, airSupply);
      airSupply = quake_GetAirSupply(targetEntity);
      
      if (airSupply < 0)
      {
        tbx_PlaySound
        (
          self,
          TBX_SOUND_CHANNEL_VOICE,
          quake_GetPainSound(QUAKE_SOUNDSET_PLAYER),
          1,
          TBX_SOUND_FALLOFF_NORMAL
        );
        quake_LoseHealth(targetEntity, tbx_GetCeiling(-airSupply * 0.3));
      }

    }
    return; // do not surface
  }

  // only on tick
  if (!quake_GetTick())
    return;

  // breathing air
  if (airSupply < QUAKE_PLAYER_MAXAIRSUPPLY * 0.5)
  {
    if (airSupply < 0)
    {
      tbx_PlaySound
      (
        self,
        TBX_SOUND_CHANNEL_VOICE,
        QUAKE_SOUND_PLAYER_COUGH,
        1,
        TBX_SOUND_FALLOFF_NORMAL
      );
    }
    else
    {
      tbx_PlaySound
      (
        self,
        TBX_SOUND_CHANNEL_VOICE,
        QUAKE_SOUND_PLAYER_GASP,
        1,
        TBX_SOUND_FALLOFF_NORMAL
      );
    }
  }

  quake_AddAirSupply(targetEntity, 1, QUAKE_PLAYER_MAXAIRSUPPLY * 0.5, QUAKE_PLAYER_MAXAIRSUPPLY);
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

      if (!quake_CheckAlive(targetEntity))
        return;

      tbx_PlaySound
      (
        self,
        TBX_SOUND_CHANNEL_VOICE,
        quake_GetPainSound(QUAKE_SOUNDSET_PLAYERALT),
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

  quake_HandleDrownEffect(targetEntity);
  quake_HandleSoakEffect(targetEntity);
};