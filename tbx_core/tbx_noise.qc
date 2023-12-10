/*
==============================================================================

ToolBlox noise functions

Functions responsible for generating a seedable random noise.
Contains 1000 unique, evenly spaced values between 0.0 and 1.0 in random
order, 1.0 not included.
Access it using an iterator function with offset and skips to create less
predictable patterns.
Especially useful for enabling speedruns or procedurally generated features.

==============================================================================
*/



/*
===========================
Noise value functions

Please do not change these.
===========================
*/

/*
------------------------------------------------------------------------
Get white noise

Returns a stored random floating point value corresponding to the passed
index. Quick and versatile.

noiseValueIndex: index of the noise value to read out
------------------------------------------------------------------------
*/
float(float noiseValueIndex) tbx_GetWhiteNoise =
{
  if (noiseValueIndex == 0)
    return 0.524;

  if (noiseValueIndex == 1)
    return 0.501;

  if (noiseValueIndex == 2)
    return 0.899;

  if (noiseValueIndex == 3)
    return 0.861;

  if (noiseValueIndex == 4)
    return 0.923;

  if (noiseValueIndex == 5)
    return 0.194;

  if (noiseValueIndex == 6)
    return 0.431;

  if (noiseValueIndex == 7)
    return 0.370;

  if (noiseValueIndex == 8)
    return 0.697;

  if (noiseValueIndex == 9)
    return 0.355;

  if (noiseValueIndex == 10)
    return 0.219;

  if (noiseValueIndex == 11)
    return 0.700;

  if (noiseValueIndex == 12)
    return 0.699;

  if (noiseValueIndex == 13)
    return 0.481;

  if (noiseValueIndex == 14)
    return 0.494;

  if (noiseValueIndex == 15)
    return 0.046;

  if (noiseValueIndex == 16)
    return 0.339;

  if (noiseValueIndex == 17)
    return 0.331;

  if (noiseValueIndex == 18)
    return 0.019;

  if (noiseValueIndex == 19)
    return 0.792;

  if (noiseValueIndex == 20)
    return 0.280;

  if (noiseValueIndex == 21)
    return 0.326;

  if (noiseValueIndex == 22)
    return 0.396;

  if (noiseValueIndex == 23)
    return 0.584;

  if (noiseValueIndex == 24)
    return 0.132;

  if (noiseValueIndex == 25)
    return 0.474;

  if (noiseValueIndex == 26)
    return 0.515;

  if (noiseValueIndex == 27)
    return 0.749;

  if (noiseValueIndex == 28)
    return 0.279;

  if (noiseValueIndex == 29)
    return 0.514;

  if (noiseValueIndex == 30)
    return 0.871;

  if (noiseValueIndex == 31)
    return 0.508;

  if (noiseValueIndex == 32)
    return 0.336;

  if (noiseValueIndex == 33)
    return 0.314;

  if (noiseValueIndex == 34)
    return 0.044;

  if (noiseValueIndex == 35)
    return 0.887;

  if (noiseValueIndex == 36)
    return 0.609;

  if (noiseValueIndex == 37)
    return 0.665;

  if (noiseValueIndex == 38)
    return 0.057;

  if (noiseValueIndex == 39)
    return 0.315;

  if (noiseValueIndex == 40)
    return 0.192;

  if (noiseValueIndex == 41)
    return 0.640;

  if (noiseValueIndex == 42)
    return 0.118;

  if (noiseValueIndex == 43)
    return 0.489;

  if (noiseValueIndex == 44)
    return 0.522;

  if (noiseValueIndex == 45)
    return 0.399;

  if (noiseValueIndex == 46)
    return 0.424;

  if (noiseValueIndex == 47)
    return 0.152;

  if (noiseValueIndex == 48)
    return 0.575;

  if (noiseValueIndex == 49)
    return 0.273;

  if (noiseValueIndex == 50)
    return 0.403;

  if (noiseValueIndex == 51)
    return 0.043;

  if (noiseValueIndex == 52)
    return 0.404;

  if (noiseValueIndex == 53)
    return 0.793;

  if (noiseValueIndex == 54)
    return 0.907;

  if (noiseValueIndex == 55)
    return 0.462;

  if (noiseValueIndex == 56)
    return 0.800;

  if (noiseValueIndex == 57)
    return 0.633;

  if (noiseValueIndex == 58)
    return 0.300;

  if (noiseValueIndex == 59)
    return 0.456;

  if (noiseValueIndex == 60)
    return 0.642;

  if (noiseValueIndex == 61)
    return 0.772;

  if (noiseValueIndex == 62)
    return 0.733;

  if (noiseValueIndex == 63)
    return 0.233;

  if (noiseValueIndex == 64)
    return 0.244;

  if (noiseValueIndex == 65)
    return 0.834;

  if (noiseValueIndex == 66)
    return 0.967;

  if (noiseValueIndex == 67)
    return 0.239;

  if (noiseValueIndex == 68)
    return 0.240;

  if (noiseValueIndex == 69)
    return 0.567;

  if (noiseValueIndex == 70)
    return 0.001;

  if (noiseValueIndex == 71)
    return 0.103;

  if (noiseValueIndex == 72)
    return 0.042;

  if (noiseValueIndex == 73)
    return 0.844;

  if (noiseValueIndex == 74)
    return 0.649;

  if (noiseValueIndex == 75)
    return 0.328;

  if (noiseValueIndex == 76)
    return 0.924;

  if (noiseValueIndex == 77)
    return 0.876;

  if (noiseValueIndex == 78)
    return 0.037;

  if (noiseValueIndex == 79)
    return 0.780;

  if (noiseValueIndex == 80)
    return 0.184;

  if (noiseValueIndex == 81)
    return 0.402;

  if (noiseValueIndex == 82)
    return 0.369;

  if (noiseValueIndex == 83)
    return 0.814;

  if (noiseValueIndex == 84)
    return 0.703;

  if (noiseValueIndex == 85)
    return 0.976;

  if (noiseValueIndex == 86)
    return 0.647;

  if (noiseValueIndex == 87)
    return 0.859;

  if (noiseValueIndex == 88)
    return 0.055;

  if (noiseValueIndex == 89)
    return 0.409;

  if (noiseValueIndex == 90)
    return 0.068;

  if (noiseValueIndex == 91)
    return 0.388;

  if (noiseValueIndex == 92)
    return 0.268;

  if (noiseValueIndex == 93)
    return 0.549;

  if (noiseValueIndex == 94)
    return 0.343;

  if (noiseValueIndex == 95)
    return 0.972;

  if (noiseValueIndex == 96)
    return 0.565;

  if (noiseValueIndex == 97)
    return 0.577;

  if (noiseValueIndex == 98)
    return 0.996;

  if (noiseValueIndex == 99)
    return 0.204;

  if (noiseValueIndex == 100)
    return 0.127;

  if (noiseValueIndex == 101)
    return 0.179;

  if (noiseValueIndex == 102)
    return 0.207;

  if (noiseValueIndex == 103)
    return 0.310;

  if (noiseValueIndex == 104)
    return 0.770;

  if (noiseValueIndex == 105)
    return 0.868;

  if (noiseValueIndex == 106)
    return 0.496;

  if (noiseValueIndex == 107)
    return 0.796;

  if (noiseValueIndex == 108)
    return 0.227;

  if (noiseValueIndex == 109)
    return 0.786;

  if (noiseValueIndex == 110)
    return 0.660;

  if (noiseValueIndex == 111)
    return 0.500;

  if (noiseValueIndex == 112)
    return 0.109;

  if (noiseValueIndex == 113)
    return 0.081;

  if (noiseValueIndex == 114)
    return 0.896;

  if (noiseValueIndex == 115)
    return 0.754;

  if (noiseValueIndex == 116)
    return 0.287;

  if (noiseValueIndex == 117)
    return 0.858;

  if (noiseValueIndex == 118)
    return 0.878;

  if (noiseValueIndex == 119)
    return 0.006;

  if (noiseValueIndex == 120)
    return 0.464;

  if (noiseValueIndex == 121)
    return 0.600;

  if (noiseValueIndex == 122)
    return 0.981;

  if (noiseValueIndex == 123)
    return 0.690;

  if (noiseValueIndex == 124)
    return 0.880;

  if (noiseValueIndex == 125)
    return 0.174;

  if (noiseValueIndex == 126)
    return 0.646;

  if (noiseValueIndex == 127)
    return 0.510;

  if (noiseValueIndex == 128)
    return 0.987;

  if (noiseValueIndex == 129)
    return 0.940;

  if (noiseValueIndex == 130)
    return 0.808;

  if (noiseValueIndex == 131)
    return 0.598;

  if (noiseValueIndex == 132)
    return 0.277;

  if (noiseValueIndex == 133)
    return 0.200;

  if (noiseValueIndex == 134)
    return 0.661;

  if (noiseValueIndex == 135)
    return 0.166;

  if (noiseValueIndex == 136)
    return 0.714;

  if (noiseValueIndex == 137)
    return 0.874;

  if (noiseValueIndex == 138)
    return 0.202;

  if (noiseValueIndex == 139)
    return 0.845;

  if (noiseValueIndex == 140)
    return 0.224;

  if (noiseValueIndex == 141)
    return 0.195;

  if (noiseValueIndex == 142)
    return 0.812;

  if (noiseValueIndex == 143)
    return 0.229;

  if (noiseValueIndex == 144)
    return 0.903;

  if (noiseValueIndex == 145)
    return 0.543;

  if (noiseValueIndex == 146)
    return 0.856;

  if (noiseValueIndex == 147)
    return 0.472;

  if (noiseValueIndex == 148)
    return 0.688;

  if (noiseValueIndex == 149)
    return 0.664;

  if (noiseValueIndex == 150)
    return 0.759;

  if (noiseValueIndex == 151)
    return 0.959;

  if (noiseValueIndex == 152)
    return 0.639;

  if (noiseValueIndex == 153)
    return 0.671;

  if (noiseValueIndex == 154)
    return 0.499;

  if (noiseValueIndex == 155)
    return 0.151;

  if (noiseValueIndex == 156)
    return 0.435;

  if (noiseValueIndex == 157)
    return 0.282;

  if (noiseValueIndex == 158)
    return 0.348;

  if (noiseValueIndex == 159)
    return 0.960;

  if (noiseValueIndex == 160)
    return 0.964;

  if (noiseValueIndex == 161)
    return 0.247;

  if (noiseValueIndex == 162)
    return 0.379;

  if (noiseValueIndex == 163)
    return 0.387;

  if (noiseValueIndex == 164)
    return 0.506;

  if (noiseValueIndex == 165)
    return 0.249;

  if (noiseValueIndex == 166)
    return 0.537;

  if (noiseValueIndex == 167)
    return 0.992;

  if (noiseValueIndex == 168)
    return 0.153;

  if (noiseValueIndex == 169)
    return 0.935;

  if (noiseValueIndex == 170)
    return 0.187;

  if (noiseValueIndex == 171)
    return 0.397;

  if (noiseValueIndex == 172)
    return 0.423;

  if (noiseValueIndex == 173)
    return 0.226;

  if (noiseValueIndex == 174)
    return 0.583;

  if (noiseValueIndex == 175)
    return 0.463;

  if (noiseValueIndex == 176)
    return 0.304;

  if (noiseValueIndex == 177)
    return 0.737;

  if (noiseValueIndex == 178)
    return 0.556;

  if (noiseValueIndex == 179)
    return 0.341;

  if (noiseValueIndex == 180)
    return 0.850;

  if (noiseValueIndex == 181)
    return 0.956;

  if (noiseValueIndex == 182)
    return 0.529;

  if (noiseValueIndex == 183)
    return 0.990;

  if (noiseValueIndex == 184)
    return 0.662;

  if (noiseValueIndex == 185)
    return 0.817;

  if (noiseValueIndex == 186)
    return 0.075;

  if (noiseValueIndex == 187)
    return 0.843;

  if (noiseValueIndex == 188)
    return 0.385;

  if (noiseValueIndex == 189)
    return 0.278;

  if (noiseValueIndex == 190)
    return 0.172;

  if (noiseValueIndex == 191)
    return 0.265;

  if (noiseValueIndex == 192)
    return 0.617;

  if (noiseValueIndex == 193)
    return 0.416;

  if (noiseValueIndex == 194)
    return 0.266;

  if (noiseValueIndex == 195)
    return 0.293;

  if (noiseValueIndex == 196)
    return 0.198;

  if (noiseValueIndex == 197)
    return 0.062;

  if (noiseValueIndex == 198)
    return 0.365;

  if (noiseValueIndex == 199)
    return 0.041;

  if (noiseValueIndex == 200)
    return 0.223;

  if (noiseValueIndex == 201)
    return 0.309;

  if (noiseValueIndex == 202)
    return 0.894;

  if (noiseValueIndex == 203)
    return 0.324;

  if (noiseValueIndex == 204)
    return 0.741;

  if (noiseValueIndex == 205)
    return 0.454;

  if (noiseValueIndex == 206)
    return 0.828;

  if (noiseValueIndex == 207)
    return 0.190;

  if (noiseValueIndex == 208)
    return 0.453;

  if (noiseValueIndex == 209)
    return 0.762;

  if (noiseValueIndex == 210)
    return 0.984;

  if (noiseValueIndex == 211)
    return 0.696;

  if (noiseValueIndex == 212)
    return 0.538;

  if (noiseValueIndex == 213)
    return 0.920;

  if (noiseValueIndex == 214)
    return 0.162;

  if (noiseValueIndex == 215)
    return 0.933;

  if (noiseValueIndex == 216)
    return 0.120;

  if (noiseValueIndex == 217)
    return 0.275;

  if (noiseValueIndex == 218)
    return 0.312;

  if (noiseValueIndex == 219)
    return 0.534;

  if (noiseValueIndex == 220)
    return 0.725;

  if (noiseValueIndex == 221)
    return 0.446;

  if (noiseValueIndex == 222)
    return 0.768;

  if (noiseValueIndex == 223)
    return 0.744;

  if (noiseValueIndex == 224)
    return 0.436;

  if (noiseValueIndex == 225)
    return 0.191;

  if (noiseValueIndex == 226)
    return 0.350;

  if (noiseValueIndex == 227)
    return 0.013;

  if (noiseValueIndex == 228)
    return 0.568;

  if (noiseValueIndex == 229)
    return 0.491;

  if (noiseValueIndex == 230)
    return 0.488;

  if (noiseValueIndex == 231)
    return 0.242;

  if (noiseValueIndex == 232)
    return 0.557;

  if (noiseValueIndex == 233)
    return 0.740;

  if (noiseValueIndex == 234)
    return 0.053;

  if (noiseValueIndex == 235)
    return 0.306;

  if (noiseValueIndex == 236)
    return 0.115;

  if (noiseValueIndex == 237)
    return 0.413;

  if (noiseValueIndex == 238)
    return 0.848;

  if (noiseValueIndex == 239)
    return 0.877;

  if (noiseValueIndex == 240)
    return 0.384;

  if (noiseValueIndex == 241)
    return 0.160;

  if (noiseValueIndex == 242)
    return 0.072;

  if (noiseValueIndex == 243)
    return 0.789;

  if (noiseValueIndex == 244)
    return 0.045;

  if (noiseValueIndex == 245)
    return 0.243;

  if (noiseValueIndex == 246)
    return 0.373;

  if (noiseValueIndex == 247)
    return 0.862;

  if (noiseValueIndex == 248)
    return 0.346;

  if (noiseValueIndex == 249)
    return 0.585;

  if (noiseValueIndex == 250)
    return 0.971;

  if (noiseValueIndex == 251)
    return 0.837;

  if (noiseValueIndex == 252)
    return 0.143;

  if (noiseValueIndex == 253)
    return 0.672;

  if (noiseValueIndex == 254)
    return 0.624;

  if (noiseValueIndex == 255)
    return 0.231;

  if (noiseValueIndex == 256)
    return 0.319;

  if (noiseValueIndex == 257)
    return 0.429;

  if (noiseValueIndex == 258)
    return 0.926;

  if (noiseValueIndex == 259)
    return 0.612;

  if (noiseValueIndex == 260)
    return 0.356;

  if (noiseValueIndex == 261)
    return 0.261;

  if (noiseValueIndex == 262)
    return 0.677;

  if (noiseValueIndex == 263)
    return 0.094;

  if (noiseValueIndex == 264)
    return 0.659;

  if (noiseValueIndex == 265)
    return 0.550;

  if (noiseValueIndex == 266)
    return 0.503;

  if (noiseValueIndex == 267)
    return 0.718;

  if (noiseValueIndex == 268)
    return 0.519;

  if (noiseValueIndex == 269)
    return 0.998;

  if (noiseValueIndex == 270)
    return 0.398;

  if (noiseValueIndex == 271)
    return 0.720;

  if (noiseValueIndex == 272)
    return 0.455;

  if (noiseValueIndex == 273)
    return 0.622;

  if (noiseValueIndex == 274)
    return 0.752;

  if (noiseValueIndex == 275)
    return 0.263;

  if (noiseValueIndex == 276)
    return 0.093;

  if (noiseValueIndex == 277)
    return 0.214;

  if (noiseValueIndex == 278)
    return 0.337;

  if (noiseValueIndex == 279)
    return 0.908;

  if (noiseValueIndex == 280)
    return 0.630;

  if (noiseValueIndex == 281)
    return 0.038;

  if (noiseValueIndex == 282)
    return 0.539;

  if (noiseValueIndex == 283)
    return 0.327;

  if (noiseValueIndex == 284)
    return 0.175;

  if (noiseValueIndex == 285)
    return 0.221;

  if (noiseValueIndex == 286)
    return 0.523;

  if (noiseValueIndex == 287)
    return 0.471;

  if (noiseValueIndex == 288)
    return 0.909;

  if (noiseValueIndex == 289)
    return 0.163;

  if (noiseValueIndex == 290)
    return 0.074;

  if (noiseValueIndex == 291)
    return 0.362;

  if (noiseValueIndex == 292)
    return 0.730;

  if (noiseValueIndex == 293)
    return 0.297;

  if (noiseValueIndex == 294)
    return 0.222;

  if (noiseValueIndex == 295)
    return 0.882;

  if (noiseValueIndex == 296)
    return 0.466;

  if (noiseValueIndex == 297)
    return 0.561;

  if (noiseValueIndex == 298)
    return 0.691;

  if (noiseValueIndex == 299)
    return 0.897;

  if (noiseValueIndex == 300)
    return 0.942;

  if (noiseValueIndex == 301)
    return 0.569;

  if (noiseValueIndex == 302)
    return 0.269;

  if (noiseValueIndex == 303)
    return 0.144;

  if (noiseValueIndex == 304)
    return 0.581;

  if (noiseValueIndex == 305)
    return 0.146;

  if (noiseValueIndex == 306)
    return 0.863;

  if (noiseValueIndex == 307)
    return 0.461;

  if (noiseValueIndex == 308)
    return 0.098;

  if (noiseValueIndex == 309)
    return 0.985;

  if (noiseValueIndex == 310)
    return 0.797;

  if (noiseValueIndex == 311)
    return 0.301;

  if (noiseValueIndex == 312)
    return 0.616;

  if (noiseValueIndex == 313)
    return 0.841;

  if (noiseValueIndex == 314)
    return 0.493;

  if (noiseValueIndex == 315)
    return 0.582;

  if (noiseValueIndex == 316)
    return 0.833;

  if (noiseValueIndex == 317)
    return 0.885;

  if (noiseValueIndex == 318)
    return 0.615;

  if (noiseValueIndex == 319)
    return 0.540;

  if (noiseValueIndex == 320)
    return 0.970;

  if (noiseValueIndex == 321)
    return 0.254;

  if (noiseValueIndex == 322)
    return 0.180;

  if (noiseValueIndex == 323)
    return 0.322;

  if (noiseValueIndex == 324)
    return 0.952;

  if (noiseValueIndex == 325)
    return 0.708;

  if (noiseValueIndex == 326)
    return 0.338;

  if (noiseValueIndex == 327)
    return 0.824;

  if (noiseValueIndex == 328)
    return 0.954;

  if (noiseValueIndex == 329)
    return 0.352;

  if (noiseValueIndex == 330)
    return 0.091;

  if (noiseValueIndex == 331)
    return 0.591;

  if (noiseValueIndex == 332)
    return 0.618;

  if (noiseValueIndex == 333)
    return 0.394;

  if (noiseValueIndex == 334)
    return 0.386;

  if (noiseValueIndex == 335)
    return 0.236;

  if (noiseValueIndex == 336)
    return 0.378;

  if (noiseValueIndex == 337)
    return 0.873;

  if (noiseValueIndex == 338)
    return 0.721;

  if (noiseValueIndex == 339)
    return 0.220;

  if (noiseValueIndex == 340)
    return 0.736;

  if (noiseValueIndex == 341)
    return 0.292;

  if (noiseValueIndex == 342)
    return 0.879;

  if (noiseValueIndex == 343)
    return 0.138;

  if (noiseValueIndex == 344)
    return 0.606;

  if (noiseValueIndex == 345)
    return 0.173;

  if (noiseValueIndex == 346)
    return 0.112;

  if (noiseValueIndex == 347)
    return 0.641;

  if (noiseValueIndex == 348)
    return 0.678;

  if (noiseValueIndex == 349)
    return 0.643;

  if (noiseValueIndex == 350)
    return 0.051;

  if (noiseValueIndex == 351)
    return 0.947;

  if (noiseValueIndex == 352)
    return 0.137;

  if (noiseValueIndex == 353)
    return 0.290;

  if (noiseValueIndex == 354)
    return 0.158;

  if (noiseValueIndex == 355)
    return 0.818;

  if (noiseValueIndex == 356)
    return 0.116;

  if (noiseValueIndex == 357)
    return 0.178;

  if (noiseValueIndex == 358)
    return 0.546;

  if (noiseValueIndex == 359)
    return 0.799;

  if (noiseValueIndex == 360)
    return 0.893;

  if (noiseValueIndex == 361)
    return 0.595;

  if (noiseValueIndex == 362)
    return 0.910;

  if (noiseValueIndex == 363)
    return 0.076;

  if (noiseValueIndex == 364)
    return 0.400;

  if (noiseValueIndex == 365)
    return 0.056;

  if (noiseValueIndex == 366)
    return 0.626;

  if (noiseValueIndex == 367)
    return 0.032;

  if (noiseValueIndex == 368)
    return 0.621;

  if (noiseValueIndex == 369)
    return 0.751;

  if (noiseValueIndex == 370)
    return 0.241;

  if (noiseValueIndex == 371)
    return 0.842;

  if (noiseValueIndex == 372)
    return 0.411;

  if (noiseValueIndex == 373)
    return 0.480;

  if (noiseValueIndex == 374)
    return 0.182;

  if (noiseValueIndex == 375)
    return 0.925;

  if (noiseValueIndex == 376)
    return 0.054;

  if (noiseValueIndex == 377)
    return 0.255;

  if (noiseValueIndex == 378)
    return 0.553;

  if (noiseValueIndex == 379)
    return 0.594;

  if (noiseValueIndex == 380)
    return 0.864;

  if (noiseValueIndex == 381)
    return 0.033;

  if (noiseValueIndex == 382)
    return 0.438;

  if (noiseValueIndex == 383)
    return 0.764;

  if (noiseValueIndex == 384)
    return 0.723;

  if (noiseValueIndex == 385)
    return 0.930;

  if (noiseValueIndex == 386)
    return 0.473;

  if (noiseValueIndex == 387)
    return 0.905;

  if (noiseValueIndex == 388)
    return 0.468;

  if (noiseValueIndex == 389)
    return 0.087;

  if (noiseValueIndex == 390)
    return 0.272;

  if (noiseValueIndex == 391)
    return 0.450;

  if (noiseValueIndex == 392)
    return 0.089;

  if (noiseValueIndex == 393)
    return 0.186;

  if (noiseValueIndex == 394)
    return 0.916;

  if (noiseValueIndex == 395)
    return 0.977;

  if (noiseValueIndex == 396)
    return 0.753;

  if (noiseValueIndex == 397)
    return 0.680;

  if (noiseValueIndex == 398)
    return 0.477;

  if (noiseValueIndex == 399)
    return 0.295;

  if (noiseValueIndex == 400)
    return 0.656;

  if (noiseValueIndex == 401)
    return 0.820;

  if (noiseValueIndex == 402)
    return 0.107;

  if (noiseValueIndex == 403)
    return 0.962;

  if (noiseValueIndex == 404)
    return 0.693;

  if (noiseValueIndex == 405)
    return 0.589;

  if (noiseValueIndex == 406)
    return 0.946;

  if (noiseValueIndex == 407)
    return 0.717;

  if (noiseValueIndex == 408)
    return 0.767;

  if (noiseValueIndex == 409)
    return 0.778;

  if (noiseValueIndex == 410)
    return 0.911;

  if (noiseValueIndex == 411)
    return 0.176;

  if (noiseValueIndex == 412)
    return 0.482;

  if (noiseValueIndex == 413)
    return 0.321;

  if (noiseValueIndex == 414)
    return 0.694;

  if (noiseValueIndex == 415)
    return 0.760;

  if (noiseValueIndex == 416)
    return 0.578;

  if (noiseValueIndex == 417)
    return 0.719;

  if (noiseValueIndex == 418)
    return 0.687;

  if (noiseValueIndex == 419)
    return 0.335;

  if (noiseValueIndex == 420)
    return 0.023;

  if (noiseValueIndex == 421)
    return 0.571;

  if (noiseValueIndex == 422)
    return 0.213;

  if (noiseValueIndex == 423)
    return 0.802;

  if (noiseValueIndex == 424)
    return 0.012;

  if (noiseValueIndex == 425)
    return 0.375;

  if (noiseValueIndex == 426)
    return 0.929;

  if (noiseValueIndex == 427)
    return 0.611;

  if (noiseValueIndex == 428)
    return 0.345;

  if (noiseValueIndex == 429)
    return 0.288;

  if (noiseValueIndex == 430)
    return 0.084;

  if (noiseValueIndex == 431)
    return 0.121;

  if (noiseValueIndex == 432)
    return 0.588;

  if (noiseValueIndex == 433)
    return 0.788;

  if (noiseValueIndex == 434)
    return 0.928;

  if (noiseValueIndex == 435)
    return 0.291;

  if (noiseValueIndex == 436)
    return 0.891;

  if (noiseValueIndex == 437)
    return 0.101;

  if (noiseValueIndex == 438)
    return 0.684;

  if (noiseValueIndex == 439)
    return 0.434;

  if (noiseValueIndex == 440)
    return 0.545;

  if (noiseValueIndex == 441)
    return 0.320;

  if (noiseValueIndex == 442)
    return 0.492;

  if (noiseValueIndex == 443)
    return 0.126;

  if (noiseValueIndex == 444)
    return 0.884;

  if (noiseValueIndex == 445)
    return 0.015;

  if (noiseValueIndex == 446)
    return 0.495;

  if (noiseValueIndex == 447)
    return 0.608;

  if (noiseValueIndex == 448)
    return 0.560;

  if (noiseValueIndex == 449)
    return 0.003;

  if (noiseValueIndex == 450)
    return 0.732;

  if (noiseValueIndex == 451)
    return 0.353;

  if (noiseValueIndex == 452)
    return 0.271;

  if (noiseValueIndex == 453)
    return 0.452;

  if (noiseValueIndex == 454)
    return 0.991;

  if (noiseValueIndex == 455)
    return 0.810;

  if (noiseValueIndex == 456)
    return 0.949;

  if (noiseValueIndex == 457)
    return 0.475;

  if (noiseValueIndex == 458)
    return 0.917;

  if (noiseValueIndex == 459)
    return 0.625;

  if (noiseValueIndex == 460)
    return 0.620;

  if (noiseValueIndex == 461)
    return 0.215;

  if (noiseValueIndex == 462)
    return 0.050;

  if (noiseValueIndex == 463)
    return 0.366;

  if (noiseValueIndex == 464)
    return 0.750;

  if (noiseValueIndex == 465)
    return 0.124;

  if (noiseValueIndex == 466)
    return 0.258;

  if (noiseValueIndex == 467)
    return 0.058;

  if (noiseValueIndex == 468)
    return 0.359;

  if (noiseValueIndex == 469)
    return 0.299;

  if (noiseValueIndex == 470)
    return 0.840;

  if (noiseValueIndex == 471)
    return 0.948;

  if (noiseValueIndex == 472)
    return 0.975;

  if (noiseValueIndex == 473)
    return 0.739;

  if (noiseValueIndex == 474)
    return 0.827;

  if (noiseValueIndex == 475)
    return 0.428;

  if (noiseValueIndex == 476)
    return 0.445;

  if (noiseValueIndex == 477)
    return 0.420;

  if (noiseValueIndex == 478)
    return 0.526;

  if (noiseValueIndex == 479)
    return 0.839;

  if (noiseValueIndex == 480)
    return 0.059;

  if (noiseValueIndex == 481)
    return 0.637;

  if (noiseValueIndex == 482)
    return 0.007;

  if (noiseValueIndex == 483)
    return 0.638;

  if (noiseValueIndex == 484)
    return 0.525;

  if (noiseValueIndex == 485)
    return 0.199;

  if (noiseValueIndex == 486)
    return 0.995;

  if (noiseValueIndex == 487)
    return 0.533;

  if (noiseValueIndex == 488)
    return 0.668;

  if (noiseValueIndex == 489)
    return 0.245;

  if (noiseValueIndex == 490)
    return 0.238;

  if (noiseValueIndex == 491)
    return 0.069;

  if (noiseValueIndex == 492)
    return 0.941;

  if (noiseValueIndex == 493)
    return 0.530;

  if (noiseValueIndex == 494)
    return 0.024;

  if (noiseValueIndex == 495)
    return 0.689;

  if (noiseValueIndex == 496)
    return 0.558;

  if (noiseValueIndex == 497)
    return 0.140;

  if (noiseValueIndex == 498)
    return 0.063;

  if (noiseValueIndex == 499)
    return 0.655;

  if (noiseValueIndex == 500)
    return 0.096;

  if (noiseValueIndex == 501)
    return 0.986;

  if (noiseValueIndex == 502)
    return 0.206;

  if (noiseValueIndex == 503)
    return 0.551;

  if (noiseValueIndex == 504)
    return 0.030;

  if (noiseValueIndex == 505)
    return 0.936;

  if (noiseValueIndex == 506)
    return 0.105;

  if (noiseValueIndex == 507)
    return 0.237;

  if (noiseValueIndex == 508)
    return 0.712;

  if (noiseValueIndex == 509)
    return 0.010;

  if (noiseValueIndex == 510)
    return 0.086;

  if (noiseValueIndex == 511)
    return 0.017;

  if (noiseValueIndex == 512)
    return 0.743;

  if (noiseValueIndex == 513)
    return 0.421;

  if (noiseValueIndex == 514)
    return 0.080;

  if (noiseValueIndex == 515)
    return 0.185;

  if (noiseValueIndex == 516)
    return 0.679;

  if (noiseValueIndex == 517)
    return 0.965;

  if (noiseValueIndex == 518)
    return 0.065;

  if (noiseValueIndex == 519)
    return 0.329;

  if (noiseValueIndex == 520)
    return 0.123;

  if (noiseValueIndex == 521)
    return 0.865;

  if (noiseValueIndex == 522)
    return 0.957;

  if (noiseValueIndex == 523)
    return 0.674;

  if (noiseValueIndex == 524)
    return 0.395;

  if (noiseValueIndex == 525)
    return 0.610;

  if (noiseValueIndex == 526)
    return 0.511;

  if (noiseValueIndex == 527)
    return 0.513;

  if (noiseValueIndex == 528)
    return 0.727;

  if (noiseValueIndex == 529)
    return 0.931;

  if (noiseValueIndex == 530)
    return 0.912;

  if (noiseValueIndex == 531)
    return 0.901;

  if (noiseValueIndex == 532)
    return 0.333;

  if (noiseValueIndex == 533)
    return 0.898;

  if (noiseValueIndex == 534)
    return 0.305;

  if (noiseValueIndex == 535)
    return 0.134;

  if (noiseValueIndex == 536)
    return 0.890;

  if (noiseValueIndex == 537)
    return 0.994;

  if (noiseValueIndex == 538)
    return 0.593;

  if (noiseValueIndex == 539)
    return 0.052;

  if (noiseValueIndex == 540)
    return 0.978;

  if (noiseValueIndex == 541)
    return 0.393;

  if (noiseValueIndex == 542)
    return 0.203;

  if (noiseValueIndex == 543)
    return 0.367;

  if (noiseValueIndex == 544)
    return 0.364;

  if (noiseValueIndex == 545)
    return 0.552;

  if (noiseValueIndex == 546)
    return 0.286;

  if (noiseValueIndex == 547)
    return 0.632;

  if (noiseValueIndex == 548)
    return 0.951;

  if (noiseValueIndex == 549)
    return 0.938;

  if (noiseValueIndex == 550)
    return 0.449;

  if (noiseValueIndex == 551)
    return 0.405;

  if (noiseValueIndex == 552)
    return 0.748;

  if (noiseValueIndex == 553)
    return 0.047;

  if (noiseValueIndex == 554)
    return 0.919;

  if (noiseValueIndex == 555)
    return 0.830;

  if (noiseValueIndex == 556)
    return 0.170;

  if (noiseValueIndex == 557)
    return 0.574;

  if (noiseValueIndex == 558)
    return 0.782;

  if (noiseValueIndex == 559)
    return 0.937;

  if (noiseValueIndex == 560)
    return 0.779;

  if (noiseValueIndex == 561)
    return 0.836;

  if (noiseValueIndex == 562)
    return 0.171;

  if (noiseValueIndex == 563)
    return 0.260;

  if (noiseValueIndex == 564)
    return 0.628;

  if (noiseValueIndex == 565)
    return 0.729;

  if (noiseValueIndex == 566)
    return 0.201;

  if (noiseValueIndex == 567)
    return 0.872;

  if (noiseValueIndex == 568)
    return 0.742;

  if (noiseValueIndex == 569)
    return 0.073;

  if (noiseValueIndex == 570)
    return 0.022;

  if (noiseValueIndex == 571)
    return 0.484;

  if (noiseValueIndex == 572)
    return 0.061;

  if (noiseValueIndex == 573)
    return 0.835;

  if (noiseValueIndex == 574)
    return 0.157;

  if (noiseValueIndex == 575)
    return 0.597;

  if (noiseValueIndex == 576)
    return 0.791;

  if (noiseValueIndex == 577)
    return 0.408;

  if (noiseValueIndex == 578)
    return 0.667;

  if (noiseValueIndex == 579)
    return 0.644;

  if (noiseValueIndex == 580)
    return 0.470;

  if (noiseValueIndex == 581)
    return 0.119;

  if (noiseValueIndex == 582)
    return 0.776;

  if (noiseValueIndex == 583)
    return 0.218;

  if (noiseValueIndex == 584)
    return 0.071;

  if (noiseValueIndex == 585)
    return 0.518;

  if (noiseValueIndex == 586)
    return 0.698;

  if (noiseValueIndex == 587)
    return 0.274;

  if (noiseValueIndex == 588)
    return 0.829;

  if (noiseValueIndex == 589)
    return 0.401;

  if (noiseValueIndex == 590)
    return 0.380;

  if (noiseValueIndex == 591)
    return 0.283;

  if (noiseValueIndex == 592)
    return 0.774;

  if (noiseValueIndex == 593)
    return 0.806;

  if (noiseValueIndex == 594)
    return 0.028;

  if (noiseValueIndex == 595)
    return 0.211;

  if (noiseValueIndex == 596)
    return 0.106;

  if (noiseValueIndex == 597)
    return 0.251;

  if (noiseValueIndex == 598)
    return 0.509;

  if (noiseValueIndex == 599)
    return 0.440;

  if (noiseValueIndex == 600)
    return 0.989;

  if (noiseValueIndex == 601)
    return 0.002;

  if (noiseValueIndex == 602)
    return 0.039;

  if (noiseValueIndex == 603)
    return 0.469;

  if (noiseValueIndex == 604)
    return 0.914;

  if (noiseValueIndex == 605)
    return 0.130;

  if (noiseValueIndex == 606)
    return 0.724;

  if (noiseValueIndex == 607)
    return 0.860;

  if (noiseValueIndex == 608)
    return 0.590;

  if (noiseValueIndex == 609)
    return 0.875;

  if (noiseValueIndex == 610)
    return 0.417;

  if (noiseValueIndex == 611)
    return 0.881;

  if (noiseValueIndex == 612)
    return 0.692;

  if (noiseValueIndex == 613)
    return 0.497;

  if (noiseValueIndex == 614)
    return 0.128;

  if (noiseValueIndex == 615)
    return 0.547;

  if (noiseValueIndex == 616)
    return 0.205;

  if (noiseValueIndex == 617)
    return 0.705;

  if (noiseValueIndex == 618)
    return 0.670;

  if (noiseValueIndex == 619)
    return 0.376;

  if (noiseValueIndex == 620)
    return 0.572;

  if (noiseValueIndex == 621)
    return 0.685;

  if (noiseValueIndex == 622)
    return 0.383;

  if (noiseValueIndex == 623)
    return 0.532;

  if (noiseValueIndex == 624)
    return 0.726;

  if (noiseValueIndex == 625)
    return 0.016;

  if (noiseValueIndex == 626)
    return 0.097;

  if (noiseValueIndex == 627)
    return 0.889;

  if (noiseValueIndex == 628)
    return 0.652;

  if (noiseValueIndex == 629)
    return 0.270;

  if (noiseValueIndex == 630)
    return 0.267;

  if (noiseValueIndex == 631)
    return 0.666;

  if (noiseValueIndex == 632)
    return 0.927;

  if (noiseValueIndex == 633)
    return 0.323;

  if (noiseValueIndex == 634)
    return 0.982;

  if (noiseValueIndex == 635)
    return 0.755;

  if (noiseValueIndex == 636)
    return 0.425;

  if (noiseValueIndex == 637)
    return 0.763;

  if (noiseValueIndex == 638)
    return 0.870;

  if (noiseValueIndex == 639)
    return 0.587;

  if (noiseValueIndex == 640)
    return 0.747;

  if (noiseValueIndex == 641)
    return 0.713;

  if (noiseValueIndex == 642)
    return 0.771;

  if (noiseValueIndex == 643)
    return 0.296;

  if (noiseValueIndex == 644)
    return 0.374;

  if (noiseValueIndex == 645)
    return 0.883;

  if (noiseValueIndex == 646)
    return 0.060;

  if (noiseValueIndex == 647)
    return 0.289;

  if (noiseValueIndex == 648)
    return 0.822;

  if (noiseValueIndex == 649)
    return 0.479;

  if (noiseValueIndex == 650)
    return 0.675;

  if (noiseValueIndex == 651)
    return 0.117;

  if (noiseValueIndex == 652)
    return 0.210;

  if (noiseValueIndex == 653)
    return 0.294;

  if (noiseValueIndex == 654)
    return 0.623;

  if (noiseValueIndex == 655)
    return 0.368;

  if (noiseValueIndex == 656)
    return 0.596;

  if (noiseValueIndex == 657)
    return 0.381;

  if (noiseValueIndex == 658)
    return 0.216;

  if (noiseValueIndex == 659)
    return 0.913;

  if (noiseValueIndex == 660)
    return 0.790;

  if (noiseValueIndex == 661)
    return 0.857;

  if (noiseValueIndex == 662)
    return 0.576;

  if (noiseValueIndex == 663)
    return 0.803;

  if (noiseValueIndex == 664)
    return 0.122;

  if (noiseValueIndex == 665)
    return 0.437;

  if (noiseValueIndex == 666)
    return 0.113;

  if (noiseValueIndex == 667)
    return 0.177;

  if (noiseValueIndex == 668)
    return 0.406;

  if (noiseValueIndex == 669)
    return 0.467;

  if (noiseValueIndex == 670)
    return 0.026;

  if (noiseValueIndex == 671)
    return 0.136;

  if (noiseValueIndex == 672)
    return 0.131;

  if (noiseValueIndex == 673)
    return 0.181;

  if (noiseValueIndex == 674)
    return 0.505;

  if (noiseValueIndex == 675)
    return 0.602;

  if (noiseValueIndex == 676)
    return 0.066;

  if (noiseValueIndex == 677)
    return 0.189;

  if (noiseValueIndex == 678)
    return 0.999;

  if (noiseValueIndex == 679)
    return 0.681;

  if (noiseValueIndex == 680)
    return 0.164;

  if (noiseValueIndex == 681)
    return 0.722;

  if (noiseValueIndex == 682)
    return 0.459;

  if (noiseValueIndex == 683)
    return 0.823;

  if (noiseValueIndex == 684)
    return 0.811;

  if (noiseValueIndex == 685)
    return 0.645;

  if (noiseValueIndex == 686)
    return 0.604;

  if (noiseValueIndex == 687)
    return 0.133;

  if (noiseValueIndex == 688)
    return 0.544;

  if (noiseValueIndex == 689)
    return 0.161;

  if (noiseValueIndex == 690)
    return 0.262;

  if (noiseValueIndex == 691)
    return 0.787;

  if (noiseValueIndex == 692)
    return 0.902;

  if (noiseValueIndex == 693)
    return 0.318;

  if (noiseValueIndex == 694)
    return 0.846;

  if (noiseValueIndex == 695)
    return 0.264;

  if (noiseValueIndex == 696)
    return 0.498;

  if (noiseValueIndex == 697)
    return 0.855;

  if (noiseValueIndex == 698)
    return 0.036;

  if (noiseValueIndex == 699)
    return 0.627;

  if (noiseValueIndex == 700)
    return 0.701;

  if (noiseValueIndex == 701)
    return 0.486;

  if (noiseValueIndex == 702)
    return 0.756;

  if (noiseValueIndex == 703)
    return 0.332;

  if (noiseValueIndex == 704)
    return 0.308;

  if (noiseValueIndex == 705)
    return 0.360;

  if (noiseValueIndex == 706)
    return 0.196;

  if (noiseValueIndex == 707)
    return 0.150;

  if (noiseValueIndex == 708)
    return 0.257;

  if (noiseValueIndex == 709)
    return 0.212;

  if (noiseValueIndex == 710)
    return 0.154;

  if (noiseValueIndex == 711)
    return 0.005;

  if (noiseValueIndex == 712)
    return 0.586;

  if (noiseValueIndex == 713)
    return 0.129;

  if (noiseValueIndex == 714)
    return 0.347;

  if (noiseValueIndex == 715)
    return 0.804;

  if (noiseValueIndex == 716)
    return 0.704;

  if (noiseValueIndex == 717)
    return 0.958;

  if (noiseValueIndex == 718)
    return 0.092;

  if (noiseValueIndex == 719)
    return 0.256;

  if (noiseValueIndex == 720)
    return 0.955;

  if (noiseValueIndex == 721)
    return 0.573;

  if (noiseValueIndex == 722)
    return 0.512;

  if (noiseValueIndex == 723)
    return 0.849;

  if (noiseValueIndex == 724)
    return 0.769;

  if (noiseValueIndex == 725)
    return 0.605;

  if (noiseValueIndex == 726)
    return 0.559;

  if (noiseValueIndex == 727)
    return 0.816;

  if (noiseValueIndex == 728)
    return 0.738;

  if (noiseValueIndex == 729)
    return 0.745;

  if (noiseValueIndex == 730)
    return 0.317;

  if (noiseValueIndex == 731)
    return 0.866;

  if (noiseValueIndex == 732)
    return 0.114;

  if (noiseValueIndex == 733)
    return 0.728;

  if (noiseValueIndex == 734)
    return 0.706;

  if (noiseValueIndex == 735)
    return 0.361;

  if (noiseValueIndex == 736)
    return 0.412;

  if (noiseValueIndex == 737)
    return 0.535;

  if (noiseValueIndex == 738)
    return 0.139;

  if (noiseValueIndex == 739)
    return 0.784;

  if (noiseValueIndex == 740)
    return 0.592;

  if (noiseValueIndex == 741)
    return 0.246;

  if (noiseValueIndex == 742)
    return 0.673;

  if (noiseValueIndex == 743)
    return 0.442;

  if (noiseValueIndex == 744)
    return 0.460;

  if (noiseValueIndex == 745)
    return 0.478;

  if (noiseValueIndex == 746)
    return 0.372;

  if (noiseValueIndex == 747)
    return 0.631;

  if (noiseValueIndex == 748)
    return 0.683;

  if (noiseValueIndex == 749)
    return 0.783;

  if (noiseValueIndex == 750)
    return 0.040;

  if (noiseValueIndex == 751)
    return 0.635;

  if (noiseValueIndex == 752)
    return 0.832;

  if (noiseValueIndex == 753)
    return 0.363;

  if (noiseValueIndex == 754)
    return 0.922;

  if (noiseValueIndex == 755)
    return 0.892;

  if (noiseValueIndex == 756)
    return 0.088;

  if (noiseValueIndex == 757)
    return 0.794;

  if (noiseValueIndex == 758)
    return 0.805;

  if (noiseValueIndex == 759)
    return 0.083;

  if (noiseValueIndex == 760)
    return 0.607;

  if (noiseValueIndex == 761)
    return 0.735;

  if (noiseValueIndex == 762)
    return 0.781;

  if (noiseValueIndex == 763)
    return 0.715;

  if (noiseValueIndex == 764)
    return 0.915;

  if (noiseValueIndex == 765)
    return 0.004;

  if (noiseValueIndex == 766)
    return 0.432;

  if (noiseValueIndex == 767)
    return 0.629;

  if (noiseValueIndex == 768)
    return 0.147;

  if (noiseValueIndex == 769)
    return 0.354;

  if (noiseValueIndex == 770)
    return 0.451;

  if (noiseValueIndex == 771)
    return 0.298;

  if (noiseValueIndex == 772)
    return 0.695;

  if (noiseValueIndex == 773)
    return 0.650;

  if (noiseValueIndex == 774)
    return 0.527;

  if (noiseValueIndex == 775)
    return 0.029;

  if (noiseValueIndex == 776)
    return 0.765;

  if (noiseValueIndex == 777)
    return 0.443;

  if (noiseValueIndex == 778)
    return 0.410;

  if (noiseValueIndex == 779)
    return 0.248;

  if (noiseValueIndex == 780)
    return 0.135;

  if (noiseValueIndex == 781)
    return 0.663;

  if (noiseValueIndex == 782)
    return 0.344;

  if (noiseValueIndex == 783)
    return 0.281;

  if (noiseValueIndex == 784)
    return 0.831;

  if (noiseValueIndex == 785)
    return 0.082;

  if (noiseValueIndex == 786)
    return 0.746;

  if (noiseValueIndex == 787)
    return 0.159;

  if (noiseValueIndex == 788)
    return 0.483;

  if (noiseValueIndex == 789)
    return 0.758;

  if (noiseValueIndex == 790)
    return 0.476;

  if (noiseValueIndex == 791)
    return 0.011;

  if (noiseValueIndex == 792)
    return 0.921;

  if (noiseValueIndex == 793)
    return 0.634;

  if (noiseValueIndex == 794)
    return 0.711;

  if (noiseValueIndex == 795)
    return 0.963;

  if (noiseValueIndex == 796)
    return 0.570;

  if (noiseValueIndex == 797)
    return 0.021;

  if (noiseValueIndex == 798)
    return 0.141;

  if (noiseValueIndex == 799)
    return 0.095;

  if (noiseValueIndex == 800)
    return 0.867;

  if (noiseValueIndex == 801)
    return 0.316;

  if (noiseValueIndex == 802)
    return 0.847;

  if (noiseValueIndex == 803)
    return 0.521;

  if (noiseValueIndex == 804)
    return 0.208;

  if (noiseValueIndex == 805)
    return 0.104;

  if (noiseValueIndex == 806)
    return 0.110;

  if (noiseValueIndex == 807)
    return 0.900;

  if (noiseValueIndex == 808)
    return 0.852;

  if (noiseValueIndex == 809)
    return 0.444;

  if (noiseValueIndex == 810)
    return 0.250;

  if (noiseValueIndex == 811)
    return 0.953;

  if (noiseValueIndex == 812)
    return 0.035;

  if (noiseValueIndex == 813)
    return 0.027;

  if (noiseValueIndex == 814)
    return 0.358;

  if (noiseValueIndex == 815)
    return 0.165;

  if (noiseValueIndex == 816)
    return 0.156;

  if (noiseValueIndex == 817)
    return 0.009;

  if (noiseValueIndex == 818)
    return 0.433;

  if (noiseValueIndex == 819)
    return 0.149;

  if (noiseValueIndex == 820)
    return 0.018;

  if (noiseValueIndex == 821)
    return 0.217;

  if (noiseValueIndex == 822)
    return 0.886;

  if (noiseValueIndex == 823)
    return 0.193;

  if (noiseValueIndex == 824)
    return 0.648;

  if (noiseValueIndex == 825)
    return 0.313;

  if (noiseValueIndex == 826)
    return 0.389;

  if (noiseValueIndex == 827)
    return 0.349;

  if (noiseValueIndex == 828)
    return 0.851;

  if (noiseValueIndex == 829)
    return 0.070;

  if (noiseValueIndex == 830)
    return 0.815;

  if (noiseValueIndex == 831)
    return 0.969;

  if (noiseValueIndex == 832)
    return 0.085;

  if (noiseValueIndex == 833)
    return 0.997;

  if (noiseValueIndex == 834)
    return 0.197;

  if (noiseValueIndex == 835)
    return 0.676;

  if (noiseValueIndex == 836)
    return 0.457;

  if (noiseValueIndex == 837)
    return 0.020;

  if (noiseValueIndex == 838)
    return 0.155;

  if (noiseValueIndex == 839)
    return 0.419;

  if (noiseValueIndex == 840)
    return 0.813;

  if (noiseValueIndex == 841)
    return 0.414;

  if (noiseValueIndex == 842)
    return 0.613;

  if (noiseValueIndex == 843)
    return 0.993;

  if (noiseValueIndex == 844)
    return 0.426;

  if (noiseValueIndex == 845)
    return 0.067;

  if (noiseValueIndex == 846)
    return 0.351;

  if (noiseValueIndex == 847)
    return 0.108;

  if (noiseValueIndex == 848)
    return 0.979;

  if (noiseValueIndex == 849)
    return 0.330;

  if (noiseValueIndex == 850)
    return 0.235;

  if (noiseValueIndex == 851)
    return 0.932;

  if (noiseValueIndex == 852)
    return 0.487;

  if (noiseValueIndex == 853)
    return 0.785;

  if (noiseValueIndex == 854)
    return 0.284;

  if (noiseValueIndex == 855)
    return 0.651;

  if (noiseValueIndex == 856)
    return 0.458;

  if (noiseValueIndex == 857)
    return 0.542;

  if (noiseValueIndex == 858)
    return 0.973;

  if (noiseValueIndex == 859)
    return 0.441;

  if (noiseValueIndex == 860)
    return 0.102;

  if (noiseValueIndex == 861)
    return 0.427;

  if (noiseValueIndex == 862)
    return 0.906;

  if (noiseValueIndex == 863)
    return 0.554;

  if (noiseValueIndex == 864)
    return 0.340;

  if (noiseValueIndex == 865)
    return 0.302;

  if (noiseValueIndex == 866)
    return 0.854;

  if (noiseValueIndex == 867)
    return 0.485;

  if (noiseValueIndex == 868)
    return 0.334;

  if (noiseValueIndex == 869)
    return 0.049;

  if (noiseValueIndex == 870)
    return 0.031;

  if (noiseValueIndex == 871)
    return 0.777;

  if (noiseValueIndex == 872)
    return 0.838;

  if (noiseValueIndex == 873)
    return 0.447;

  if (noiseValueIndex == 874)
    return 0.188;

  if (noiseValueIndex == 875)
    return 0.415;

  if (noiseValueIndex == 876)
    return 0.232;

  if (noiseValueIndex == 877)
    return 0.064;

  if (noiseValueIndex == 878)
    return 0.382;

  if (noiseValueIndex == 879)
    return 0.654;

  if (noiseValueIndex == 880)
    return 0.707;

  if (noiseValueIndex == 881)
    return 0.761;

  if (noiseValueIndex == 882)
    return 0.000;

  if (noiseValueIndex == 883)
    return 0.809;

  if (noiseValueIndex == 884)
    return 0.148;

  if (noiseValueIndex == 885)
    return 0.079;

  if (noiseValueIndex == 886)
    return 0.142;

  if (noiseValueIndex == 887)
    return 0.939;

  if (noiseValueIndex == 888)
    return 0.980;

  if (noiseValueIndex == 889)
    return 0.826;

  if (noiseValueIndex == 890)
    return 0.944;

  if (noiseValueIndex == 891)
    return 0.517;

  if (noiseValueIndex == 892)
    return 0.531;

  if (noiseValueIndex == 893)
    return 0.619;

  if (noiseValueIndex == 894)
    return 0.757;

  if (noiseValueIndex == 895)
    return 0.541;

  if (noiseValueIndex == 896)
    return 0.516;

  if (noiseValueIndex == 897)
    return 0.234;

  if (noiseValueIndex == 898)
    return 0.099;

  if (noiseValueIndex == 899)
    return 0.307;

  if (noiseValueIndex == 900)
    return 0.601;

  if (noiseValueIndex == 901)
    return 0.966;

  if (noiseValueIndex == 902)
    return 0.259;

  if (noiseValueIndex == 903)
    return 0.077;

  if (noiseValueIndex == 904)
    return 0.439;

  if (noiseValueIndex == 905)
    return 0.230;

  if (noiseValueIndex == 906)
    return 0.371;

  if (noiseValueIndex == 907)
    return 0.702;

  if (noiseValueIndex == 908)
    return 0.392;

  if (noiseValueIndex == 909)
    return 0.325;

  if (noiseValueIndex == 910)
    return 0.904;

  if (noiseValueIndex == 911)
    return 0.048;

  if (noiseValueIndex == 912)
    return 0.168;

  if (noiseValueIndex == 913)
    return 0.798;

  if (noiseValueIndex == 914)
    return 0.407;

  if (noiseValueIndex == 915)
    return 0.709;

  if (noiseValueIndex == 916)
    return 0.014;

  if (noiseValueIndex == 917)
    return 0.579;

  if (noiseValueIndex == 918)
    return 0.603;

  if (noiseValueIndex == 919)
    return 0.548;

  if (noiseValueIndex == 920)
    return 0.422;

  if (noiseValueIndex == 921)
    return 0.716;

  if (noiseValueIndex == 922)
    return 0.311;

  if (noiseValueIndex == 923)
    return 0.943;

  if (noiseValueIndex == 924)
    return 0.658;

  if (noiseValueIndex == 925)
    return 0.983;

  if (noiseValueIndex == 926)
    return 0.430;

  if (noiseValueIndex == 927)
    return 0.795;

  if (noiseValueIndex == 928)
    return 0.167;

  if (noiseValueIndex == 929)
    return 0.145;

  if (noiseValueIndex == 930)
    return 0.125;

  if (noiseValueIndex == 931)
    return 0.918;

  if (noiseValueIndex == 932)
    return 0.775;

  if (noiseValueIndex == 933)
    return 0.807;

  if (noiseValueIndex == 934)
    return 0.766;

  if (noiseValueIndex == 935)
    return 0.357;

  if (noiseValueIndex == 936)
    return 0.710;

  if (noiseValueIndex == 937)
    return 0.945;

  if (noiseValueIndex == 938)
    return 0.562;

  if (noiseValueIndex == 939)
    return 0.100;

  if (noiseValueIndex == 940)
    return 0.504;

  if (noiseValueIndex == 941)
    return 0.078;

  if (noiseValueIndex == 942)
    return 0.801;

  if (noiseValueIndex == 943)
    return 0.520;

  if (noiseValueIndex == 944)
    return 0.418;

  if (noiseValueIndex == 945)
    return 0.566;

  if (noiseValueIndex == 946)
    return 0.682;

  if (noiseValueIndex == 947)
    return 0.391;

  if (noiseValueIndex == 948)
    return 0.183;

  if (noiseValueIndex == 949)
    return 0.869;

  if (noiseValueIndex == 950)
    return 0.773;

  if (noiseValueIndex == 951)
    return 0.974;

  if (noiseValueIndex == 952)
    return 0.968;

  if (noiseValueIndex == 953)
    return 0.090;

  if (noiseValueIndex == 954)
    return 0.669;

  if (noiseValueIndex == 955)
    return 0.950;

  if (noiseValueIndex == 956)
    return 0.653;

  if (noiseValueIndex == 957)
    return 0.228;

  if (noiseValueIndex == 958)
    return 0.555;

  if (noiseValueIndex == 959)
    return 0.636;

  if (noiseValueIndex == 960)
    return 0.564;

  if (noiseValueIndex == 961)
    return 0.507;

  if (noiseValueIndex == 962)
    return 0.686;

  if (noiseValueIndex == 963)
    return 0.111;

  if (noiseValueIndex == 964)
    return 0.034;

  if (noiseValueIndex == 965)
    return 0.025;

  if (noiseValueIndex == 966)
    return 0.934;

  if (noiseValueIndex == 967)
    return 0.731;

  if (noiseValueIndex == 968)
    return 0.536;

  if (noiseValueIndex == 969)
    return 0.853;

  if (noiseValueIndex == 970)
    return 0.614;

  if (noiseValueIndex == 971)
    return 0.209;

  if (noiseValueIndex == 972)
    return 0.819;

  if (noiseValueIndex == 973)
    return 0.895;

  if (noiseValueIndex == 974)
    return 0.285;

  if (noiseValueIndex == 975)
    return 0.490;

  if (noiseValueIndex == 976)
    return 0.563;

  if (noiseValueIndex == 977)
    return 0.253;

  if (noiseValueIndex == 978)
    return 0.825;

  if (noiseValueIndex == 979)
    return 0.169;

  if (noiseValueIndex == 980)
    return 0.225;

  if (noiseValueIndex == 981)
    return 0.252;

  if (noiseValueIndex == 982)
    return 0.448;

  if (noiseValueIndex == 983)
    return 0.276;

  if (noiseValueIndex == 984)
    return 0.377;

  if (noiseValueIndex == 985)
    return 0.502;

  if (noiseValueIndex == 986)
    return 0.821;

  if (noiseValueIndex == 987)
    return 0.580;

  if (noiseValueIndex == 988)
    return 0.303;

  if (noiseValueIndex == 989)
    return 0.390;

  if (noiseValueIndex == 990)
    return 0.528;

  if (noiseValueIndex == 991)
    return 0.465;

  if (noiseValueIndex == 992)
    return 0.734;

  if (noiseValueIndex == 993)
    return 0.599;

  if (noiseValueIndex == 994)
    return 0.008;

  if (noiseValueIndex == 995)
    return 0.888;

  if (noiseValueIndex == 996)
    return 0.657;

  if (noiseValueIndex == 997)
    return 0.961;

  if (noiseValueIndex == 998)
    return 0.342;

  if (noiseValueIndex == 999)
    return 0.988;

  tbx_Error("Noise value index out of range.");
  return 0;
};
