/*
==============================================================================

ToolBlox function signatures

Cached function signatures so they can be referenced before they are defined.

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
void() tbx_OnBeforePhysics;
void() tbx_OnAfterPhysics;
void() tbx_OnPlayerSuicide;
void() tbx_OnPlayerConnect;
void() tbx_OnPlayerSpawn;
void() tbx_OnPlayerDisconnect;
void() tbx_OnPlayerInit;
void() tbx_OnMapChange;
void() tbx_OnWorldSpawn;
void() tbx_OnFirstFrameStart;
void() tbx_OnFrameStart;

/*
-----------
tbx_core.qc
-----------
*/
void(string message) tbx_Error;
void(entity sourceEntity, string message) tbx_EntityError;
float(string variableName) tbx_GetConsoleVariable;
void(string commandMessage) tbx_PrintServerCommand;
string(string filePath) tbx_LoadFile;
void(string variableName, string newValue) tbx_SetConsoleVariable;
string(string s) tbx_LoadRegisteredFile;
void(entity player) tbx_WriteSpawnParameters;
void(float targetEpisodeFlags) tbx_AddEpisodeFlags;
void(float targetEpisodeFlags) tbx_RemoveEpisodeFlags;
void() tbx_LoadMain;
/*
The below are omitted since they are internal:
  void() main;
  void() StartFrame;
*/

/*
------------
tbx_debug.qc
------------
*/
void(string debugMessage) tbx_PrintDebug;
void() tbx_CoreDump;
void() tbx_StartFunctionTracing;
void() tbx_StopFunctionTracing;
void(entity sourceEntity) tbx_PrintEntity;
void(string oldFunction, string newFunction) tbx_PrintDeprecation;

/*
-------------
tbx_effect.qc
-------------
*/
void(
  vector sourceOrigin,
  vector velocity,
  float color,
  float density
) tbx_SpawnParticles;

/*
-------------
tbx_entity.qc
-------------
*/
void(entity targetEntity, vector newOrigin) tbx_SetOrigin;
void(entity targetEntity, string modelPath) tbx_SetModel;
void(
  entity targetEntity,
  vector minBounds,
  vector maxBounds
) tbx_SetBounds;
entity() tbx_Spawn;
void(entity targetEntity) tbx_Despawn;
entity(
  entity afterEntity,
  .string targetField,
  string matchValue
) tbx_FindEntity;
entity(vector sourceOrigin, float radius) tbx_FindEntitiesInRadius;
float(entity targetEntity, float yaw, float distance) tbx_ShiftEntity;
float(entity targetEntity) tbx_DropEntity;
float(entity sourceEntity) tbx_CheckGround;
vector(
  entity sourceEntity,
  float projectileSpeed
) tbx_GetProjectileVelocity;
entity(entity sourceEntity) tbx_GetNextEntity;
void(entity targetEntity) tbx_TurnToIdealYaw;
void(entity targetEntity, float distance) tbx_NavigateEntity;
void(entity targetEntity) tbx_SetEntityStatic;
void() tbx_Retouch;
float(entity sourceEntity) tbx_GetModelIndex;
vector(entity sourceEntity) tbx_GetMinimumWorldBounds;
vector(entity sourceEntity) tbx_GetMaximumWorldBounds;
float(entity sourceEntity) tbx_GetLocalTime;
void(entity targetEntity, float timeDelta) tbx_AddLocalTime;
float(entity sourceEntity) tbx_GetMoveType;
void(entity targetEntity, float newMoveType) tbx_SetMoveType;
float(entity sourceEntity) tbx_GetSolidType;
void(entity targetEntity, float newSolidType) tbx_SetSolidType;
vector(entity sourceEntity) tbx_GetOrigin;
vector(entity sourceEntity) tbx_GetLastOrigin;
vector(entity sourceEntity) tbx_GetMovement;
vector(entity sourceEntity) tbx_GetVelocity;
void(entity targetEntity, vector newVelocity) tbx_SetVelocity;
void(entity targetEntity, vector velocityDelta) tbx_AddVelocity;
void(entity targetEntity, float speedScale) tbx_ScaleVelocity;
vector(entity sourceEntity) tbx_GetOrientation;
void(entity targetEntity, vector newOrientation) tbx_SetOrientation;
void(entity targetEntity, vector orientationDelta) tbx_ChangeOrientation;
vector(entity sourceEntity) tbx_GetSpin;
vector(entity targetEntity, vector newSpin) tbx_SetSpin;
vector(entity targetEntity, vector spinDelta) tbx_ChangeSpin;
vector(entity sourceEntity) tbx_GetViewFlinch;
void(entity targetEntity, vector newViewFlinch) tbx_SetViewFlinch;
void(entity targetEntity, vector addedViewFlinch) tbx_AddViewFlinch;
string(entity sourceEntity) tbx_GetClass;
void(entity targetEntity, string newClass) tbx_SetClass;
string(entity sourceEntity) tbx_GetModel;
float(entity sourceEntity) tbx_GetFrame;
void(entity targetEntity, float newFrame) tbx_SetFrame;
void(entity targetEntity) tbx_NextFrame;
void(entity targetEntity) tbx_LastFrame;
void(entity targetEntity, float frameLimit) tbx_NextFrameUntil;
void(entity targetEntity, float frameLimit) tbx_LastFrameUntil;
void(
  entity targetEntity,
  float startFrame,
  float endFrame
) tbx_NextFrameBetween;
void(
  entity targetEntity,
  float startFrame,
  float endFrame
) tbx_LastFrameBetween;
float(entity sourceEntity) tbx_GetSkin;
void(entity targetEntity, float newSkin) tbx_SetSkin;
float(entity sourceEntity) tbx_GetEffectFlags;
void(entity targetEntity, float newEffects) tbx_SetEffectFlags;
vector(entity sourceEntity) tbx_GetMinimumBounds;
vector(entity sourceEntity) tbx_GetMaximumBounds;
vector(entity sourceEntity) tbx_GetSize;
void(entity targetEntity, void() newOnUse) tbx_SetOnUse;
void(entity targetEntity, void() newOnThink) tbx_SetOnThink;
void(entity targetEntity, void() newOnBlocked) tbx_SetOnBlocked;
void(entity targetEntity) tbx_ThinkStart;
void(entity targetEntity, float timeDelay) tbx_ThinkAfter;
void(entity targetEntity, float timeDelay) tbx_ThinkDelay;
void(entity targetEntity) tbx_ThinkEnd;
entity(entity sourceEntity) tbx_GetGround;
float(entity sourceEntity) tbx_GetHealth;
void(
  entity targetEntity,
  float newHealth,
  float minimumHealth,
  float maximumHealth
) tbx_SetHealth;
void(
  entity targetEntity,
  float addHealth,
  float minimumHealth,
  float maximumHealth
) tbx_AddHealth;
float(entity sourceEntity) tbx_GetFrags;
void(entity targetEntity, float newFrags) tbx_SetFrags;
void(entity targetEntity, float addedFrags) tbx_AddFrags;
float(entity sourceEntity) tbx_GetCurrentWeapon;
void(entity targetEntity, float newWeapon) tbx_SetCurrentWeapon;
float(entity sourceEntity) tbx_GetShells;
void(entity targetEntity, float newAmmo) tbx_SetShells;
float(entity sourceEntity) tbx_GetNails;
void(entity targetEntity, float newAmmo) tbx_SetNails;
float(entity sourceEntity) tbx_GetRockets;
void(entity targetEntity, float newAmmo) tbx_SetRockets;
float(entity sourceEntity) tbx_GetCells;
void(entity targetEntity, float newAmmo) tbx_SetCells;
float(entity sourceEntity) tbx_GetItems;
void(entity targetEntity, float newItems) tbx_SetItems;
float(entity sourceEntity) tbx_GetVulnerability;
void(entity targetEntity, float newType) tbx_SetVulnerability;
entity(entity sourceEntity) tbx_GetNextInRadius;
float(entity sourceEntity) tbx_GetVitals;
void(entity targetEntity, float newVitals) tbx_SetVitals;
vector(entity sourceEntity) tbx_GetEyePosition;
void(entity targetEntity, vector newPosition) tbx_SetEyePosition;
vector(entity sourceEntity) tbx_CheckInputs;
void(entity targetEntity) tbx_ClearInputs;
void(entity targetEntity) tbx_ClearAttack;
void(entity targetEntity) tbx_ClearUse;
void(entity targetEntity) tbx_ClearJump;
void(entity targetEntity) tbx_ForceAttack;
void(entity targetEntity) tbx_ForceUse;
void(entity targetEntity) tbx_ForceJump;
float(entity sourceEntity) tbx_GetImpulse;
void(entity targetEntity) tbx_ClearImpulse;
void(entity targetEntity, float newImpulse) tbx_SetImpulse;
void(entity targetEntity) tbx_SnapOrientation;
vector(entity sourceEntity) tbx_GetViewOrientation;
void(entity targetEntity, vector newAngle) tbx_SetViewOrientation;
float(entity sourceEntity) tbx_GetIdealPitch;
string(entity sourceEntity) tbx_GetDisplayName;
void(entity targetEntity, string newName) tbx_SetDisplayName;
entity(entity sourceEntity) tbx_GetEnemy;
void(entity targetEntity, entity newEnemy) tbx_SetEnemy;
float(entity sourceEntity) tbx_GetMoveFlags;
void(entity targetEntity, float newFlags) tbx_SetMoveFlags;
float(entity sourceEntity) tbx_GetRoleFlags;
void(entity targetEntity, float newFlags) tbx_SetRoleFlags;
float(entity sourceEntity) tbx_GetPositionFlags;
void(entity targetEntity, float newFlags) tbx_SetPositionFlags;
float(entity sourceEntity) tbx_GetCheatFlags;
void(entity targetEntity, float newFlags) tbx_SetCheatFlags;
float(entity sourceEntity) tbx_GetItemFlags;
void(entity targetEntity, float newFlags) tbx_SetItemFlags;
float(entity sourceEntity) tbx_GetActionFlags;
void(entity targetEntity, float newFlags) tbx_SetActionFlags;
float(entity sourceEntity) tbx_GetShirtColorIndex;
void(entity targetEntity, float newColor) tbx_SetShirtColorIndex;
float(entity sourceEntity) tbx_GetPantsColorIndex;
void(entity targetEntity, float newColor) tbx_SetPantsColorIndex;
float(entity sourceEntity) tbx_GetMaxHealth;
void(entity targetEntity, float newHealth) tbx_SetMaxHealth;
float(entity sourceEntity) tbx_GetTossEndTime;
void(entity targetEntity, float newTime) tbx_SetTossEndTime;
float(entity sourceEntity) tbx_GetArmorProtection;
void(entity targetEntity, float newProtection) tbx_SetArmorProtection;
float(entity sourceEntity) tbx_GetArmor;
void(entity targetEntity, float newDurability) tbx_SetArmor;
float(entity sourceEntity) tbx_GetEnvironmentType;
void(entity targetEntity, float newContentType) tbx_ForceEnvironmentType;

/*
------------
tbx_flags.qc
------------
*/
float(float sourceFlags, float targetFlags) tbx_AddFlags;
float(float sourceFlags, float targetFlags) tbx_RemoveFlags;
float(float sourceFlags, float targetFlags) tbx_ToggleFlags;

/*
------------
tbx_light.qc
------------
*/
void(float newStyle, string value) tbx_SetLightStyle;
string(float lightIntensity) tbx_GetLightLevel;

/*
------------
tbx_logic.qc
------------
*/
float(float successFraction) CheckChance;

/*
-----------
tbx_math.qc
-----------
*/
float() tbx_GetRandomFloat;
float(float rawValue) tbx_GetRounded;
float(float rawValue) tbx_GetFloor;
float(float rawValue) tbx_GetCeiling;
float(float rawValue) tbx_GetAbsolute;
float(float rawValue) tbx_GetSign;
float(float value1, float value2) tbx_GetAverage;
float(float value1, float value2, float weight) tbx_GetWeightedAverage;
float(float value1, float value2) tbx_GetMaximum;
float(float value1, float value2) tbx_GetMinimum;

/*
-----------
tbx_meta.qc
-----------
*/
void() tbx_PrintToolBloxVersion;
void() tbx_PrintToolBloxCredits;

/*
------------
tbx_model.qc
------------
*/
string(string modelPath) tbx_LoadModel;
string(string modelPath) tbx_LoadRegisteredModel;
void() tbx_LoadHardCodedModels;

/*
--------------
tbx_network.qc
--------------
*/
void(float networkChannel, float messageByte) tbx_WriteNetworkByte;
void(float networkChannel, float messageChar) tbx_WriteNetworkChar;
void(
  float networkChannel,
  float messageShortInt
) tbx_WriteNetworkShortInt;
void(
  float networkChannel,
  float messageLongInt
) tbx_WriteNetworkLongInt;
void(
  float networkChannel,
  float messageCoordinate
) tbx_WriteNetworkCoordinate;
void(
  float networkChannel,
  float messageCoordinate
) tbx_WriteNetworkAngle;
void(float networkChannel, string messageString) tbx_WriteNetworkString;
void(float networkChannel, entity messageEntity) tbx_WriteNetworkEntity;
entity() tbx_GetLocalMessagePlayer;
void(entity newPlayer) tbx_SetLocalMessagePlayer;

/*
------------
tbx_noise.qc
------------
*/
float(float noiseValueIndex) tbx_GetWhiteNoise;

/*
-------------
tbx_player.qc
-------------
*/
entity(entity sourceEntity) tbx_GetNearbyPlayer;
void(entity targetEntity, string commandMessage) tbx_PrintClientCommand;
string(entity sourceEntity) tbx_GetWeaponModel;
void(entity targetEntity, string newModelPath) tbx_SetWeaponModel;
float(entity sourceEntity) tbx_GetWeaponFrame;
void(entity targetEntity, float newFrame) tbx_SetWeaponFrame;
void(entity targetEntity) tbx_NextWeaponFrame;
void(entity targetEntity) tbx_LastWeaponFrame;
void(entity targetEntity, float frameLimit) tbx_NextWeaponFrameUntil;
void(entity targetEntity, float frameLimit) tbx_LastWeaponFrameUntil;
void(
  entity targetEntity,
  float startFrame,
  float endFrame
) tbx_NextWeaponFrameBetween;
void(
  entity targetEntity,
  float startFrame,
  float endFrame
) tbx_LastWeaponFrameBetween;
float(entity sourceEntity) tbx_GetCurrentWeaponAmmo;
void(entity targetEntity, float newAmmo) tbx_SetCurrentWeaponAmmo;
float(float valueIndex) tbx_GetStoredValue;
void(float valueIndex, float newValue) tbx_SetStoredValue;
/*
The below are omitted since they are internal:
  void() PlayerPreThink;
  void() PlayerPostThink;
  void() ClientKill;
  void() ClientConnect;
  void() PutClientInServer;
  void() ClientDisconnect;
  void() SetNewParms;
  void() SetChangeParms;
*/
entity(entity afterEntity) tbx_FindNextPlayerStart;

/*
------------
tbx_print.qc
------------
*/
void(string broadcastMessage) tbx_PrintBroadcast;
void(entity player, string playerMessage) tbx_PrintLocal;
void(entity player, string centeredMessage) tbx_PrintLocalCentered;
void(
  entity player,
  string centeredMessage,
  string centeredMessage2
) tbx_PrintLocalCentered2;
void(
  entity player,
  string centeredMessage1,
  string centeredMessage2,
  string centeredMessage3
) tbx_PrintLocalCentered3;
void(
  entity player,
  string centeredMessage1,
  string centeredMessage2,
  string centeredMessage3,
  string centeredMessage4
) tbx_PrintLocalCentered4;
void(
  entity player,
  string centeredMessage1,
  string centeredMessage2,
  string centeredMessage3,
  string centeredMessage4,
  string centeredMessage5
) tbx_PrintLocalCentered5;
void(
  entity player,
  string centeredMessage1,
  string centeredMessage2,
  string centeredMessage3,
  string centeredMessage4,
  string centeredMessage5,
  string centeredMessage6
) tbx_PrintLocalCentered6;
void(
  entity player,
  string centeredMessage1,
  string centeredMessage2,
  string centeredMessage3,
  string centeredMessage4,
  string centeredMessage5,
  string centeredMessage6,
  string centeredMessage7
) tbx_PrintLocalCentered7;

/*
---------------
tbx_raytrace.qc
---------------
*/
void(
  vector startPoint,
  vector endPoint,
  float monsterCheck,
  entity sourceEntity
) tbx_TraceRay;
void() tbx_Retrace;
float(
  vector startPoint,
  vector endPoint,
  float monsterCheck,
  entity sourceEntity
) tbx_GetTraceSolidFlags;
vector(
  vector startPoint,
  vector endPoint,
  float monsterCheck,
  entity sourceEntity
) tbx_GetTraceDistances;
vector(
  vector startPoint,
  vector endPoint,
  float monsterCheck,
  entity sourceEntity
) tbx_GetTraceEndPoint;
entity(
  vector startPoint,
  vector endPoint,
  float monsterCheck,
  entity sourceEntity
) tbx_GetTraceCollisionEntity;
vector(
  vector startPoint,
  vector endPoint,
  float monsterCheck,
  entity sourceEntity
) tbx_GetTraceCollisionNormal;
float(
  vector startPoint,
  vector endPoint,
  float monsterCheck,
  entity sourceEntity
) tbx_GetTracePassFlags;

/*
------------
tbx_sound.qc
------------
*/
string(string soundPath) tbx_LoadSound;
void(
  entity sourceEntity,
  string soundPath,
  float volume,
  float falloff
) tbx_PlayAmbientSound;
string(string soundPath) tbx_LoadRegisteredSound;
void() tbx_LoadHardCodedSounds;

/*
-------------
tbx_string.qc
-------------
*/
string(float floatValue) tbx_GetFloatString;
string(vector vectorValue) tbx_GetVectorString;

/*
------------
tbx_utils.qc
------------
*/
void() tbx_DoNothing;

/*
-------------
tbx_vector.qc
-------------
*/
void(vector sourceAngles) tbx_ProduceRelativeUnitVectors;
vector(vector rawVector) tbx_GetUnitVector;
float(vector sourceVector) tbx_GetVectorLength;
float(vector sourceVector) tbx_GetVectorYaw;
vector(vector sourceVector) tbx_GetVectorAngles;
vector(vector sourceAngles, float targetDirection) tbx_GetRelativeDirection;

/*
------------
tbx_world.qc
------------
*/
float(vector sourcePoint) tbx_PointContent;
void(string mapPath) tbx_LoadMap;
void() tbx_AddSecretCount;
void() tbx_FindSecret;
void() tbx_FindSuperSecret;
void() tbx_AddMonsterCount;
void() tbx_KillMonster;



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
void() tbx_PlayerStart;

/*
-----------------
tbx_worldspawn.qc
-----------------
*/
void() worldspawn;