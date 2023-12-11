/*
==============================================================================

ToolBlox ray-tracing functions

Functions responsible for ray-tracing checks.

==============================================================================
*/



/*
===========================
Engine API functions

Please do not change these.
===========================
*/

/*
--------------------------------------------------------------------
Trace ray

Casts a collision ray from start point to end point.
Extracts trace information into globals:
  - trace_allsolid
  - trace_startsolid
  - trace_fraction
  - trace_endpos
  - trace_plane_normal
  - trace_plane_dist
  - trace_ent
  - trace_inopen
  - trace_inwater

The input params are cached in these globals:
  */ vector tbx_trace_lastStartPoint; /*
  */ vector tbx_trace_lastEndPoint; /*
  */ float tbx_trace_lastMonsterCheck; /*
  */ entity tbx_trace_lastSourceEntity; /*
If these all match, the trace will not be recalculated.
When recalculating, the function sets */ float tbx_trace_retrace; /*
to FALSE. Use tbx_Retrace() to set it to TRUE and trigger.

startPoint:   source point (defaults to eye position)
endPoint:     destination point (defaults to enemy eye position)
monsterCheck:
  float TBX_MONSTERCHECK_HIT = 0;      // hit monsters (default)
  float TBX_MONSTERCHECK_SKIP = 1;     // skip monsters
  float TBX_MONSTERCHECK_HIT_WIDE = 2; // hit monsters more easily
sourceEntity: entity, its owner and owned entities to ignore
              (defaults to self)
--------------------------------------------------------------------
*/
void(
  vector startPoint,
  vector endPoint,
  float monsterCheck,
  entity sourceEntity
) tbx_TraceRay =
{
  local float doCalculation;

  doCalculation = tbx_trace_retrace;

  if (startPoint != tbx_trace_lastStartPoint)
    doCalculation = TRUE;

  if (endPoint != tbx_trace_lastEndPoint)
    doCalculation = TRUE;

  if (monsterCheck != tbx_trace_lastMonsterCheck)
    doCalculation = TRUE;

  if (sourceEntity != tbx_trace_lastSourceEntity)
    doCalculation = TRUE;

  if (doCalculation)
  {
    tbx_trace_lastStartPoint = startPoint;
    tbx_trace_lastEndPoint = endPoint;
    tbx_trace_lastMonsterCheck = monsterCheck;
    tbx_trace_lastSourceEntity = sourceEntity;
    tbx_trace_retrace = FALSE;
    _16(startPoint, endPoint, monsterCheck, sourceEntity);
  }
};



/*
=======================================================================
Engine utility functions

Utility functions to safely manipulate engine-related game state.
For more information, consult the relevant id_core/id_engine.txt entry.

Please do not change these.
=======================================================================
*/

/*
------------------------------------------------------------------------------
Retrace

Forces re-calculation for the next tbx_TraceRay() call.
Ensures that the next batch of trace-checks will be independent, even if their
inputs are identical.

NOTE: You should start each independent batch of GetTrace*() check with this.
------------------------------------------------------------------------------
*/
void() tbx_Retrace =
{
  tbx_trace_retrace = TRUE;
};

/*
------------------------------------------------------------------
Get trace solid flags

Returns an evaluation of the trace crossing solids:
  float TBX_TRACEFLAG_SOLID_ALL = 1;
  float TBX_TRACEFLAG_SOLID_START = 2;
  float TBX_TRACEFLAG_SOLID_END = 4;   // (experimental)

startPoint:   source point (defaults to eye position)
endPoint:     destination point (defaults to enemy eye position)
monsterCheck:
  float TBX_MONSTERCHECK_HIT = 0;      // hit monsters (default)
  float TBX_MONSTERCHECK_SKIP = 1;     // skip monsters
  float TBX_MONSTERCHECK_HIT_WIDE = 2; // hit monsters more easily
sourceEntity: entity, its owner and owned entities to ignore
              (defaults to self)
------------------------------------------------------------------
*/
float(
  vector startPoint,
  vector endPoint,
  float monsterCheck,
  entity sourceEntity
) tbx_GetTraceSolidFlags =
{
  local float solidFlags;

  solidFlags = 0;
  tbx_TraceRay(startPoint, endPoint, monsterCheck, sourceEntity);

  if (trace_allsolid)
    solidFlags = solidFlags & TBX_TRACEFLAG_SOLID_ALL;

  if (trace_startsolid)
    solidFlags = solidFlags & TBX_TRACEFLAG_SOLID_START;

  // experimental feature, not guaranteed to work as expected
  if (tbx_PointContent(trace_endpos) == (TBX_POINTCONTENT_SOLID | TBX_POINTCONTENT_SKY))
    solidFlags = solidFlags & TBX_TRACEFLAG_SOLID_END;

  return solidFlags;
};

/*
-------------------------------------------------------------------
Get trace distances

Returns an evaluation of distance covered by the trace in a vector:
  _x: fraction of distance covered until collision
  _y: distance covered in units
  _z: distance remaining in units

startPoint:   source point (defaults to eye position)
endPoint:     destination point (defaults to enemy eye position)
monsterCheck:
  float TBX_MONSTERCHECK_HIT = 0;      // hit monsters (default)
  float TBX_MONSTERCHECK_SKIP = 1;     // skip monsters
  float TBX_MONSTERCHECK_HIT_WIDE = 2; // hit monsters more easily
sourceEntity: entity, its owner and owned entities to ignore
              (defaults to self)
-------------------------------------------------------------------
*/
vector(
  vector startPoint,
  vector endPoint,
  float monsterCheck,
  entity sourceEntity
) tbx_GetTraceDistances =
{
  local vector distanceData;

  tbx_TraceRay(startPoint, endPoint, monsterCheck, sourceEntity);
  distanceData_x = trace_fraction;
  distanceData_y = trace_plane_dist;
  distanceData_z = tbx_GetVectorLength(endPoint - startPoint) - trace_plane_dist;

  return distanceData;
};

/*
---------------------------------------------------------------------
Get trace end point

Returns the point where the trace stopped.
Matches the input end point if the trace completed without collision.

startPoint:   source point (defaults to eye position)
endPoint:     destination point (defaults to enemy eye position)
monsterCheck:
  float TBX_MONSTERCHECK_HIT = 0;      // hit monsters (default)
  float TBX_MONSTERCHECK_SKIP = 1;     // skip monsters
  float TBX_MONSTERCHECK_HIT_WIDE = 2; // hit monsters more easily
sourceEntity: entity, its owner and owned entities to ignore
              (defaults to self)
---------------------------------------------------------------------
*/
vector(
  vector startPoint,
  vector endPoint,
  float monsterCheck,
  entity sourceEntity
) tbx_GetTraceEndPoint =
{
  tbx_TraceRay(startPoint, endPoint, monsterCheck, sourceEntity);

  return trace_endpos;
};

/*
------------------------------------------------------------------
Get trace collision entity

Returns the entity that the trace hit.
Returns world if the trace completed without collision.

startPoint:   source point (defaults to eye position)
endPoint:     destination point (defaults to enemy eye position)
monsterCheck:
  float TBX_MONSTERCHECK_HIT = 0;      // hit monsters (default)
  float TBX_MONSTERCHECK_SKIP = 1;     // skip monsters
  float TBX_MONSTERCHECK_HIT_WIDE = 2; // hit monsters more easily
sourceEntity: entity, its owner and owned entities to ignore
              (defaults to self)
------------------------------------------------------------------
*/
entity(
  vector startPoint,
  vector endPoint,
  float monsterCheck,
  entity sourceEntity
) tbx_GetTraceCollisionEntity =
{
  tbx_TraceRay(startPoint, endPoint, monsterCheck, sourceEntity);

  return trace_ent;
};

/*
------------------------------------------------------------------
Get trace collision normal

Returns the reflection normal vector for the plane the trace hit.

startPoint:   source point (defaults to eye position)
endPoint:     destination point (defaults to enemy eye position)
monsterCheck:
  float TBX_MONSTERCHECK_HIT = 0;      // hit monsters (default)
  float TBX_MONSTERCHECK_SKIP = 1;     // skip monsters
  float TBX_MONSTERCHECK_HIT_WIDE = 2; // hit monsters more easily
sourceEntity: entity, its owner and owned entities to ignore
              (defaults to self)
------------------------------------------------------------------
*/
vector(
  vector startPoint,
  vector endPoint,
  float monsterCheck,
  entity sourceEntity
) tbx_GetTraceCollisionNormal =
{
  tbx_TraceRay(startPoint, endPoint, monsterCheck, sourceEntity);

  return trace_plane_normal;
};

/*
----------------------------------------------------------------------
Get trace pass flags

Returns an evaluation of the trace crossing non-solid content volumes:
  float TBX_TRACEFLAG_PASS_AIR = 1;
  float TBX_TRACEFLAG_PASS_LIQUID = 2;
  float TBX_TRACEFLAG_PASS_MIXED = 3;  // (shorthand for checks)

startPoint:   source point (defaults to eye position)
endPoint:     destination point (defaults to enemy eye position)
monsterCheck:
  float TBX_MONSTERCHECK_HIT = 0;      // hit monsters (default)
  float TBX_MONSTERCHECK_SKIP = 1;     // skip monsters
  float TBX_MONSTERCHECK_HIT_WIDE = 2; // hit monsters more easily
sourceEntity: entity, its owner and owned entities to ignore
              (defaults to self)
----------------------------------------------------------------------
*/
float(
  vector startPoint,
  vector endPoint,
  float monsterCheck,
  entity sourceEntity
) tbx_GetTracePassFlags =
{
  local float passFlags;

  passFlags = 0;
  tbx_TraceRay(startPoint, endPoint, monsterCheck, sourceEntity);

  if (trace_inopen)
    passFlags = passFlags & TBX_TRACEFLAG_PASS_AIR;

  if (trace_inwater)
    passFlags = passFlags & TBX_TRACEFLAG_PASS_LIQUID;

  return passFlags;
};