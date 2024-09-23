/*
==============================================================================

ToolBlox entity functions

Functions responsible for managing entities.

==============================================================================
*/



/*
===========================
Engine API functions

Please do not change these.
===========================
*/

/*
---------------------------------------------
Set origin

Sets new anchor point coordinates for entity.

targetEntity: entity to reposition
newOrigin:    position to set
---------------------------------------------
*/
void(entity targetEntity, vector newOrigin) tbx_SetOrigin = #2;

/*
--------------------------------------------
Set model

Sets model and links entity into world.
Advisable to set .movetype and .solid first.
The model should be precached before use.

targetEntity: entity to set model for
modelPath:    model path (.mdl, .spr, .bsp)
--------------------------------------------
*/
void(entity targetEntity, string modelPath) tbx_SetModel = #3;

/*
-----------------------------------------------------------
Set bounds

Sets entity bounding box relative to its origin.
Uses world coordinates, does not rotate with facing.

targetEntity: entity to set bounds for
minBounds:    southwest bottom corner
maxBounds:    northeast top corner
-----------------------------------------------------------
*/
void(
  entity targetEntity,
  vector minBounds,
  vector maxBounds
) tbx_SetBounds = #4;

/*
-----------------------------------------------------------------------------
Spawn

Returns a new, blank entity.
Entity constructors (doors, monsters etc.) implicitly call this and assign it
the name of their function as the classname.
-----------------------------------------------------------------------------
*/
entity() tbx_Spawn = #14;

/*
------------------------------------------------
Despawn

Unloads the passed entity from the map.
Warns when trying to remove the map entity.
Reports key identifiers of the removed entity.

targetEntity: entity to unload
------------------------------------------------
*/
void(entity targetEntity) tbx_Despawn =
{
  if (targetEntity == world)
  {
    tbx_PrintDebug("\nWarning: Attempted to despawn the world.\n");
    tbx_PrintDebug("If this isn't a mass-cleanup process,");
    tbx_PrintDebug("verify the entity you want to remove before doing so.\n");
    return;
  }
  
  tbx_PrintDebug("\ntbx_Despawn: ");
  tbx_PrintDebug(targetEntity.classname);
  tbx_PrintDebug(" ('");
  tbx_PrintDebug(targetEntity.targetname);
  tbx_PrintDebug("') removed at ");
  tbx_PrintDebug(tbx_GetVectorString(targetEntity.origin));
  tbx_PrintDebug(".\n");
  _15(targetEntity);
};

/*
-------------------------------------------------------------------------
Find entity

Looks for the first entity with matching field value after afterEntity.
To iterate over all applicable entites, call the function in a loop until
world is reached.

Returns the first found entity.

afterEntity: entity to begin after
targetField: entity field name to check for matching value
matchValue:  field value as string to match
-------------------------------------------------------------------------
*/
entity(
  entity afterEntity,
  .string targetField,
  string matchValue
) tbx_FindEntity = #18;

/*
-----------------------------------------------------
Find Entities In Radius

Finds all entities in radius and links them together.
.chain of each entity contains the next found entity.
When .chain is "world", there are no more entities.
Used in explosion splash damage.
Checks against entity bounding box center, not origin.

Returns the first found entity.

sourceOrigin: origin point of the check
radius:       distance (radius) of the check
-----------------------------------------------------
*/
entity(vector sourceOrigin, float radius) tbx_FindEntitiesInRadius = #22;

/*
--------------------------------------------------------
Shift entity

Linear displacement without fancy pathfinding.
Moves horizontally only.
Used for monster patrolling.

Returns TRUE if movement was unobstructed.

targetEntity: entity to move
yaw:          horizontal angle of movement
distance:     distance to move
--------------------------------------------------------
*/
float(entity targetEntity, float yaw, float distance) tbx_ShiftEntity =
{
  local entity oldSelf;
  local float isUnblocked;

  oldSelf = self;
  self = targetEntity;
  isUnblocked = _32(yaw, distance);
  self = oldSelf;

  return isUnblocked;
};

/*
--------------------------------------------------
Drop entity

Drops entity by up to 256 units in a single frame.

Returns TRUE if entity touched ground.

targetEntity: entity to drop
--------------------------------------------------
*/
float(entity targetEntity) tbx_DropEntity =
{
  local entity oldSelf;
  local float isPlanted;

  oldSelf = self;
  self = targetEntity;
  isPlanted = _34();
  self = oldSelf;

  return isPlanted;
};

/*
------------------------------------
Check ground

Returns TRUE if entity is on ground.
Used by leaping monsters.

sourceEntity: entity to check
------------------------------------
*/
float(entity sourceEntity) tbx_CheckGround = #40;

/*
-------------------------------------------------------------------------
Get projectile velocity

Returns a projectile velocity vector pointing in the direction the entity
faces.

sourceEntity:    entity which takes aim
projectileSpeed: speed at which the projectile travels
-------------------------------------------------------------------------
*/
vector(
  entity sourceEntity,
  float projectileSpeed
) tbx_GetProjectileVelocity = #44;

/*
-------------------------------------------------------
Get next entity

Returns the entity after the passed entity in the list.
Used for looping through all entities.

sourceEntity: preceding entity
-------------------------------------------------------
*/
entity(entity sourceEntity) tbx_GetNextEntity = #47;

/*
--------------------------------------------------------------
Turn to ideal yaw

Turn self horizontally toward its ideal_yaw at its yaw_speed.

targetEntity: The entity to nudge toward its target yaw angle.
--------------------------------------------------------------
*/
void(entity targetEntity) tbx_TurnToIdealYaw =
{
  local entity oldSelf;

  oldSelf = self;
  self = targetEntity;
  _49();
  self = oldSelf;
};

/*
---------------------------------------------------------
Navigate entity

Moves entity toward .goalentity using fancy pathfinding.
Moves horizontally only.
Used for monsters closing in on the player during combat.

targetEntity: entity to navigate toward its goal entity
distance:     distance to cover
---------------------------------------------------------
*/
void(entity targetEntity, float distance) tbx_NavigateEntity = {
  
  local entity oldSelf;

  oldSelf = self;
  self = targetEntity;
  _67(distance);
  self = oldSelf;
};

/*
-----------------------------------------------------------------------------
Set entity static

Converts an entity to a passive static entity, removing all means of
interaction during gameplay (including deletion) to save processing time.
Used by light models and illusionary brushes.
A static entity doesn't interact with the rest of the game. These are flames
(progs/flame.mdl), lights, illusionary objects, and the like. These entities
are meant to be ignored so they don't get an entity reference number.
Causes a spawnstatic message to be sent to every player. A static entity
cannot be removed once created. The maximum number of static entities is 127.

targetEntity: entity to convert to static
-----------------------------------------------------------------------------
*/
void(entity targetEntity) tbx_SetEntityStatic = #69;



/*
=======================================================================
Engine utility functions

Utility functions to safely manipulate engine-related game state.
For more information, consult the relevant id_core/id_engine.txt entry.

Please do not change these.
=======================================================================
*/

/*
-------------------------------------------------------------
Retouch

Sets a standard double-retouch to ensure a full entity cycle.
-------------------------------------------------------------
*/
void() tbx_Retouch =
{
  force_retouch = 2;
};

/*
----------------------------------------------------------------------------
Get model index

Returns the precache-index number of the model used by the entity.

sourceEntity: the entity to read the value from

NOTE: If randomization is involved with entity spawning, the model index may
      change arbitrarily upon reloading a saved game.
----------------------------------------------------------------------------
*/
float(entity sourceEntity) tbx_GetModelIndex =
{
  return sourceEntity.modelindex;
};

/*
-------------------------------------------------------------------------
Get minimum world bounds

Returns the southwest bottom corner point of the entity relative to world
coordinates.
Use tbx_SetBounds() to update.

Human-sized:
  vector TBX_SMALL_BOUNDS_MIN = '-16 -16 -24'; // human left-rear-bottom
  vector TBX_SMALL_BOUNDS_MAX = '16 16 32';    // human right-front-top

sourceEntity: the entity to read the value from
-------------------------------------------------------------------------
*/
vector(entity sourceEntity) tbx_GetMinimumWorldBounds =
{
  return sourceEntity.absmin;
};

/*
----------------------------------------------------------------------
Get maximum world bounds

Returns the northeast top corner point of the entity relative to world
coordinates.
Use tbx_SetBounds() to update.

sourceEntity: the entity to read the value from
----------------------------------------------------------------------
*/
vector(entity sourceEntity) tbx_GetMaximumWorldBounds =
{
  return sourceEntity.absmax;
};

/*
-------------------------------------------------------------------------
Get local time

Returns the local time value of the entity.
Local time is automatically updated for moving brush entites, and freezes
while the movement of the entity is blocked.
Moving brush entities use this to defer their next AI routine.

Use tbx_AddLocalTime to increment this value manually.

sourceEntity: the entity to read the value from
-------------------------------------------------------------------------
*/
float(entity sourceEntity) tbx_GetLocalTime =
{
  return sourceEntity.ltime;
};

/*
------------------------------------------------------------------------------
Add local time

Adds passed value to the local time value of the entity.
Use this only to manage brush entities in motion.

NOTE: You should not set local time directly, it can mess up the execution of
      the brush movement coordination. Please use dedicated .tbx_* or .myMod_*
      fields for arbitrary time tracking.

targetEntity: the entity to change the value for
timeDelta:    the time to add (can be negative)
------------------------------------------------------------------------------
*/
void(entity targetEntity, float timeDelta) tbx_AddLocalTime =
{
  targetEntity.ltime = targetEntity.ltime + timeDelta;
};

/*
----------------------------------------------------------------------------
Get move type

Returns the move type of the entity:
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

sourceEntity: the entity to read the value from
----------------------------------------------------------------------------
*/
float(entity sourceEntity) tbx_GetMoveType =
{
  return sourceEntity.movetype;
};

/*
----------------------------------------------------------------------------
Set move type

Sets the move type of the entity:
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

Use TBX_MOVETYPE_NONE for props and cams.
Use TBX_MOVETYPE_MOVE for interactive players.
Use TBX_MOVETYPE_FRAME for animated monsters.
Use TBX_MOVETYPE_HOVER for flying monsters and players.
Use TBX_MOVETYPE_DROP for items and corpses.
Use TBX_MOVETYPE_WALL for moving walls like doors and crushers.
Use TBX_MOVETYPE_NOCLIP for non-clipping entities.
Use TBX_MOVETYPE_SHOT for nails and rockets.
Use TBX_MOVETYPE_BOUNCE for grenades and gibs.

targetEntity: the entity to change the value for
newMoveType:  the move type to set
----------------------------------------------------------------------------
*/
void(entity targetEntity, float newMoveType) tbx_SetMoveType =
{
  targetEntity.movetype = newMoveType;
};

/*
------------------------------------------------------------------
Get solid type

Returns the solidity type of the entity:
                                    // +-------+---------+-------+
                                    // | shape | collide | touch |
                                    // +-------+---------+-------+
  float TBX_SOLIDTYPE_NOT = 0;      // | box   | none    | no    |
  float TBX_SOLIDTYPE_TRIGGER = 1;  // | box   | none    | yes   |
  float TBX_SOLIDTYPE_BOX = 2;      // | box   | ground  | yes   |
  float TBX_SOLIDTYPE_SLIDEBOX = 3; // | box   | slide   | yes   |
  float TBX_SOLIDTYPE_BSP = 4;      // | BSP   | ground  | yes   |
                                    // +-------+---------+-------+

sourceEntity: the entity to read the value from
------------------------------------------------------------------
*/
float(entity sourceEntity) tbx_GetSolidType =
{
  return sourceEntity.solid;
};

/*
------------------------------------------------------------------
Set solid type

Sets the solidity type of the entity:
                                    // +-------+---------+-------+
                                    // | shape | collide | touch |
                                    // +-------+---------+-------+
  float TBX_SOLIDTYPE_NOT = 0;      // | box   | none    | no    |
  float TBX_SOLIDTYPE_TRIGGER = 1;  // | box   | none    | yes   |
  float TBX_SOLIDTYPE_BOX = 2;      // | box   | ground  | yes   |
  float TBX_SOLIDTYPE_SLIDEBOX = 3; // | box   | slide   | yes   |
  float TBX_SOLIDTYPE_BSP = 4;      // | BSP   | ground  | yes   |
                                    // +-------+---------+-------+

targetEntity: the entity to change the value for
newSolidType: the solidity type to set
------------------------------------------------------------------
*/
void(entity targetEntity, float newSolidType) tbx_SetSolidType =
{
  targetEntity.solid = newSolidType;
};

/*
-----------------------------------------------
Get origin

Returns the entity anchor point coordinates.

sourceEntity: the entity to read the value from
-----------------------------------------------
*/
vector(entity sourceEntity) tbx_GetOrigin =
{
  return sourceEntity.origin;
};

/*
----------------------------------------------------------------------------
Get last origin

Returns the entity anchor point coordinates from the previous frame.
Use this for checking if last position is currently valid or invalid by some
arbitrary logic.
Use tbx_GetMovement() to track position change.

sourceEntity: the entity to read the value from
----------------------------------------------------------------------------
*/
vector(entity sourceEntity) tbx_GetLastOrigin =
{
  return sourceEntity.oldorigin;
};

/*
------------------------------------------------------------------------
Get movement

Returns the entity position change since the previous frame.

NOTE: This is the change in anchor coordinates, not the force of motion.

sourceEntity: the entity to read the value from
------------------------------------------------------------------------
*/
vector(entity sourceEntity) tbx_GetMovement =
{
  return sourceEntity.origin - sourceEntity.oldorigin;
};

/*
------------------------------------------------------------------------
Get velocity

Returns the current entity velocity vector.

NOTE: This is the force of motion, not the change in anchor coordinates.

sourceEntity: the entity to read the value from
------------------------------------------------------------------------
*/
vector(entity sourceEntity) tbx_GetVelocity =
{
  return sourceEntity.velocity;
};

/*
----------------------------------------------------------------------------
Set velocity

Sets the current entity velocity vector.
Use this to change the velocity arbitrarily (e.g. teleportation, ricochet).
Use tbx_AddVelocity to change the velocity relative to the current velocity.

targetEntity: the entity to change the value for
newVelocity:  the velocity to set
----------------------------------------------------------------------------
*/
void(entity targetEntity, vector newVelocity) tbx_SetVelocity =
{
  targetEntity.velocity = newVelocity;
};

/*
-----------------------------------------------------------------
Add velocity

Adds passed vector to the current entity velocity vector.
Use this to change the velocity relative to the current velocity.
Use tbx_SetVelocity to change the velocity arbitrarily.

targetEntity:  the entity to change the value for
velocityDelta: the velocity to add (can be negative)
-----------------------------------------------------------------
*/
void(entity targetEntity, vector velocityDelta) tbx_AddVelocity =
{
  targetEntity.velocity = targetEntity.velocity + velocityDelta;
};

/*
----------------------------------------------------------------
Scale velocity

Multiplies the current entity velocity vector by a scalar value.
Use this to change the overall speed of the velocity vector.

targetEntity: the entity to change the value for
speedScale:   the speed scale to multiply the velocity by
----------------------------------------------------------------
*/
void(entity targetEntity, float speedScale) tbx_ScaleVelocity =
{
  targetEntity.velocity = targetEntity.velocity * speedScale;
};

/*
------------------------------------------------------------------
Get orientation

Returns the current entity orientation angles by pitch, yaw, roll.

NOTE: If player health drops to 0, roll automatically changes.

sourceEntity: the entity to read the value from
------------------------------------------------------------------
*/
vector(entity sourceEntity) tbx_GetOrientation =
{
  return sourceEntity.angles;
};

/*
------------------------------------------------------------------
Set orientation

Updates the current entity orientation angles by pitch, yaw, roll.

NOTE: If player health drops to 0, roll automatically changes.

targetEntity:   the entity to change the value for
newOrientation: the orientation to set
------------------------------------------------------------------
*/
void(entity targetEntity, vector newOrientation) tbx_SetOrientation =
{
  targetEntity.angles = newOrientation;
};

/*
------------------------------------------------------------------------
Change orientation

Adjusts the current entity orientation angles by pitch, yaw, roll.

NOTE: If player health drops to 0, roll automatically changes.

targetEntity:     the entity to change the value for
orientationDelta: the relative pitch, yaw, roll to change orientation by
                  (can be negative)
------------------------------------------------------------------------
*/
void(entity targetEntity, vector orientationDelta) tbx_ChangeOrientation =
{
  targetEntity.angles = targetEntity.angles + orientationDelta;
};

/*
----------------------------------------------------------------
Get spin

Returns the current entity rotation speeds for pitch, yaw, roll.

sourceEntity: the entity to read the value from
----------------------------------------------------------------
*/
vector(entity sourceEntity) tbx_GetSpin =
{
  return sourceEntity.avelocity;
};

/*
----------------------------------------------------------------
Set spin

Updates the current entity rotation speeds for pitch, yaw, roll.

targetEntity: the entity to change the value for
newSpin:      the rotation speeds to set
----------------------------------------------------------------
*/
vector(entity targetEntity, vector newSpin) tbx_SetSpin =
{
  return targetEntity.avelocity = newSpin;
};

/*
----------------------------------------------------------------
Change spin

Adjusts the current entity rotation speeds for pitch, yaw, roll.

targetEntity: the entity to change the value for
spinDelta:    the relative pitch, yaw, roll to change spin by
              (can be negative)
----------------------------------------------------------------
*/
vector(entity targetEntity, vector spinDelta) tbx_ChangeSpin =
{
  return targetEntity.avelocity = targetEntity.avelocity + spinDelta;
};

/*
---------------------------------------------------------------------------
Get view flinch

Returns the current entity relative view flinch angles by pitch, yaw, roll.
This automatically goes back to '0 0 0' over time.

sourceEntity: the entity to read the value from
---------------------------------------------------------------------------
*/
vector(entity sourceEntity) tbx_GetViewFlinch =
{
  return sourceEntity.punchangle;
};

/*
---------------------------------------------------------------------------
Set view flinch

Updates the current entity relative view flinch angles by pitch, yaw, roll.
This automatically goes back to '0 0 0' over time.
Causes a temporary view offset for e.g. kickbacks or pain flinches.

targetEntity:  the entity to change the value for
newViewFlinch: the relative view flinch angles to set (can be negative)
---------------------------------------------------------------------------
*/
void(entity targetEntity, vector newViewFlinch) tbx_SetViewFlinch =
{
  targetEntity.punchangle = newViewFlinch;
};

/*
---------------------------------------------------------------------------
Add view flinch

Adjusts the current entity relative view flinch angles by pitch, yaw, roll.
This automatically goes back to '0 0 0' over time.
This can be used for cumulative disorientation.

targetEntity:    the entity to change the value for
addedViewFlinch: the relative view flinch angles to add (can be negative)
---------------------------------------------------------------------------
*/
void(entity targetEntity, vector addedViewFlinch) tbx_AddViewFlinch =
{
  targetEntity.punchangle = targetEntity.punchangle + addedViewFlinch;
};

/*
---------------------------------------------------------------------------
Get class

Returns the current entity class name.

NOTE: This is the entity class mappers use to spawn it, you should probably
      avoid relying on this specific value.

sourceEntity: the entity to read the value from
---------------------------------------------------------------------------
*/
string(entity sourceEntity) tbx_GetClass =
{
  return sourceEntity.classname;
};

/*
---------------------------------------------------------------------------
Set class

Defines the current entity class name.
Use this with dynamically spawned objects (e.g. gibs) for debug purposes.

NOTE: This is the entity class mappers use to spawn it, you should probably
      use a more arbitrary property to determine e.g. faction or variant.

targetEntity: the entity to change the value for
newClass:     the entity class name to set
---------------------------------------------------------------------------
*/
void(entity targetEntity, string newClass) tbx_SetClass =
{
  targetEntity.classname = newClass;
};

/*
-----------------------------------------------
Get model

Returns the current entity model path.

sourceEntity: the entity to read the value from
-----------------------------------------------
*/
string(entity sourceEntity) tbx_GetModel =
{
  return sourceEntity.model;
};

/*
-----------------------------------------------
Get frame

Returns the current entity animation frame.

sourceEntity: the entity to read the value from
-----------------------------------------------
*/
float(entity sourceEntity) tbx_GetFrame =
{
  return sourceEntity.frame;
};

/*
--------------------------------------------------
Set frame

Updates the current entity animation frame.
Use to change animation.

targetEntity: the entity to change the value for
newFrame:     the frame number to set (zero-based)
--------------------------------------------------
*/
void(entity targetEntity, float newFrame) tbx_SetFrame =
{
  targetEntity.frame = newFrame;
};

/*
---------------------------------------------------
Next frame

Increments the current entity animation frame by 1.

targetEntity: the entity to change the value for
---------------------------------------------------
*/
void(entity targetEntity) tbx_NextFrame =
{
  targetEntity.frame = targetEntity.frame + 1;
};

/*
---------------------------------------------------
Last frame

Decrements the current entity animation frame by 1.

targetEntity: the entity to change the value for
---------------------------------------------------
*/
void(entity targetEntity) tbx_LastFrame =
{
  targetEntity.frame = targetEntity.frame - 1;
};

/*
---------------------------------------------------
Next frame until

Increments the current entity animation frame by 1.
Does not go beyond passed frame.

targetEntity: the entity to change the value for
frameLimit:   the frame to stop on
---------------------------------------------------
*/
void(entity targetEntity, float frameLimit) tbx_NextFrameUntil =
{
  local float newFrame;

  newFrame = targetEntity.frame + 1;

  if (newFrame > frameLimit)
    newFrame = frameLimit;

  targetEntity.frame = newFrame;
};

/*
---------------------------------------------------
Last frame until

Decrements the current entity animation frame by 1.
Does not go beyond passed frame.

targetEntity: the entity to change the value for
frameLimit:   the frame to stop on
---------------------------------------------------
*/
void(entity targetEntity, float frameLimit) tbx_LastFrameUntil =
{
  local float newFrame;

  newFrame = targetEntity.frame - 1;

  if (targetEntity.frame < frameLimit)
    newFrame = frameLimit;

  targetEntity.frame = newFrame;
};

/*
------------------------------------------------------
Next frame between

Increments the current entity animation frame by 1.
Loops after end frame to start frame.

targetEntity: the entity to change the value for
startFrame:   the frame to restart on if end is passed
endFrame:     the final valid frame
------------------------------------------------------
*/
void(
  entity targetEntity,
  float startFrame,
  float endFrame
) tbx_NextFrameBetween =
{
  local float newFrame;

  newFrame = startFrame;

  if (targetEntity.frame <= endFrame)
    newFrame = newFrame + 1;

  targetEntity.frame = newFrame;
};

/*
--------------------------------------------------------
Last frame between

Decrements the current entity animation frame by 1.
Loops after start frame to end frame.

targetEntity: the entity to change the value for
startFrame:   the final valid frame
endFrame:     the frame to restart on if start is passed
--------------------------------------------------------
*/
void(
  entity targetEntity,
  float startFrame,
  float endFrame
) tbx_LastFrameBetween =
{
  local float newFrame;

  newFrame = endFrame;

  if (targetEntity.frame >= startFrame)
    newFrame = newFrame - 1;

  targetEntity.frame = newFrame;
};

/*
-----------------------------------------------
Get skin

Returns the current entity model skin index.

sourceEntity: the entity to read the value from
-----------------------------------------------
*/
float(entity sourceEntity) tbx_GetSkin =
{
  return sourceEntity.frame;
};

/*
--------------------------------------------------------------
Set skin

Updates the current entity model skin index.
Use to change model skin, e.g. for variant or damage level.

NOTE: You should use named constants to identify custom skins.

targetEntity: the entity to change the value for
newSkin:      the skin index to set (zero-based)
--------------------------------------------------------------
*/
void(entity targetEntity, float newSkin) tbx_SetSkin =
{
  targetEntity.skin = newSkin;
};

/*
-----------------------------------------------------------------
Get effect flags

Returns the current entity special effect flagset:
  float TBX_EFFECTFLAG_FIELD = 1;       // yellow particle field
  float TBX_EFFECTFLAG_DIMFLASH = 2;    // dim flash (resets)
  float TBX_EFFECTFLAG_BRIGHTLIGHT = 4; // bright light (Quad)
  float TBX_EFFECTFLAG_DIMLIGHT = 8;    // dim light (laser)

sourceEntity: the entity to read the value from
-----------------------------------------------------------------
*/
float(entity sourceEntity) tbx_GetEffectFlags =
{
  return sourceEntity.effects;
};

/*
-----------------------------------------------------------------
Set effect flags

Updates the current entity special effect flagset:
  float TBX_EFFECTFLAG_FIELD = 1;       // yellow particle field
  float TBX_EFFECTFLAG_DIMFLASH = 2;    // dim flash (resets)
  float TBX_EFFECTFLAG_BRIGHTLIGHT = 4; // bright light (Quad)
  float TBX_EFFECTFLAG_DIMLIGHT = 8;    // dim light (laser)

Use 'tbx_flags.qc' functions to manage this more efficiently.

targetEntity: the entity to change the value for
newEffects:   the effect flagset to apply
-----------------------------------------------------------------
*/
void(entity targetEntity, float newEffects) tbx_SetEffectFlags =
{
  targetEntity.effects = newEffects;
};

/*
--------------------------------------------------------------------------
Get minimum bounds

Returns the southwest bottom corner point of the entity relative to origin
coordinates.
Use tbx_SetBounds() to update this value.

sourceEntity: the entity to read the value from
--------------------------------------------------------------------------
*/
vector(entity sourceEntity) tbx_GetMinimumBounds =
{
  return sourceEntity.mins;
};

/*
-----------------------------------------------------------------------
Get maximum bounds

Returns the northeast top corner point of the entity relative to origin
coordinates.
Use tbx_SetBounds() to update this value.

sourceEntity: the entity to read the value from
-----------------------------------------------------------------------
*/
vector(entity sourceEntity) tbx_GetMaximumBounds =
{
  return sourceEntity.maxs;
};

/*
----------------------------------------------------------------
Get size

Returns the x-width, y-length and z-height of the entity bounds.
Use tbx_SetBounds() to update this value.

sourceEntity: the entity to read the value from
----------------------------------------------------------------
*/
vector(entity sourceEntity) tbx_GetSize =
{
  return sourceEntity.size;
};

/*
------------------------------------------------
Set on use

Updates the current entity 'use' event handler.

targetEntity: the entity to change the value for
newOnUse:     the function to apply
------------------------------------------------
*/
void(entity targetEntity, void() newOnUse) tbx_SetOnUse =
{
  targetEntity.use = newOnUse;
};

/*
---------------------------------------------------------
Set on think

Updates the current entity 'think' event handler.
This is run everytime time passes targetEntity.nextthink.

targetEntity: the entity to change the value for
newOnThink:   the function to apply
---------------------------------------------------------
*/
void(entity targetEntity, void() newOnThink) tbx_SetOnThink =
{
  targetEntity.think = newOnThink;
};

/*
--------------------------------------------------------------------------
Set on blocked

Updates the current entity 'blocked' event handler.
This is run everytime a moving brush is obstructed by an unmovable entity.

targetEntity: the entity to change the value for
newOnBlocked: the function to apply
--------------------------------------------------------------------------
*/
void(entity targetEntity, void() newOnBlocked) tbx_SetOnBlocked =
{
  targetEntity.blocked = newOnBlocked;
};

/*
-------------------------------------------------------------------------
Think start

Executes the current entity behavior on next ToolBlox default frame tick:
  float TBX_FRAMETICK = 0.1;

targetEntity: the entity to think
--------------------------------------------------------------------------
*/
void(entity targetEntity) tbx_ThinkStart =
{
  targetEntity.nextthink = time + TBX_FRAMETICK;
};

/*
---------------------------------------------------------------------
Think after

Executes the current entity behavior after the passed delay.

targetEntity: the entity to think
timeDelay:    the delay in seconds to apply (default tick if invalid)
---------------------------------------------------------------------
*/
void(entity targetEntity, float timeDelay) tbx_ThinkAfter =
{
  // TODO: Extract check to utility.
  if (timeDelay <= 0)
  {
    tbx_Error("WARNING: Invalid tbx_ThinkAfter delay.");
    return;
  }

  targetEntity.nextthink = time + timeDelay;
};

/*
---------------------------------------------------------------------
Think delay

Defers the current entity behavior by the passed delay.
Defers it at least by provided value from current time.

targetEntity: the entity to think
timeDelay:    the delay in seconds to apply (default tick if invalid)
---------------------------------------------------------------------
*/
void(entity targetEntity, float timeDelay) tbx_ThinkDelay =
{
  // TODO: Extract check to utility.
  if (timeDelay <= 0)
  {
    tbx_Error("WARNING: Invalid tbx_ThinkAfter delay.");
    return;
  }

  if (time > targetEntity.nextthink)
    targetEntity.nextthink = time;

  targetEntity.nextthink = targetEntity.nextthink + timeDelay;
};

/*
--------------------------------------------
Think end

Stops the current entity behavior execution.

targetEntity: the entity to stop thinking
--------------------------------------------
*/
void(entity targetEntity) tbx_ThinkEnd =
{
  targetEntity.nextthink = 0;
};

/*
-----------------------------------------------------------
Get ground

Returns entity serving as ground for the current entity.
Works when standing on world or a TBX_SOLIDTYPE_BOX entity.

sourceEntity: the entity to read the value from
-----------------------------------------------------------
*/
entity(entity sourceEntity) tbx_GetGround =
{
  return sourceEntity.groundentity;
};

/*
-----------------------------------------------
Get health

Returns the current entity health.

NOTE: Displayed on player HUD.

sourceEntity: the entity to read the value from
-----------------------------------------------
*/
float(entity sourceEntity) tbx_GetHealth =
{
  return sourceEntity.health;
};

/*
-----------------------------------------------------------------
Set health

Updates the current entity health.
If health <= 0 on a player, the engine switches to 'dead' screen.
Value is clamped between given minimum and maximum.
Health is rounded to higher integer.

targetEntity:  the entity to change the value for
newHealth:     health to set
minimumHealth: low cap
maximumHealth: high cap
-----------------------------------------------------------------
*/
void(
  entity targetEntity,
  float newHealth,
  float minimumHealth,
  float maximumHealth
) tbx_SetHealth =
{
  if (newHealth < minimumHealth)
    newHealth = minimumHealth;

  if (newHealth > maximumHealth)
    newHealth = maximumHealth;

  targetEntity.health = tbx_GetCeiling(newHealth);
};

/*
-----------------------------------------------------------------
Add health

Adjusts the current entity health by passed value.
If health <= 0 on a player, the engine switches to 'dead' screen.
Value is clamped between given minimum and maximum.
Health is rounded to higher integer.

targetEntity:  the entity to change the value for
addHealth:     health to add (can be negative)
minimumHealth: low cap
maximumHealth: high cap
-----------------------------------------------------------------
*/
void(
  entity targetEntity,
  float addHealth,
  float minimumHealth,
  float maximumHealth
) tbx_AddHealth =
{
  float newHealth = targetEntity.health + addHealth;

  if (newHealth < minimumHealth)
    newHealth = minimumHealth;

  if (newHealth > maximumHealth)
    newHealth = maximumHealth;

  targetEntity.health = tbx_GetCeiling(newHealth);
};

/*
-----------------------------------------------
Get frags

Returns the current entity frags.

sourceEntity: the entity to read the value from
-----------------------------------------------
*/
float(entity sourceEntity) tbx_GetFrags =
{
  return sourceEntity.frags;
};

/*
------------------------------------------------
Set frags

Updates the current entity frags.
Use this to reset frags to an initial value.
Rounds to nearest integer.

targetEntity: the entity to change the value for
newFrags:     the amount of frags to set
------------------------------------------------
*/
void(entity targetEntity, float newFrags) tbx_SetFrags =
{
  targetEntity.frags = tbx_GetRounded(newFrags);
};

/*
----------------------------------------------------------
Add frags

Adjusts the current entity frags.
Use this to add and remove frags during the game.
Rounds to nearest integer.

targetEntity: the entity to change the value for
newFrags:     the amount of frags to add (can be negative)
----------------------------------------------------------
*/
void(entity targetEntity, float addedFrags) tbx_AddFrags =
{
  targetEntity.frags = tbx_GetRounded(targetEntity.frags + addedFrags);
};

/*
--------------------------------------------------------
Get current weapon

Returns the current entity selected weapon flag:
  float TBX_WEAPONFLAG_SHOTGUN = 1;
  float TBX_WEAPONFLAG_DBSHOTGUN = 2;
  float TBX_WEAPONFLAG_NAILGUN = 4;
  float TBX_WEAPONFLAG_PERFORATOR = 8;
  float TBX_WEAPONFLAG_GRENADELAUNCHER = 16;
  float TBX_WEAPONFLAG_ROCKETLAUNCHER = 32;
  float TBX_WEAPONFLAG_THUNDERBOLT = 64;
  // This one is unused, define it as a MYMOD_ variable.
  // float TBX_WEAPONFLAG_SLOT9_UNUSED = 128;
  float TBX_WEAPONFLAG_AXE = 4096;

sourceEntity: the entity to read the value from
--------------------------------------------------------
*/
float(entity sourceEntity) tbx_GetCurrentWeapon =
{
  return sourceEntity.weapon;
};

/*
--------------------------------------------------
Set current weapon

Updates the current entity selected weapon flag:
  float TBX_WEAPONFLAG_SHOTGUN = 1;
  float TBX_WEAPONFLAG_DBSHOTGUN = 2;
  float TBX_WEAPONFLAG_NAILGUN = 4;
  float TBX_WEAPONFLAG_PERFORATOR = 8;
  float TBX_WEAPONFLAG_GRENADELAUNCHER = 16;
  float TBX_WEAPONFLAG_ROCKETLAUNCHER = 32;
  float TBX_WEAPONFLAG_THUNDERBOLT = 64;
  // This one is unused, define it as a MYMOD_ variable.
  // float TBX_WEAPONFLAG_SLOT9_UNUSED = 128;
  float TBX_WEAPONFLAG_AXE = 4096;

NOTE: Does NOT set ammo type.

targetEntity: the entity to change the value for
newWeapon:    the amount of frags to set
--------------------------------------------------
*/
void(entity targetEntity, float newWeapon) tbx_SetCurrentWeapon =
{
  targetEntity.weapon = newWeapon;
};

/*
-----------------------------------------------
Get shells

Returns the current entity shell count.

NOTE: Displayed on player HUD.

sourceEntity: the entity to read the value from
-----------------------------------------------
*/
float(entity sourceEntity) tbx_GetShells =
{
  return sourceEntity.ammo_shells;
};

/*
------------------------------------------------
Set shells

Updates the current entity shell count.

targetEntity: the entity to change the value for
newAmmo:      the amount of ammo to set
------------------------------------------------
*/
void(entity targetEntity, float newAmmo) tbx_SetShells =
{
  targetEntity.ammo_shells = newAmmo;
};

/*
-----------------------------------------------
Get nails

Returns the current entity nail count.

NOTE: Displayed on player HUD.

sourceEntity: the entity to read the value from
-----------------------------------------------
*/
float(entity sourceEntity) tbx_GetNails =
{
  return sourceEntity.ammo_nails;
};

/*
------------------------------------------------
Set nails

Updates the current entity nail count.

targetEntity: the entity to change the value for
newAmmo:      the amount of ammo to set
------------------------------------------------
*/
void(entity targetEntity, float newAmmo) tbx_SetNails =
{
  targetEntity.ammo_nails = newAmmo;
};

/*
-----------------------------------------------
Get rockets

Returns the current entity rocket count.

NOTE: Displayed on player HUD.

sourceEntity: the entity to read the value from
-----------------------------------------------
*/
float(entity sourceEntity) tbx_GetRockets =
{
  return sourceEntity.ammo_rockets;
};

/*
------------------------------------------------
Set rockets

Updates the current entity rocket count.

targetEntity: the entity to change the value for
newAmmo:      the amount of ammo to set
------------------------------------------------
*/
void(entity targetEntity, float newAmmo) tbx_SetRockets =
{
  targetEntity.ammo_rockets = newAmmo;
};

/*
-----------------------------------------------
Get cells

Returns the current entity cell count.

NOTE: Displayed on player HUD.

sourceEntity: the entity to read the value from
-----------------------------------------------
*/
float(entity sourceEntity) tbx_GetCells =
{
  return sourceEntity.ammo_cells;
};

/*
------------------------------------------------
Set cells

Updates the current entity cell count.

targetEntity: the entity to change the value for
newAmmo:      the amount of ammo to set
------------------------------------------------
*/
void(entity targetEntity, float newAmmo) tbx_SetCells =
{
  targetEntity.ammo_cells = newAmmo;
};

/*
---------------------------------------------------------------------
Get items

Returns the current entity item inventory flagset:
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

NOTE: These are displayed in HUD.

sourceEntity: the entity to read the value from
---------------------------------------------------------------------
*/
float(entity sourceEntity) tbx_GetItems =
{
  return sourceEntity.items;
};

/*
---------------------------------------------------------------------
Set items

Updates the current entity item inventory flagset:
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

Use 'tbx_flags.qc' functions to manage this more efficiently.

NOTE: Displayed in HUD.

targetEntity: the entity to change the value for
newItems:     the item flagset to apply
---------------------------------------------------------------------
*/
void(entity targetEntity, float newItems) tbx_SetItems =
{
  targetEntity.items = newItems;
};

/*
--------------------------------------------------------------------------
Get vulnerability

Returns the current entity vulnerability type:
  float TBX_VULNERABILITY_OFF = 0; // Does not take damage
  float TBX_VULNERABILITY_HIT = 1; // Projectile and blast damage
  float TBX_VULNERABILITY_ALL = 2; // Projectile, blast and grenade damage

sourceEntity: the entity to read the value from
--------------------------------------------------------------------------
*/
float(entity sourceEntity) tbx_GetVulnerability =
{
  return sourceEntity.takedamage;
};

/*
--------------------------------------------------------------------------
Set vulnerability

Updates the current entity vulnerability type:
  float TBX_VULNERABILITY_OFF = 0; // Does not take damage
  float TBX_VULNERABILITY_HIT = 1; // Projectile and blast damage
  float TBX_VULNERABILITY_ALL = 2; // Projectile, blast and grenade damage

targetEntity: the entity to change the value for
newType:      the type to set
--------------------------------------------------------------------------
*/
void(entity targetEntity, float newType) tbx_SetVulnerability =
{
  targetEntity.takedamage = newType;
};

/*
----------------------------------------------------------------------------
Get next in radius

Returns the current entity sequel in current radius chain.

NOTE: Use this right after tbx_FindEntitiesInRadius, to avoid using obsolete
      radius chains.

sourceEntity: the entity to read the value from
----------------------------------------------------------------------------
*/
entity(entity sourceEntity) tbx_GetNextInRadius =
{
  return sourceEntity.chain;
};

/*
-----------------------------------------------------
Get vitals

Returns the current entity vital state:
  float TBX_VITALS_ALIVE = 0; // Functioning
  float TBX_VITALS_DYING = 1; // Dropping dead
  float TBX_VITALS_DEAD = 2;  // Static corpse
  float TBX_VITALS_OUT = 3;   // Ready for respawn

sourceEntity: the entity to read the value from
-----------------------------------------------------
*/
float(entity sourceEntity) tbx_GetVitals =
{
  return sourceEntity.deadflag;
};

/*
-----------------------------------------------------
Set vitals

Updates the current entity vital state:
  float TBX_VITALS_ALIVE = 0; // Functioning
  float TBX_VITALS_DYING = 1; // Dropping dead
  float TBX_VITALS_DEAD = 2;  // Static corpse
  float TBX_VITALS_OUT = 3;   // Ready for respawn

targetEntity: the entity to change the value for
newVitals: vital state to set
-----------------------------------------------------
*/
void(entity targetEntity, float newVitals) tbx_SetVitals =
{
  targetEntity.deadflag = newVitals;
};

/*
---------------------------------------------------------------
Get eye position

Returns the current entity eye position relative to its origin.

sourceEntity: the entity to read the value from
---------------------------------------------------------------
*/
vector(entity sourceEntity) tbx_GetEyePosition =
{
  return sourceEntity.view_ofs;
};

/*
---------------------------------------------------------------
Set eye position

Updates the current entity eye position relative to its origin.
Used as camera position for players.
E.g.:
  vector MYMOD_PLAYER_EYEPOSITION = '0 0 22';

targetEntity: the entity to change the value for
newPosition:  eye position to set
---------------------------------------------------------------
*/
void(entity targetEntity, vector newPosition) tbx_SetEyePosition =
{
  targetEntity.view_ofs = newPosition;
};

/*
-------------------------------------------------------------------
Check inputs

Returns the current entity controller input activities in a vector:
  _x: Attack input
  _y: Use input (unused)
  _z: Jump input

TRUE means the input is active.

sourceEntity: the entity to read the value from
-------------------------------------------------------------------
*/
vector(entity sourceEntity) tbx_CheckInputs =
{
  local vector inputs = '0 0 0';

  inputs_x = sourceEntity.button0;
  inputs_y = sourceEntity.button1;
  inputs_z = sourceEntity.button2;

  return inputs;
};

/*
------------------------------------------------------
Clear inputs

Unsets the current entity controller input activities.

targetEntity: the entity to change the value for
------------------------------------------------------
*/
void(entity targetEntity) tbx_ClearInputs =
{
  targetEntity.button0 = FALSE;
  targetEntity.button1 = FALSE;
  targetEntity.button2 = FALSE;
};

/*
--------------------------------------------------
Clear attack

Unsets the current entity controller input attack.

targetEntity: the entity to change the value for
--------------------------------------------------
*/
void(entity targetEntity) tbx_ClearAttack =
{
  targetEntity.button0 = FALSE;
};

/*
------------------------------------------------
Clear use

Unsets the current entity controller input use.

targetEntity: the entity to change the value for
------------------------------------------------
*/
void(entity targetEntity) tbx_ClearUse =
{
  targetEntity.button1 = FALSE;
};

/*
------------------------------------------------
Clear jump

Unsets the current entity controller input jump.

targetEntity: the entity to change the value for
------------------------------------------------
*/
void(entity targetEntity) tbx_ClearJump =
{
  targetEntity.button2 = FALSE;
};

/*
------------------------------------------------
Force attack

Sets the current entity controller input attack.

targetEntity: the entity to change the value for
------------------------------------------------
*/
void(entity targetEntity) tbx_ForceAttack =
{
  targetEntity.button0 = TRUE;
};

/*
------------------------------------------------
Force use

Sets the current entity controller input use.

targetEntity: the entity to change the value for
------------------------------------------------
*/
void(entity targetEntity) tbx_ForceUse =
{
  targetEntity.button1 = TRUE;
};

/*
------------------------------------------------
Force jump

Sets the current entity controller input jump.

targetEntity: the entity to change the value for
------------------------------------------------
*/
void(entity targetEntity) tbx_ForceJump =
{
  targetEntity.button2 = TRUE;
};

/*
----------------------------------------------------------
Get impulse

Returns the current entity impulse.

NOTE: Impulses are console commands interpreted by QuakeC.

sourceEntity: the entity to read the value from
----------------------------------------------------------
*/
float(entity sourceEntity) tbx_GetImpulse =
{
  return sourceEntity.impulse;
};

/*
----------------------------------------------------------
Clear impulse

Unsets the current entity impulse.

NOTE: Impulses are console commands interpreted by QuakeC.

targetEntity: the entity to change the value for
----------------------------------------------------------
*/
void(entity targetEntity) tbx_ClearImpulse =
{
  targetEntity.impulse = 0;
};

/*
----------------------------------------------------------
Set impulse

Updates the current entity impulse.

NOTE: Impulses are console commands interpreted by QuakeC.

targetEntity: the entity to change the value for
newImpulse: impulse value to set
----------------------------------------------------------
*/
void(entity targetEntity, float newImpulse) tbx_SetImpulse =
{
  targetEntity.impulse = newImpulse;
};

/*
-----------------------------------------------------------------------------
Snap orientation

Snap angle to value on the next frame without animation or tweening.
Use for e.g. teleportation or switching cameras for cutscene or intermission.

targetEntity: the entity to snap
-----------------------------------------------------------------------------
*/
void(entity targetEntity) tbx_SnapOrientation =
{
  targetEntity.fixangle = TRUE;
};

/*
---------------------------------------------------------------
Get view orientation

Returns the current entity view or aim orientation.

sourceEntity: the entity to read the value from
---------------------------------------------------------------
*/
vector(entity sourceEntity) tbx_GetViewOrientation =
{
  return sourceEntity.v_angle;
};

/*
---------------------------------------------------------------
Set view orientation

Updates the current entity view or aim orientation.

targetEntity: the entity to change the value for
newAngle:     orientation to set
---------------------------------------------------------------
*/
void(entity targetEntity, vector newAngle) tbx_SetViewOrientation =
{
  targetEntity.v_angle = newAngle;
};

/*
------------------------------------------------------------------
Get ideal pitch

Returns the current entity ideal pitch to look up or down a slope.
Usable for Doom-style auto-aim feature.

NOTE: Unused in original progs, probably set by the engine.

sourceEntity: the entity to read the value from
------------------------------------------------------------------
*/
float(entity sourceEntity) tbx_GetIdealPitch =
{
  return sourceEntity.idealpitch;
};

/*
------------------------------------------------
Get display name

Returns the current entity display name.
E.g.: "Ogre", "Player", "Rocket Launcher".

sourceEntity: the entity to read the value from
------------------------------------------------
*/
string(entity sourceEntity) tbx_GetDisplayName =
{
  return sourceEntity.netname;
};

/*
------------------------------------------------
Set display name

Sets the current entity display name.

NOTE: This is the player's multiplayer nickname.

targetEntity: the entity to change the value for
newName:      the new display name to set
------------------------------------------------
*/
void(entity targetEntity, string newName) tbx_SetDisplayName =
{
  targetEntity.netname = newName;
};

/*
-----------------------------------------------
Get enemy

Returns the enemy entity of the current entity.

sourceEntity: the entity to read the value from
-----------------------------------------------
*/
entity(entity sourceEntity) tbx_GetEnemy =
{
  return sourceEntity.enemy;
};

/*
----------------------------------------------------
Set enemy

Sets the enemy entity of the current entity.

NOTE: Used by engine for 'step' movement collisions.

targetEntity: the entity to change the value for
newEnemy:     the new enemy to set
----------------------------------------------------
*/
void(entity targetEntity, entity newEnemy) tbx_SetEnemy =
{
  targetEntity.enemy = newEnemy;
};

/*
-----------------------------------------------
Get move flags

Returns the current entity movement flags:
  float TBX_FLAG_MOVE_FLY = 1;
  float TBX_FLAG_MOVE_SWIM = 2;
  float TBX_FLAG_MOVE_ALL = 3;

sourceEntity: the entity to read the value from
-----------------------------------------------
*/
float(entity sourceEntity) tbx_GetMoveFlags =
{
  local float moveFlags = sourceEntity.flags & TBX_FLAG_MOVE_ALL;

  return moveFlags;
};

/*
------------------------------------------------
Set move flags

Updates the current entity movement flags:
  float TBX_FLAG_MOVE_FLY = 1;
  float TBX_FLAG_MOVE_SWIM = 2;
  float TBX_FLAG_MOVE_ALL = 3;

NOTE: This setter pre-filters the flagset.

targetEntity: the entity to change the value for
newFlags:     new movement flags
------------------------------------------------
*/
void(entity targetEntity, float newFlags) tbx_SetMoveFlags =
{
  // keep only move flags
  local float moveFlags = newFlags & TBX_FLAG_MOVE_ALL;

  targetEntity.flags = (
    tbx_RemoveFlags(targetEntity.flags, TBX_FLAG_MOVE_ALL) + moveFlags
  );
};

/*
-----------------------------------------------
Get role flags

Returns the current entity role flags:
  float TBX_FLAG_ROLE_PLAYER = 8;
  float TBX_FLAG_ROLE_NPC = 32;
  float TBX_FLAG_ROLE_ALL = 40;

sourceEntity: the entity to read the value from
-----------------------------------------------
*/
float(entity sourceEntity) tbx_GetRoleFlags =
{
  local float roleFlags = sourceEntity.flags & TBX_FLAG_ROLE_ALL;

  return roleFlags;
};

/*
------------------------------------------------
Set role flags

Updates the current entity role flags:
  float TBX_FLAG_ROLE_PLAYER = 8;
  float TBX_FLAG_ROLE_NPC = 32;
  float TBX_FLAG_ROLE_ALL = 40;

NOTE: This setter pre-filters the flagset.

targetEntity: the entity to change the value for
newFlags:     new role flags
------------------------------------------------
*/
void(entity targetEntity, float newFlags) tbx_SetRoleFlags =
{
  // keep only role flags
  local float roleFlags = newFlags & TBX_FLAG_ROLE_ALL;

  targetEntity.flags = (
    tbx_RemoveFlags(targetEntity.flags, TBX_FLAG_ROLE_ALL) + roleFlags
  );
};

/*
-----------------------------------------------
Get position flags

Returns the current entity position flags:
  float TBX_FLAG_POSITION_WATER = 16;
  float TBX_FLAG_POSITION_GROUND = 512;
  float TBX_FLAG_POSITION_EDGE = 1024;
  float TBX_FLAG_POSITION_ANYGROUND = 1536;
  float TBX_FLAG_POSITION_ALL = 1552;

sourceEntity: the entity to read the value from
-----------------------------------------------
*/
float(entity sourceEntity) tbx_GetPositionFlags =
{
  local float positionFlags = sourceEntity.flags & TBX_FLAG_POSITION_ALL;

  return positionFlags;
};

/*
------------------------------------------------
Set position flags

Updates the current entity position flags:
  float TBX_FLAG_POSITION_WATER = 16;
  float TBX_FLAG_POSITION_GROUND = 512;
  float TBX_FLAG_POSITION_EDGE = 1024;
  float TBX_FLAG_POSITION_ANYGROUND = 1536;
  float TBX_FLAG_POSITION_ALL = 1552;

NOTE: This setter pre-filters the flagset.

targetEntity: the entity to change the value for
newFlags:     new position flags
------------------------------------------------
*/
void(entity targetEntity, float newFlags) tbx_SetPositionFlags =
{
  // keep only position flags
  local float positionFlags = newFlags & TBX_FLAG_POSITION_ALL;

  targetEntity.flags = (
    tbx_RemoveFlags(targetEntity.flags, TBX_FLAG_POSITION_ALL) + positionFlags
  );
};

/*
-----------------------------------------------
Get cheat flags

Returns the current entity cheat flags:
  float TBX_FLAG_CHEAT_GOD = 64;
  float TBX_FLAG_CHEAT_NOTARGET = 128;
  float TBX_FLAG_CHEAT_ALL = 192;

sourceEntity: the entity to read the value from
-----------------------------------------------
*/
float(entity sourceEntity) tbx_GetCheatFlags =
{
  local float cheatFlags = sourceEntity.flags & TBX_FLAG_CHEAT_ALL;

  return cheatFlags;
};

/*
------------------------------------------------
Set cheat flags

Updates the current entity cheat flags:
  float TBX_FLAG_CHEAT_GOD = 64;
  float TBX_FLAG_CHEAT_NOTARGET = 128;
  float TBX_FLAG_CHEAT_ALL = 192;

NOTE: This setter pre-filters the flagset.

targetEntity: the entity to change the value for
newFlags:     new cheat flags
------------------------------------------------
*/
void(entity targetEntity, float newFlags) tbx_SetCheatFlags =
{
  // keep only cheat flags
  local float cheatFlags = newFlags & TBX_FLAG_CHEAT_ALL;

  targetEntity.flags = (
    tbx_RemoveFlags(targetEntity.flags, TBX_FLAG_CHEAT_ALL) + cheatFlags
  );
};

/*
-----------------------------------------------
Get item flags

Returns the current entity item flags:
  float TBX_FLAG_ITEM_WIDE = 256;

sourceEntity: the entity to read the value from
-----------------------------------------------
*/
float(entity sourceEntity) tbx_GetItemFlags =
{
  local float itemFlags = sourceEntity.flags & TBX_FLAG_ITEM_WIDE;

  return itemFlags;
};

/*
------------------------------------------------
Set item flags

Updates the current entity item flags:
  float TBX_FLAG_ITEM_WIDE = 256;

NOTE: This setter pre-filters the flagset.

targetEntity: the entity to change the value for
newFlags:     new item flags
------------------------------------------------
*/
void(entity targetEntity, float newFlags) tbx_SetItemFlags =
{
  // keep only item flags
  local float itemFlags = newFlags & TBX_FLAG_ITEM_WIDE;

  targetEntity.flags = (
    tbx_RemoveFlags(targetEntity.flags, TBX_FLAG_ITEM_WIDE) + itemFlags
  );
};

/*
------------------------------------------------------------------------------
Get action flags

Returns the current entity action flags:
  float TBX_FLAG_ACTION_WATEREXIT = 2048;    // Jumping from water at ledge
  float TBX_FLAG_ACTION_JUMPRELEASED = 4096; // Jump button released
  float TBX_FLAG_ACTION_ALL = 6144;          // Vaulting ledge without jumping

sourceEntity: the entity to read the value from

NOTE: TBX_FLAG_ACTION_WATEREXIT is used by the engine to alter physics.
------------------------------------------------------------------------------
*/
float(entity sourceEntity) tbx_GetActionFlags =
{
  local float actionFlags = sourceEntity.flags & TBX_FLAG_ACTION_ALL;

  return actionFlags;
};

/*
------------------------------------------------------------------------------
Set action flags

Updates the current entity action flags:
  float TBX_FLAG_ACTION_WATEREXIT = 2048;    // Jumping from water at ledge
  float TBX_FLAG_ACTION_JUMPRELEASED = 4096; // Jump button released
  float TBX_FLAG_ACTION_ALL = 6144;          // Vaulting ledge without jumping

NOTE: This setter pre-filters the flagset.

targetEntity: the entity to change the value for
newFlags:     new action flags
------------------------------------------------------------------------------
*/
void(entity targetEntity, float newFlags) tbx_SetActionFlags =
{
  // keep only action flags
  local float actionFlags = newFlags & TBX_FLAG_ACTION_ALL;

  targetEntity.flags = (
    tbx_RemoveFlags(targetEntity.flags, TBX_FLAG_ACTION_ALL) | actionFlags
  );
};

/*
----------------------------------------------------------------
Get shirt color index

Returns the current entity shirt color index:
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

NOTE: Many popular sourceports don't support colors on corpses.

sourceEntity: the entity to read the value from
----------------------------------------------------------------
*/
float(entity sourceEntity) tbx_GetShirtColorIndex =
{
  return sourceEntity.colormap;
};

/*
----------------------------------------------------------------
Set shirt color index

Updates the current entity shirt color index:
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

NOTE: Many popular sourceports don't support colors on corpses.

targetEntity: the entity to change the value for
newColor:     new color
----------------------------------------------------------------
*/
void(entity targetEntity, float newColor) tbx_SetShirtColorIndex =
{
  targetEntity.colormap = newColor;
};

/*
-------------------------------------------------------------------
Get team color index

Returns the current entity pants/team color index:
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

NOTE: Many popular sourceports don't support colors on corpses.

sourceEntity: the entity to read the value from
-------------------------------------------------------------------
*/
float(entity sourceEntity) tbx_GetPantsColorIndex =
{
  return sourceEntity.team;
};

/*
-------------------------------------------------------------------
Set team color index

Updates the current entity pants/team color index:
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

NOTE: Many popular sourceports don't support colors on corpses.

targetEntity: the entity to change the value for
newColor:     new color
-------------------------------------------------------------------
*/
void(entity targetEntity, float newColor) tbx_SetPantsColorIndex =
{
  targetEntity.team = newColor;
};

/*
-----------------------------------------------
Get max health

Returns the current entity health cap.

sourceEntity: the entity to read the value from
-----------------------------------------------
*/
float(entity sourceEntity) tbx_GetMaxHealth =
{
  return sourceEntity.max_health;
};

/*
------------------------------------------------
Set max health

Updates the current entity health cap.

targetEntity: the entity to change the value for
newHealth:    new health cap
------------------------------------------------
*/
void(entity targetEntity, float newHealth) tbx_SetMaxHealth =
{
  targetEntity.max_health = newHealth;
};

/*
-------------------------------------------------------
Get toss end time

Returns the current entity action inertia time.
Used by the engine when leaping out of water at ledges.

sourceEntity: the entity to read the value from
-------------------------------------------------------
*/
float(entity sourceEntity) tbx_GetTossEndTime =
{
  return sourceEntity.teleport_time;
};

/*
-------------------------------------------------------
Set toss end time

Updates the current entity action inertia time.
Used by the engine when leaping out of water at ledges.

targetEntity: the entity to change the value for
newTime:      new toss end time
-------------------------------------------------------
*/
void(entity targetEntity, float newTime) tbx_SetTossEndTime =
{
  targetEntity.teleport_time = newTime;
};

/*
----------------------------------------------------------------
Get armor protection

Returns the current entity armor protection:
  float TBX_ARMORTYPE_NONE = 0;
  float TBX_ARMORTYPE_LIGHT = 0.3;
  float TBX_ARMORTYPE_STANDARD = 0.6;
  float TBX_ARMORTYPE_HEAVY = 0.8;

NOTE: Also see STOREDVALUE_ARMORTYPE for carrying between maps.
      Icon state is carried separately in STOREDVALUE_ITEMFLAGS.

sourceEntity: the entity to read the value from
----------------------------------------------------------------
*/
float(entity sourceEntity) tbx_GetArmorProtection =
{
  return sourceEntity.armortype;
};

/*
----------------------------------------------------------------
Set armor protection

Updates the current entity armor protection:
  float TBX_ARMORTYPE_NONE = 0;
  float TBX_ARMORTYPE_LIGHT = 0.3;
  float TBX_ARMORTYPE_STANDARD = 0.6;
  float TBX_ARMORTYPE_HEAVY = 0.8;

NOTE: Also see STOREDVALUE_ARMORTYPE for carrying between maps.
      Icon state is carried separately in STOREDVALUE_ITEMFLAGS.

targetEntity:  the entity to change the value for
newProtection: new armor protection
----------------------------------------------------------------
*/
void(entity targetEntity, float newProtection) tbx_SetArmorProtection =
{
  targetEntity.armortype = newProtection;
};

/*
-----------------------------------------------
Get armor

Returns the current entity armor durability.

E.g.:
  float MYMOD_ARMOR_NONE = 0;
  float MYMOD_ARMOR_LIGHT = 100;
  float MYMOD_ARMOR_STANDARD = 150;
  float MYMOD_ARMOR_HEAVY = 200;

sourceEntity: the entity to read the value from
-----------------------------------------------
*/
float(entity sourceEntity) tbx_GetArmor =
{
  return sourceEntity.armorvalue;
};

/*
------------------------------------------------
Set armor

Updates the current entity armor durability.

E.g.:
  float MYMOD_ARMOR_NONE = 0;
  float MYMOD_ARMOR_LIGHT = 100;
  float MYMOD_ARMOR_STANDARD = 150;
  float MYMOD_ARMOR_HEAVY = 200;

targetEntity: the entity to change the value for
newDurability: new armor durability
------------------------------------------------
*/
void(entity targetEntity, float newDurability) tbx_SetArmor =
{
  targetEntity.armorvalue = newDurability;
};

/*
------------------------------------------------
Get liquid level

Returns the current entity submersion in liquid:
  float TBX_SUBMERSION_DRY = 0;
  float TBX_SUBMERSION_KNEE = 1;
  float TBX_SUBMERSION_WAIST = 2;
  float TBX_SUBMERSION_EYE = 3;

sourceEntity: the entity to read the value from
------------------------------------------------
*/
float(entity sourceEntity) tbx_GetSubmersion =
{
  return sourceEntity.waterlevel;
};

/*
---------------------------------------------------------------------------
Get environment type

Returns the current entity environment pointcontent:
  float TBX_POINTCONTENT_EMPTY = -1; // Empty (air)
  float TBX_POINTCONTENT_SOLID = -2; // Solid (wall)
  float TBX_POINTCONTENT_WATER = -3; // Water (swim)
  float TBX_POINTCONTENT_SLIME = -4; // Slime (swim, low damage)
  float TBX_POINTCONTENT_LAVA = -5;  // Lava (swim, high frequent damage)
  float TBX_POINTCONTENT_SKY = -6;   // Sky (wall, despawns projectiles)

sourceEntity: the entity to read the value from
---------------------------------------------------------------------------
*/
float(entity sourceEntity) tbx_GetEnvironmentType =
{
  return sourceEntity.watertype;
};

/*
---------------------------------------------------------------------------
Force environment type

Updates the current entity environment pointcontent for this frame:
  float TBX_POINTCONTENT_EMPTY = -1; // Empty (air)
  float TBX_POINTCONTENT_SOLID = -2; // Solid (wall)
  float TBX_POINTCONTENT_WATER = -3; // Water (swim)
  float TBX_POINTCONTENT_SLIME = -4; // Slime (swim, low damage)
  float TBX_POINTCONTENT_LAVA = -5;  // Lava (swim, high frequent damage)
  float TBX_POINTCONTENT_SKY = -6;   // Sky (wall, despawns projectiles)

NOTE: Set by engine.

targetEntity: the entity to change the value for
newContentType: new point content type
---------------------------------------------------------------------------
*/
void(entity targetEntity, float newContentType) tbx_ForceEnvironmentType =
{
  targetEntity.watertype = newContentType;
};



/*
==================================================
ToolBlox entity functions

Utility functions to efficiently compose entities.

Please do not change these.
==================================================
*/

