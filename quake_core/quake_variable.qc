/*
==============================================================================

Quake variables

Pre-emptive variable definitions for global referencing.

==============================================================================
*/



/*
==========
Quake Core
==========
*/

/*
-------------
quake_core.qc
-------------
*/
float quake_tick;     // next 0.2 seconds, global
float quake_second;   // next 1.0 second, global
float quake_3Seconds; // next 3.0 seconds, global

/*
---------------
quake_entity.qc
---------------
*/
.vector quake_oldVelocity; // previous velocity
.vector quake_soakTypes;   // content-type at knee, waist and eye level
.float quake_flags;        // entity-specific custom flags
.float quake_supply;       // a supplied resource, e.g. oxygen or item content
// Proposed:
// .float quake_variant;      // entity-specific variant (integer or flags)