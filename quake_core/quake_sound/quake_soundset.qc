string(float soundset, float r) quake_Gulp =
{
  if (tbx_GetSubmersion(self) >= TBX_SUBMERSION_EYE)
  {
    if (
      soundset == QUAKE_SOUNDSET_PLAYERPAIN ||
      soundset == QUAKE_SOUNDSET_PLAYERBURN
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

  if (soundset == QUAKE_SOUNDSET_PLAYERPAIN)
  {
    gulpSound = quake_Gulp(QUAKE_SOUNDSET_PLAYERPAIN, r);

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

  if (soundset == QUAKE_SOUNDSET_PLAYERBURN)
  {
    gulpSound = quake_Gulp(QUAKE_SOUNDSET_PLAYERBURN, r);

    if (gulpSound != "")
      return gulpSound;
    if (r < 0.5)
      return QUAKE_SOUND_PLAYER_SCREAM1;
    
    return QUAKE_SOUND_PLAYER_SCREAM2;
  }

  // defaulting to spark hit sound
  return TBX_SOUND_SPARKHIT;
};