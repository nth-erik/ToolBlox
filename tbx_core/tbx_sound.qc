/*
==============================================================================

ToolBlox sound functions

Functions responsible for managing sounds.

==============================================================================
*/



/*
===========================
Engine API functions

Please do not change these.
===========================
*/

/*
-----------------------------------------------------------------------
Play sound

Emits a sound from an entity.

sourceEntity: Entity to emit from (defaults to self)
channel:      Sound channel to use
  float TBX_SOUND_CHANNEL_AUTO = 0;   // Automatic (default)
  float TBX_SOUND_CHANNEL_WEAPON = 1; // Weapon sound
  float TBX_SOUND_CHANNEL_VOICE = 2;  // Character voice
  float TBX_SOUND_CHANNEL_ITEM = 3;   // Powerup signal
  float TBX_SOUND_CHANNEL_BODY = 4;   // Foliage noise
  5: (misc.)
  6: (misc.)
  7: (misc.)
soundPath:    Path to sound file
volume:       Volume on a 0.0-1.0 scale (defaults to 1.0)
falloff:      Attenuation level, rate of sound decay
  float TBX_SOUND_FALLOFF_NONE = 0;   // no falloff, heard everywhere
  float TBX_SOUND_FALLOFF_NORMAL = 1; // normal, loud falloff (default)
  float TBX_SOUND_FALLOFF_IDLE = 2;   // idle, near falloff
  float TBX_SOUND_FALLOFF_STATIC = 3; // ambient sound falloff
  1.0: ~1000 unit radius
  3.9: ~250 unit radius

NOTE: Sounds beyond hearing range stop playing to preserve memory.
      Sounds without falloff are still directional.
-----------------------------------------------------------------------
*/
void(
  entity sourceEntity,
  float channel,
  string soundPath,
  float volume,
  float falloff
) tbx_PlaySound = #8;

/*
--------------------------------------------
Load sound

Preloads shareware sound for use in the map.
Sounds must be loaded in a constructor.

soundPath: sound path to use
--------------------------------------------
*/
string(string soundPath) tbx_LoadSound = #19;

/*
-------------------------------------------------------------------------
Play ambient sound

Emits looping ambient sound.
An ambient sound will never stop playing, even if the player moves out of
audible range.

soundOrigin: Origin point of sound emission
soundPath:   Path to sound file
volume:      Volume on a 0.0-1.0 scale (defaults to 1.0)
falloff:     Attenuation level, rate of sound decay
  float TBX_SOUND_FALLOFF_NONE = 0;   // no falloff, heard everywhere
  float TBX_SOUND_FALLOFF_NORMAL = 1; // normal, loud falloff (default)
  float TBX_SOUND_FALLOFF_IDLE = 2;   // idle, near falloff
  float TBX_SOUND_FALLOFF_STATIC = 3; // ambient sound falloff
  1.0: ~1000 unit radius
  3.9: ~250 unit radius
-------------------------------------------------------------------------
*/
void(
  entity sourceEntity,
  string soundPath,
  float volume,
  float falloff
) tbx_PlayAmbientSound = {
  _74(sourceEntity.origin, soundPath, volume, falloff);
};

/*
---------------------------------------------
Load registered sound

Preloads registered sound for use in the map.
Sounds must be loaded in a constructor.

soundPath: sound path to use
---------------------------------------------
*/
string(string soundPath) tbx_LoadRegisteredSound = #76;



/*
=========================================
Critical assets

Not loading these assets crashes the map.

Please do not change these.
=========================================
*/

/*
------------------------------------------------------------------------------
Load hard-coded sounds

Loads sounds directly referenced by the engine.
These must be loaded from the script, or the map will crash:
  string TBX_SOUND_DROPTHUD = "demon/dland2.wav";      // body drops on solid
  string TBX_SOUND_DROPSPLASH = "misc/h2ohit1.wav";    // body drops in liquid
  string TBX_SOUND_NAILHIT = "weapons/tink1.wav";      // nail hits solid
  string TBX_SOUND_NAILRICOCHET1 = "weapons/ric1.wav"; // nail ricochet 1
  string TBX_SOUND_NAILRICOCHET2 = "weapons/ric2.wav"; // nail ricochet 2
  string TBX_SOUND_NAILRICOCHET3 = "weapons/ric3.wav"; // nail ricochet 3
  string TBX_SOUND_SPITHIT = "wizard/hit.wav";         // spit hits solid
  string TBX_SOUND_SPARKHIT = "hknight/hit.wav";       // flamespark hit solid

NOTE: Replace these sound files with copies of 'misc/null.wav' for greater
      control over what and when gets emitted by entities and effects.
------------------------------------------------------------------------------
*/
void() tbx_LoadHardCodedSounds =
{
  tbx_LoadSound(TBX_SOUND_DROPTHUD);
  tbx_LoadSound(TBX_SOUND_DROPSPLASH);
  tbx_LoadSound(TBX_SOUND_NAILHIT);
  tbx_LoadSound(TBX_SOUND_NAILRICOCHET1);
  tbx_LoadSound(TBX_SOUND_NAILRICOCHET2);
  tbx_LoadSound(TBX_SOUND_NAILRICOCHET3);
  tbx_LoadSound(TBX_SOUND_SPITHIT);
  tbx_LoadSound(TBX_SOUND_SPARKHIT);
};