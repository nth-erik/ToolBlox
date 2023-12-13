/*
==============================================================================

ToolBlox constants

Pre-emptive constant value definitions for global referencing.

Please do not change these.

==============================================================================
*/



/*
=============
ToolBlox Core
=============
*/

/*
----------------
tbx_callbacks.qc
----------------
*/

/*
-----------
tbx_core.qc
-----------
*/
// Episode flags
float EPISODEFLAG_DOOMED = 1; // Dimension of the Doomed
float EPISODEFLAG_BLACK = 2;  // The Realm of Black Magic
float EPISODEFLAG_NETHER = 4; // The Netherworld
float EPISODEFLAG_ELDER = 8;  // The Elder World
float EPISODEFLAG_ALL = 15;   // All episodes

/*
------------
tbx_debug.qc
------------
*/

/*
-------------
tbx_effect.qc
-------------
*/

/*
-------------
tbx_entity.qc
-------------
*/
// Bounding box corners
vector TBX_SMALL_BOUNDS_MIN = '-16 -16 -24'; // human left-rear-bottom
vector TBX_SMALL_BOUNDS_MAX = '16 16 32';    // human right-front-top
// Move types
                                // +---------+---------+--------+--------+
                                // | gravity | collide | contol | player |
                                // +---------+---------+--------+--------+
float TBX_MOVETYPE_NONE = 0;    // | no      | no      | never  | yes    |
float TBX_MOVETYPE_MOVE = 3;    // | drop    | all     | always | yes    |
float TBX_MOVETYPE_FRAME = 4;   // | drop    | no      | never  | no     |
float TBX_MOVETYPE_HOVER = 5;   // | no      | all     | always | yes    |
float TBX_MOVETYPE_DROP = 6;    // | drop    | all     | in air | yes    |
float TBX_MOVETYPE_WALL = 7;    // | no      | entity  | never  | no     |
float TBX_MOVETYPE_NOCLIP = 8;  // | no      | no      | always | yes    |
float TBX_MOVETYPE_SHOT = 9;    // | no      | all     | never  | no     |
float TBX_MOVETYPE_BOUNCE = 10; // | bounce  | all     | in air | yes    |
                                // +---------+---------+--------+--------+
// Solid types
                                  // +-------+---------+-------+
                                  // | shape | collide | touch |
                                  // +-------+---------+-------+
float TBX_SOLIDTYPE_NOT = 0;      // | box   | none    | no    |
float TBX_SOLIDTYPE_TRIGGER = 1;  // | box   | none    | yes   |
float TBX_SOLIDTYPE_BOX = 2;      // | box   | ground  | yes   |
float TBX_SOLIDTYPE_SLIDEBOX = 3; // | box   | slide   | yes   |
float TBX_SOLIDTYPE_BSP = 4;      // | BSP   | ground  | yes   |
                                  // +-------+---------+-------+
// Effect flags
float TBX_EFFECTFLAG_FIELD = 1;       // yellow particle field
float TBX_EFFECTFLAG_DIMFLASH = 2;    // dim flash (resets)
float TBX_EFFECTFLAG_BRIGHTLIGHT = 4; // bright light (Quad)
float TBX_EFFECTFLAG_DIMLIGHT = 8;    // dim light (laser)
// Frame tick
float TBX_FRAMETICK = 0.1;
// Weapon flag
float TBX_WEAPONFLAG_SHOTGUN = 1;
float TBX_WEAPONFLAG_DBSHOTGUN = 2;
float TBX_WEAPONFLAG_NAILGUN = 4;
float TBX_WEAPONFLAG_PERFORATOR = 8;
float TBX_WEAPONFLAG_GRENADELAUNCHER = 16;
float TBX_WEAPONFLAG_ROCKETLAUNCHER = 32;
float TBX_WEAPONFLAG_THUNDERBOLT = 64;
float TBX_WEAPONFLAG_AXE = 4096;
// Item flags
float TBX_ITEMFLAG_SHOTGUN = 1;          // Shotgun weapon
float TBX_ITEMFLAG_DBSHOTGUN = 2;        // Double-barraled shotgun
float TBX_ITEMFLAG_NAILGUN = 4;          // Nailgun weapon
float TBX_ITEMFLAG_PERFORATOR = 8;       // Perforator weapon
float TBX_ITEMFLAG_GRENADELAUNCHER = 16; // Grenade launcher weapon
float TBX_ITEMFLAG_ROCKETLAUNCHER = 32;  // Rocket launcher weapon
float TBX_ITEMFLAG_THUNDERBOLT = 64;     // Thunderbolt weapon
float TBX_ITEMFLAG_SHELLS = 256;         // Shell ammo
float TBX_ITEMFLAG_NAILS = 512;          // Nail ammo
float TBX_ITEMFLAG_ROCKETS = 1024;       // Rocket ammo
float TBX_ITEMFLAG_CELLS = 2048;         // Cell ammo
float TBX_ITEMFLAG_AXE = 4096;           // Axe weapon
float TBX_ITEMFLAG_ARMOR1_LIGHT = 8192;  // Light (teal) armor
float TBX_ITEMFLAG_ARMOR2_HEAVY = 16384; // Heavy (yellow) armor
float TBX_ITEMFLAG_ARMOR_FULL = 32768;   // Full (red) armor
float TBX_ITEMFLAG_MEGAHEALTH = 65536;   // Megahealth
float TBX_ITEMFLAG_KEY1 = 131072;        // Silver key item
float TBX_ITEMFLAG_KEY2 = 262144;        // Gold key item
float TBX_ITEMFLAG_RING = 524288;        // Ring of Shadows
float TBX_ITEMFLAG_PENTAGRAM = 1048576;  // Pentagram of Protection
float TBX_ITEMFLAG_BIOSUIT = 2097152;    // Biosuit
float TBX_ITEMFLAG_QUAD = 4194304;       // Quad Damage
// Vulnerability
float TBX_VULNERABILITY_OFF = 0; // Does not take damage
float TBX_VULNERABILITY_HIT = 1; // Projectile and blast damage
float TBX_VULNERABILITY_ALL = 2; // Projectile, blast and grenade damage
// Vitals
float TBX_VITALS_ALIVE = 0; // Functioning
float TBX_VITALS_DYING = 1; // Dropping dead
float TBX_VITALS_DEAD = 2;  // Static corpse
float TBX_VITALS_OUT = 3;   // Ready for respawn
// Movement flags
float TBX_FLAG_MOVE_FLY = 1;
float TBX_FLAG_MOVE_SWIM = 2;
float TBX_FLAG_MOVE_ALL = 3;
// Role flags
float TBX_FLAG_ROLE_PLAYER = 8;
float TBX_FLAG_ROLE_NPC = 32;
float TBX_FLAG_ROLE_ALL = 40;
// Position flags
float TBX_FLAG_POSITION_WATER = 16;
float TBX_FLAG_POSITION_GROUND = 512;
float TBX_FLAG_POSITION_EDGE = 1024;
float TBX_FLAG_POSITION_ANYGROUND = 1536;
float TBX_FLAG_POSITION_ALL = 1552;
// Cheat flags
float TBX_FLAG_CHEAT_GOD = 64;
float TBX_FLAG_CHEAT_NOTARGET = 128;
float TBX_FLAG_CHEAT_ALL = 192;
// Item flags
float TBX_FLAG_ITEM_WIDE = 256;
// Action flags
float TBX_FLAG_ACTION_WATEREXIT = 2048;    // Jumping from water at ledge
float TBX_FLAG_ACTION_JUMPRELEASED = 4096; // Jump button released
float TBX_FLAG_ACTION_ALL = 6144;          // Vaulting ledge without jumping
// Color index
float TBX_COLORINDEX_WHITE = 0;   // Grayscale
float TBX_COLORINDEX_BROWN = 1;   // Khaki tones
float TBX_COLORINDEX_SILVER = 2;  // Light blue, silver key
float TBX_COLORINDEX_GREEN = 3;   // Military green
float TBX_COLORINDEX_RED = 4;     // Blood red
float TBX_COLORINDEX_OCKER = 5;   // Egyptian snot yellow
float TBX_COLORINDEX_GOLD = 6;    // Fiery yellow, gold key
float TBX_COLORINDEX_TAN = 7;     // Skin tones
float TBX_COLORINDEX_PURPLE = 8;  // Pastel pink
float TBX_COLORINDEX_PINK = 9;    // Saturated pink
float TBX_COLORINDEX_BONE = 10;   // Off-white, pale skin tone
float TBX_COLORINDEX_TEAL = 11;   // Greenish-blue
float TBX_COLORINDEX_YELLOW = 12; // Pure yellow
float TBX_COLORINDEX_BLUE = 13;   // Royal blue
// Armor type
float TBX_ARMORTYPE_NONE = 0;
float TBX_ARMORTYPE_LIGHT = 0.3;
float TBX_ARMORTYPE_STANDARD = 0.6;
float TBX_ARMORTYPE_HEAVY = 0.8;
// Submersion
float TBX_SUBMERSION_DRY = 0;
float TBX_SUBMERSION_KNEE = 1;
float TBX_SUBMERSION_WAIST = 2;
float TBX_SUBMERSION_EYE = 3;

/*
------------
tbx_flags.qc
------------
*/

/*
------------
tbx_light.qc
------------
*/
// Light levels
  float TBX_LIGHTLEVEL_A = 0.00; // "a"
  float TBX_LIGHTLEVEL_B = 0.04; // "b"
  float TBX_LIGHTLEVEL_C = 0.08; // "c"
  float TBX_LIGHTLEVEL_D = 0.12; // "d"
  float TBX_LIGHTLEVEL_E = 0.16; // "e"
  float TBX_LIGHTLEVEL_F = 0.20; // "f"
  float TBX_LIGHTLEVEL_G = 0.24; // "g"
  float TBX_LIGHTLEVEL_H = 0.28; // "h"
  float TBX_LIGHTLEVEL_I = 0.32; // "i"
  float TBX_LIGHTLEVEL_J = 0.36; // "j"
  float TBX_LIGHTLEVEL_K = 0.40; // "k"
  float TBX_LIGHTLEVEL_L = 0.44; // "l"
  float TBX_LIGHTLEVEL_M = 0.48; // "m"
  float TBX_LIGHTLEVEL_N = 0.52; // "n"
  float TBX_LIGHTLEVEL_O = 0.56; // "o"
  float TBX_LIGHTLEVEL_P = 0.60; // "p"
  float TBX_LIGHTLEVEL_Q = 0.64; // "q"
  float TBX_LIGHTLEVEL_R = 0.68; // "r"
  float TBX_LIGHTLEVEL_S = 0.72; // "s"
  float TBX_LIGHTLEVEL_T = 0.76; // "t"
  float TBX_LIGHTLEVEL_U = 0.80; // "u"
  float TBX_LIGHTLEVEL_V = 0.84; // "v"
  float TBX_LIGHTLEVEL_W = 0.88; // "w"
  float TBX_LIGHTLEVEL_X = 0.92; // "x"
  float TBX_LIGHTLEVEL_Y = 0.96; // "y"
  float TBX_LIGHTLEVEL_Z = 1.00; // "z"

/*
------------
tbx_logic.qc
------------
*/
// Chance values
float FALSE = 0;
float UNLIKELY = 0.25;
float POSSIBLE = 0.5;
float LIKELY = 0.75;
float TRUE = 1;

/*
-----------
tbx_math.qc
-----------
*/

/*
-----------
tbx_meta.qc
-----------
*/
// ToolBlox:
  string TBX_AUTHORS_TOOLBLOX = "\bToolBlox\b authors";
  string TBX_CREDITS_THESOLIPSIST = "The Solipsist";
// progs_dump:
  string TBX_AUTHORS_PD = "\bprogs_dump\b authors";
  string TBX_CREDITS_DUMPTRUCKDS = "dumptruck_ds ";
  string TBX_CREDITS_IW = "Ian Walshaw ";
  string TBX_CREDITS_QMASTER = "Qmaster ";
  string TBX_CREDITS_C0BURN = "c0burn ";
  string TBX_CREDITS_RENNYC = "RennyC ";
  string TBX_CREDITS_SPIKE = "Spike ";
  string TBX_CREDITS_SHANJAQ = "ShanJaq ";
  string TBX_CREDITS_SHAMBLERNAUT = "Shamblernaut ";
  string TBX_CREDITS_QUEENJAZZ = "QueenJazz ";
  string TBX_CREDITS_BDW = "BDW ";
  string TBX_CREDITS_KHREATOR = "Khreator ";
  string TBX_CREDITS_ZUNGRY = "ZungryWare ";
  string TBX_CREDITS_YDROL = "ydrol ";
  string TBX_CREDITS_VOIDFORCE = "Voidforce ";
  string TBX_CREDITS_NULLPOINTPALADIN = "NullPointPaladin ";
// URQP:
  string TBX_AUTHORS_URQP = "\bUniversal Regular Quake Patch\b authors";
  string TBX_CREDITS_MADDES = "Maddes";
  string TBX_CREDITS_ATHOS = "Athos";
  string TBX_CREDITS_KRYTEN = "Kryten";
// Rubicon:
  string TBX_AUTHORS_RUBICON = "\bRubicon\b authors";
  string TBX_CREDITS_JOHNFITZ = "John Fitzgibbons";
  string TBX_CREDITS_ACE_DAVE = "Ace_Dave";
// Quoth:
  string TBX_AUTHORS_QUOTH = "\bQuoth\b authors";
  string TBX_CREDITS_KELL = "Kell";
  string TBX_CREDITS_NECROS = "Necros";
// ReMake Quake:
  string TBX_AUTHORS_RMQ = "\bReMakeQuake\b authors";
  string TBX_CREDITS_SUPA = "Supa";
  string TBX_CREDITS_GB = "gb";
  string TBX_CREDITS_IJED = "ijed";
// Rogue:
  string TBX_AUTHORS_ROGUE = "\bRogue Entertainment\b authors";
  string TBX_CREDITS_PMACK = "Peter Mack";
// Hipnotic:
  string TBX_AUTHORS_HIPNOTIC = "\bHipnotic Software\b authors";
  string TBX_CREDITS_JIMDOSE = "Jim Dosé";
  string TBX_CREDITS_DHM = "Drake";
// id:
  string TBX_AUTHORS_ID = "\bid Software\b authors";
  string TBX_CREDITS_JOHNCARMACK = "John Carmack";
  string TBX_CREDITS_JOHNCASH = "John Cash";
  string TBX_CREDITS_MICHAELABRASH = "Michael Abrash";
// Others:
  string TBX_AUTHORS_OTHER = "\bid Software\b authors";
  string TBX_CREDITS_QUAKEWIKI = "\bQuakeWiki\b (various authors)";
  string TBX_CREDITS_INSIDEQC = "\bInsideQC\b (various authors)";
  string TBX_CREDITS_DARKGRUE = "DarkGrue (QuakeC Reference Manual)";
  string TBX_CREDITS_PREACH = "Preach (Tome of Preach)";
  string TBX_CREDITS_JOSHUASKELTON = "Joshua Skelton (Quake Tools)";
  string TBX_CREDITS_JLEWW = "jleww (ChangeMusic.rar)";
  string TBX_CREDITS_ZOID = "Zoid (CTF)";
  string TBX_CREDITS_LUNARAN = "Lunaran (Copper)";
  string TBX_CREDITS_ZERSTRORER = "Nihilism Unlimited (Zerstrorer)";
  string TBX_CREDITS_KINN = "Kinn (Marcher Fortress)";
  string TBX_CREDITS_TONYCOLLEN = "Tony Collen (DeadStuff)";

/*
------------
tbx_model.qc
------------
*/
// Hard-coded models
string TBX_MODEL_PLAYER = "progs/player.mdl";

/*
--------------
tbx_network.qc
--------------
*/
// networkChannel: reliability channel
float TBX_NETWORKCHANNEL_BROADCAST = 0; // unreliable reception
float TBX_NETWORKCHANNEL_PLAYER = 1;    // reliable client reception
float TBX_NETWORKCHANNEL_SYNC = 2;      // reliable synchronized reception
float TBX_NETWORKCHANNEL_INIT = 3;      // initialization string reception

// messageByte: byte to send, init message with below enums
float TBX_MESSAGEBYTE_UPDATE_STAT = 3;         // update game stat
float TBX_MESSAGEBYTE_CAM_VIEWPORT = 5;        // (unused) set camera viewport
float TBX_MESSAGEBYTE_CAM_ANGLES = 10;         // (unused) set camera angles
float TBX_MESSAGEBYTE_TEMP_ENTITY = 23;        // start of temporary entity
float TBX_MESSAGEBYTE_MONSTER_KILLED = 27;     // +1 monster killed
float TBX_MESSAGEBYTE_SECRET_FOUND = 28;       // +1 secret found
float TBX_MESSAGEBYTE_INTERMISSION_START = 30; // show intermission
float TBX_MESSAGEBYTE_EPILOGUE_START = 31;     // show episode end paragraph
float TBX_MESSAGEBYTE_CHANGE_MUSIC = 32;       // change CD track
float TBX_MESSAGEBYTE_SELL_SCREEN = 33;        // enter shill mode
float TBX_MESSAGEBYTE_CUTSCENE_START = 34;     // (unused) start cutscene
float TBX_MESSAGEBYTE_UPDATE_ENTITY = 128;     // (unused) updates entity

/*
------------
tbx_noise.qc
------------
*/

/*
-------------
tbx_player.qc
-------------
*/
float STOREDVALUE_ITEMFLAGS = 1;
float STOREDVALUE_HEALTH = 2;
float STOREDVALUE_ARMORHEALTH = 3;
float STOREDVALUE_SHELLS = 4;
float STOREDVALUE_NAILS = 5;
float STOREDVALUE_ROCKETS = 6;
float STOREDVALUE_CELLS = 7;
float STOREDVALUE_WEAPONFLAGS = 8;
float STOREDVALUE_ARMORTYPE = 9;   // armor type times 100

/*
------------
tbx_print.qc
------------
*/

/*
---------------
tbx_raytrace.qc
---------------
*/
// Monster check
float TBX_MONSTERCHECK_HIT = 0;      // hit monsters (default)
float TBX_MONSTERCHECK_SKIP = 1;     // skip monsters
float TBX_MONSTERCHECK_HIT_WIDE = 2; // hit monsters more easily
// Trace solid flags
float TBX_TRACEFLAG_SOLID_ALL = 1;
float TBX_TRACEFLAG_SOLID_START = 2;
float TBX_TRACEFLAG_SOLID_END = 4;   // (experimental)
// Trace pass flags
float TBX_TRACEFLAG_PASS_AIR = 1;
float TBX_TRACEFLAG_PASS_LIQUID = 2;
float TBX_TRACEFLAG_PASS_MIXED = 3;  // (shorthand for checks)

/*
------------
tbx_sound.qc
------------
*/
// Sound channels
float TBX_SOUND_CHANNEL_AUTO = 0;   // Automatic (default)
float TBX_SOUND_CHANNEL_WEAPON = 1; // Weapon sound
float TBX_SOUND_CHANNEL_VOICE = 2;  // Character voice
float TBX_SOUND_CHANNEL_ITEM = 3;   // Powerup signal
float TBX_SOUND_CHANNEL_BODY = 4;   // Foliage noise
// Sound falloff
float TBX_SOUND_FALLOFF_NONE = 0;   // no falloff, heard everywhere
float TBX_SOUND_FALLOFF_NORMAL = 1; // normal, loud falloff (default)
float TBX_SOUND_FALLOFF_IDLE = 2;   // idle, near falloff
float TBX_SOUND_FALLOFF_STATIC = 3; // ambient sound falloff
// Hard-coded sounds
string TBX_SOUND_DROPTHUD = "demon/dland2.wav";      // body drops on solid
string TBX_SOUND_DROPSPLASH = "misc/h2ohit1.wav";    // body drops in liquid
string TBX_SOUND_NAILHIT = "weapons/tink1.wav";      // nail hits solid
string TBX_SOUND_NAILRICOCHET1 = "weapons/ric1.wav"; // nail ricochet 1
string TBX_SOUND_NAILRICOCHET2 = "weapons/ric2.wav"; // nail ricochet 2
string TBX_SOUND_NAILRICOCHET3 = "weapons/ric3.wav"; // nail ricochet 3
string TBX_SOUND_SPITHIT = "wizard/hit.wav";         // spit hits solid
string TBX_SOUND_SPARKHIT = "hknight/hit.wav";       // flame spark hits solid

/*
-------------
tbx_string.qc
-------------
*/

/*
------------
tbx_utils.qc
------------
*/

/*
-------------
tbx_vector.qc
-------------
*/
// Direction flags
float TBX_DIRECTIONFLAG_RIGHT = 1;
float TBX_DIRECTIONFLAG_FORWARD = 2;
float TBX_DIRECTIONFLAG_UP = 4;
float TBX_DIRECTIONFLAG_LEFT = 8;
float TBX_DIRECTIONFLAG_BACKWARD = 16;
float TBX_DIRECTIONFLAG_DOWN = 32;

/*
------------
tbx_world.qc
------------
*/
//Point contents
float TBX_POINTCONTENT_EMPTY = -1; // Empty (air)
float TBX_POINTCONTENT_SOLID = -2; // Solid (wall)
float TBX_POINTCONTENT_WATER = -3; // Water (swim)
float TBX_POINTCONTENT_SLIME = -4; // Slime (swim, low damage)
float TBX_POINTCONTENT_LAVA = -5;  // Lava (swim, high frequent damage)
float TBX_POINTCONTENT_SKY = -6;   // Sky (wall, despawns projectiles)



/*
=================
ToolBlox Entities
=================
*/

/*
------------------
tbx_playerstart.qc
------------------
*/

/*
-----------------
tbx_worldspawn.qc
-----------------
*/