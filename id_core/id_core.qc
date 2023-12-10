/*
=======================================

id Software legacy engine API functions

Please do not change these.

=======================================
*/



void(vector ang) makevectors =
{
  tbx_PrintDeprecation("makevectors", "tbx_ProduceRelativeUnitVectors");
  _1(ang);
};

void(entity e, vector o) setorigin =
{
  tbx_PrintDeprecation("setorigin", "tbx_SetOrigin");
  _2(e, o);
};

void(entity e, string m) setmodel =
{
  tbx_PrintDeprecation("setmodel", "tbx_SetModel");
  _3(e, m);
};

void(entity e, vector min, vector max) setsize =
{
  tbx_PrintDeprecation("setsize", "tbx_SetBounds");
  _4(e, min, max);
};

void() break = #6;

float() random =
{
  tbx_PrintDeprecation("random", "tbx_GetRandomFloat");
  return _7();
};

void(entity e, float chan, string samp, float vol, float atten) sound =
{
  tbx_PrintDeprecation("sound", "tbx_PlaySound");
  _8(e, chan, samp, vol, atten);
};

vector(vector v) normalize =
{
  tbx_PrintDeprecation("normalize", "tbx_GetUnitVector");
  return _9(v);
};

void(string e) error =
{
  tbx_PrintDeprecation("error", "tbx_Error");
  _10(e);
};

void(string e) objerror =
{
  tbx_PrintDeprecation("objerror", "tbx_EntityError");
  _11(e);
};

float(vector v) vlen =
{
  tbx_PrintDeprecation("vlen", "tbx_GetVectorLength");
  return _12(v);
};

float(vector v) vectoyaw =
{
  tbx_PrintDeprecation("vectoyaw", "tbx_GetVectorYaw");
  return _13(v);
};

entity() spawn =
{
  tbx_PrintDeprecation("spawn", "tbx_Spawn");
  return _14();
};

void(entity e) remove =
{
  tbx_PrintDeprecation("remove", "tbx_Despawn");
  _15(e);
};

void(vector v1, vector v2, float nomonsters, entity forent) traceline =
{
  tbx_PrintDeprecation("traceline", "tbx_TraceRay");
  _16(v1, v2, nomonsters, forent);
};

entity() checkclient =
{
  tbx_PrintDeprecation("checkclient", "tbx_GetNearbyPlayer");
  return _17();
};

entity(entity start, .string fld, string match) find =
{
  tbx_PrintDeprecation("find", "tbx_FindEntity");
  return _18(start, fld, match);
};

string(string s) precache_sound =
{
  tbx_PrintDeprecation("precache_sound", "tbx_LoadSound");
  return _19(s);
};

string(string s) precache_model =
{
  tbx_PrintDeprecation("precache_model", "tbx_LoadModel");
  return _20(s);
};

void(entity client, string s) stuffcmd =
{
  tbx_PrintDeprecation("precache_model", "tbx_PrintClientCommand");
  return _21(client, s);
};

entity(vector org, float rad) findradius =
{
  tbx_PrintDeprecation("findradius", "tbx_FindEntitiesInRadius");
  return _22(org, rad);
};

void(string s) bprint =
{
  tbx_PrintDeprecation("bprint", "tbx_PrintBroadcast");
  _23(s);
};

void(entity client, string s) sprint =
{
  tbx_PrintDeprecation("sprint", "tbx_PrintLocal");
  _24(client, s);
};

void(string s) dprint =
{
  tbx_PrintDeprecation("dprint", "tbx_PrintDebug");
  _25(s);
};

string(float f) ftos =
{
  tbx_PrintDeprecation("ftos", "tbx_GetFloatString");
  return _26(f);
};

string(vector v) vtos =
{
  tbx_PrintDeprecation("vtos", "tbx_GetVectorString");
  return _27(v);
};

void() coredump =
{
  tbx_PrintDeprecation("coredump", "tbx_CoreDump");
  _28();
};

void() traceon =
{
  tbx_PrintDeprecation("traceon", "tbx_StartFunctionTracing");
  _29();
};

void() traceoff =
{
  tbx_PrintDeprecation("traceoff", "tbx_StopFunctionTracing");
  _30();
};

void(entity e) eprint =
{
  tbx_PrintDeprecation("eprint", "tbx_PrintEntity");
  _31(e);
};

float(float yaw, float dist) walkmove =
{
  tbx_PrintDeprecation("walkmove", "tbx_ShiftEntity");
  return _32(yaw, dist);
};

float() droptofloor =
{
  tbx_PrintDeprecation("droptofloor", "tbx_DropEntity");
  return _34();
};

void(float style, string value) lightstyle =
{
  tbx_PrintDeprecation("lightstyle", "tbx_SetLightStyle");
  return _35(style, value);
};

float(float v) rint =
{
  tbx_PrintDeprecation("rint", "tbx_GetRounded");
  return _36(v);
};

float(float v) floor =
{
  tbx_PrintDeprecation("floor", "tbx_GetFloor");
  return _37(v);
};

float(float v) ceil =
{
  tbx_PrintDeprecation("ceil", "tbx_GetCeiling");
  return _38(v);
};

float(entity e) checkbottom =
{
  tbx_PrintDeprecation("checkbottom", "tbx_CheckGround");
  return _40(e);
};

float(vector v) pointcontents =
{
  tbx_PrintDeprecation("pointcontents", "tbx_PointContent");
  return _41(v);
};

float(float f) fabs =
{
  tbx_PrintDeprecation("fabs", "tbx_GetAbsolute");
  return _43(f);
};

vector(entity e, float speed) aim =
{
  tbx_PrintDeprecation("aim", "tbx_GetProjectileVelocity");
  return _44(e, speed);
};

float(string s) cvar =
{
  tbx_PrintDeprecation("cvar", "tbx_GetConsoleVariable");
  return _45(s);
};

void(string s) localcmd =
{
  tbx_PrintDeprecation("localcmd", "tbx_PrintServerCommand");
  _46(s);
};

entity(entity e) nextent =
{
  tbx_PrintDeprecation("nextent", "tbx_GetNextEntity");
  return _47(e);
};

void(vector o, vector d, float color, float count) particle =
{
  tbx_PrintDeprecation("particle", "tbx_SpawnParticles");
  _48(o, d, color, count);
};

void() ChangeYaw =
{
  tbx_PrintDeprecation("ChangeYaw", "tbx_TurnToIdealYaw");
  _49();
};

vector(vector v) vectoangles =
{
  tbx_PrintDeprecation("vectoangles", "tbx_GetVectorAngles");
  return _51(v);
};

void(float to, float f) WriteByte =
{
  tbx_PrintDeprecation("WriteByte", "tbx_WriteNetworkByte");
  _52(to, f);
};

void(float to, float f) WriteChar =
{
  tbx_PrintDeprecation("WriteChar", "tbx_WriteNetworkChar");
  _53(to, f);
};

void(float to, float f) WriteShort =
{
  tbx_PrintDeprecation("WriteShort", "tbx_WriteNetworkShortInt");
  _54(to, f);
};

void(float to, float f) WriteLong =
{
  tbx_PrintDeprecation("WriteLong", "tbx_WriteNetworkLongInt");
  _55(to, f);
};

void(float to, float f) WriteCoord =
{
  tbx_PrintDeprecation("WriteCoord", "tbx_WriteNetworkCoordinate");
  _56(to, f);
};

void(float to, float f) WriteAngle =
{
  tbx_PrintDeprecation("WriteAngle", "tbx_WriteNetworkAngle");
  _57(to, f);
};

void(float to, string s) WriteString =
{
  tbx_PrintDeprecation("WriteString", "tbx_WriteNetworkString");
  _58(to, s);
};

void(float to, entity s) WriteEntity =
{
  tbx_PrintDeprecation("WriteEntity", "tbx_WriteNetworkEntity");
  _59(to, s);
};

void(float step) movetogoal =
{
  tbx_PrintDeprecation("movetogoal", "tbx_NavigateEntity");
  _67(step);
};

string(string s) precache_file =
{
  tbx_PrintDeprecation("precache_file", "tbx_LoadFile");
  return _68(s);
};

void(entity e) makestatic =
{
  tbx_PrintDeprecation("makestatic", "tbx_SetEntityStatic");
  _69(e);
};

void(string s) changelevel =
{
  tbx_PrintDeprecation("changelevel", "tbx_LoadMap");
  _70(s);
};

void(string cvar, string val) cvar_set =
{
  tbx_PrintDeprecation("cvar_set", "tbx_SetConsoleVariable");
  _72(cvar, val);
};

void(entity client, string s) centerprint =
{
  tbx_PrintDeprecation("centerprint", "tbx_PrintLocalCentered");
  _73(client, s);
};

void(entity client, string s) centerprint2 =
{
  tbx_PrintDeprecation("centerprint2", "tbx_PrintLocalCentered2");
  _73(client, s);
};

void(entity client, string s) centerprint3 =
{
  tbx_PrintDeprecation("centerprint3", "tbx_PrintLocalCentered3");
  _73(client, s);
};

void(entity client, string s) centerprint4 =
{
  tbx_PrintDeprecation("centerprint4", "tbx_PrintLocalCentered4");
  _73(client, s);
};

void(entity client, string s) centerprint5 =
{
  tbx_PrintDeprecation("centerprint5", "tbx_PrintLocalCentered5");
  _73(client, s);
};

void(entity client, string s) centerprint6 =
{
  tbx_PrintDeprecation("centerprint6", "tbx_PrintLocalCentered6");
  _73(client, s);
};

void(entity client, string s) centerprint7 =
{
  tbx_PrintDeprecation("centerprint7", "tbx_PrintLocalCentered7");
  _73(client, s);
};

void(vector pos, string samp, float vol, float atten) ambientsound =
{
  tbx_PrintDeprecation("ambientsound", "tbx_PlayAmbientSound");
  _74(pos, samp, vol, atten);
};

string(string s) precache_model2 =
{
  tbx_PrintDeprecation("precache_model2", "tbx_LoadRegisteredModel");
  return _75(s);
};

string(string s) precache_sound2 =
{
  tbx_PrintDeprecation("precache_sound2", "tbx_LoadRegisteredModel");
  return _76(s);
};

string(string s) precache_file2 =
{
  tbx_PrintDeprecation("precache_file2", "tbx_LoadRegisteredSound");
  return _77(s);
};

void(entity e) setspawnparms =
{
  tbx_PrintDeprecation("setspawnparms", "tbx_WriteSpawnParameters");
  return _78(e);
};
