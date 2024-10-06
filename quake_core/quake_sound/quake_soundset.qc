string(float soundset, float r) quake_Gulp =
{
  if (tbx_GetSubmersion(self) >= TBX_SUBMERSION_EYE)
  {
    if (
      soundset == QUAKE_SOUNDSET_PLAYER ||
      soundset == QUAKE_SOUNDSET_PLAYERALT
    )
    {
      if (r < 0.5)
        return QUAKE_SOUND_PLAYER_GULP1;
      
      return QUAKE_SOUND_PLAYER_GULP2;
    }
  }

  return "";
};

string(float soundset) quake_GetPainSound =
{
  local float r = tbx_GetRandomFloat();
  local string gulpSound;

  if (soundset == QUAKE_SOUNDSET_PLAYER)
  {
    gulpSound = quake_Gulp(QUAKE_SOUNDSET_PLAYER, r);

    if (gulpSound != "")
      return gulpSound;
    if (r < 0.17)
      return QUAKE_SOUND_PLAYER_PAIN1;
    if (r < 0.34)
      return QUAKE_SOUND_PLAYER_PAIN2;
    if (r < 0.5)
      return QUAKE_SOUND_PLAYER_PAIN3;
    if (r < 0.67)
      return QUAKE_SOUND_PLAYER_PAIN4;
    if (r < 0.84)
      return QUAKE_SOUND_PLAYER_PAIN5;
    
    return QUAKE_SOUND_PLAYER_PAIN6;
  }

  if (soundset == QUAKE_SOUNDSET_PLAYERALT)
  {
    gulpSound = quake_Gulp(QUAKE_SOUNDSET_PLAYERALT, r);

    if (gulpSound != "")
      return gulpSound;
    if (r < 0.5)
      return QUAKE_SOUND_PLAYER_SCREAM1;
    
    return QUAKE_SOUND_PLAYER_SCREAM2;
  }

  // defaulting to spark hit sound
  return TBX_SOUND_SPARKHIT;
};

string(float soundset) quake_GetDeathSound =
{
  local float r = tbx_GetRandomFloat();

  if (soundset == QUAKE_SOUNDSET_PLAYER)
  {
    if (tbx_GetSubmersion(self) >= TBX_SUBMERSION_EYE)
      return QUAKE_SOUND_PLAYER_DROWN;
    if (r < 0.2)
      return QUAKE_SOUND_PLAYER_DEATH1;
    if (r < 0.4)
      return QUAKE_SOUND_PLAYER_DEATH2;
    if (r < 0.6)
      return QUAKE_SOUND_PLAYER_DEATH3;
    if (r < 0.8)
      return QUAKE_SOUND_PLAYER_DEATH4;
    
    return QUAKE_SOUND_PLAYER_DEATH5;
  }

  // defaulting to spark hit sound
  return TBX_SOUND_DROPTHUD;
};