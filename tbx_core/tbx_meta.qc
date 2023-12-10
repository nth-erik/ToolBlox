/*
==============================================================================

ToolBlox meta-information functions

ToolBlox framework version and credits.

==============================================================================
*/



/*
-------------------------------------------------------------
Print ToolBlox version

Prints ToolBlox watermark and version to the console:
  */ string TBX_WATERMARK = "\bToolBlox\b framework"; /*
  */ string TBX_VERSION = "0.1.0"; /*

NOTE: Version follows the <changed>.<added>.<patched> format.

Please do not change these.
-------------------------------------------------------------
*/
void() tbx_PrintToolBloxVersion =
{
  tbx_PrintDebug(TBX_WATERMARK);
  tbx_PrintDebug(" version ");
  tbx_PrintDebug(TBX_VERSION);
  tbx_PrintDebug("\n");
};

/*
------------------------------------------------------------------------------
Print ToolBlox credits

Prints list of credited people to the console.

ToolBlox:
  */ string TBX_AUTHORS_TOOLBLOX = "\bToolBlox\b authors"; /*
  */ string TBX_CREDITS_THESOLIPSIST = "The Solipsist"; /*
progs_dump:
  */ string TBX_AUTHORS_PD = "\bprogs_dump\b authors"; /*
  */ string TBX_CREDITS_DUMPTRUCKDS = "dumptruck_ds "; /*
  */ string TBX_CREDITS_IW = "Ian Walshaw "; /*
  */ string TBX_CREDITS_QMASTER = "Qmaster "; /*
  */ string TBX_CREDITS_C0BURN = "c0burn "; /*
  */ string TBX_CREDITS_RENNYC = "RennyC "; /*
  */ string TBX_CREDITS_SPIKE = "Spike "; /*
  */ string TBX_CREDITS_SHANJAQ = "ShanJaq "; /*
  */ string TBX_CREDITS_SHAMBLERNAUT = "Shamblernaut "; /*
  */ string TBX_CREDITS_QUEENJAZZ = "QueenJazz "; /*
  */ string TBX_CREDITS_BDW = "BDW "; /*
  */ string TBX_CREDITS_KHREATOR = "Khreator "; /*
  */ string TBX_CREDITS_ZUNGRY = "ZungryWare "; /*
  */ string TBX_CREDITS_YDROL = "ydrol "; /*
  */ string TBX_CREDITS_VOIDFORCE = "Voidforce "; /*
  */ string TBX_CREDITS_NULLPOINTPALADIN = "NullPointPaladin "; /*
URQP:
  */ string TBX_AUTHORS_URQP = "\bUniversal Regular Quake Patch\b authors"; /*
  */ string TBX_CREDITS_MADDES = "Maddes"; /*
  */ string TBX_CREDITS_ATHOS = "Athos"; /*
  */ string TBX_CREDITS_KRYTEN = "Kryten"; /*
Rubicon:
  */ string TBX_AUTHORS_RUBICON = "\bRubicon\b authors"; /*
  */ string TBX_CREDITS_JOHNFITZ = "John Fitzgibbons"; /*
  */ string TBX_CREDITS_ACE_DAVE = "Ace_Dave"; /*
Quoth:
  */ string TBX_AUTHORS_QUOTH = "\bQuoth\b authors"; /*
  */ string TBX_CREDITS_KELL = "Kell"; /*
  */ string TBX_CREDITS_NECROS = "Necros"; /*
ReMake Quake:
  */ string TBX_AUTHORS_RMQ = "\bReMakeQuake\b authors"; /*
  */ string TBX_CREDITS_SUPA = "Supa"; /*
  */ string TBX_CREDITS_GB = "gb"; /*
  */ string TBX_CREDITS_IJED = "ijed"; /*
Rogue:
  */ string TBX_AUTHORS_ROGUE = "\bRogue Entertainment\b authors"; /*
  */ string TBX_CREDITS_PMACK = "Peter Mack"; /*
Hipnotic:
  */ string TBX_AUTHORS_HIPNOTIC = "\bHipnotic Software\b authors"; /*
  */ string TBX_CREDITS_JIMDOSE = "Jim Dosé"; /*
  */ string TBX_CREDITS_DHM = "Drake"; /*
id:
  */ string TBX_AUTHORS_ID = "\bid Software\b authors"; /*
  */ string TBX_CREDITS_JOHNCARMACK = "John Carmack"; /*
  */ string TBX_CREDITS_JOHNCASH = "John Cash"; /*
  */ string TBX_CREDITS_MICHAELABRASH = "Michael Abrash"; /*
Others:
  */ string TBX_AUTHORS_OTHER = "\bid Software\b authors"; /*
  */ string TBX_CREDITS_QUAKEWIKI = "\bQuakeWiki\b (various authors)"; /*
  */ string TBX_CREDITS_INSIDEQC = "\bInsideQC\b (various authors)"; /*
  */ string TBX_CREDITS_DARKGRUE = "DarkGrue (QuakeC Reference Manual)"; /*
  */ string TBX_CREDITS_PREACH = "Preach (Tome of Preach)"; /*
  */ string TBX_CREDITS_JOSHUASKELTON = "Joshua Skelton (Quake Tools)"; /*
  */ string TBX_CREDITS_JLEWW = "jleww (ChangeMusic.rar)"; /*
  */ string TBX_CREDITS_ZOID = "Zoid (CTF)"; /*
  */ string TBX_CREDITS_LUNARAN = "Lunaran (Copper)"; /*
  */ string TBX_CREDITS_ZERSTRORER = "Nihilism Unlimited (Zerstrorer)"; /*
  */ string TBX_CREDITS_KINN = "Kinn (Marcher Fortress)"; /*
  */ string TBX_CREDITS_TONYCOLLEN = "Tony Collen (DeadStuff)"; /*

Please do not change these.
------------------------------------------------------------------------------
*/
void() tbx_PrintToolBloxCredits =
{
  local string divisor = "\<\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\>\n";
  tbx_PrintDebug("\n\n");
  tbx_PrintDebug(TBX_AUTHORS_TOOLBLOX); tbx_PrintDebug("\n");
  tbx_PrintDebug(divisor);
  tbx_PrintDebug(TBX_CREDITS_THESOLIPSIST); tbx_PrintDebug("\n");
  tbx_PrintDebug(divisor); tbx_PrintDebug("\n");

  tbx_PrintDebug("Special thanks for the contribution of resources:\n\n");

  tbx_PrintDebug(TBX_AUTHORS_PD); tbx_PrintDebug("\n");
  tbx_PrintDebug(divisor);
  tbx_PrintDebug(TBX_CREDITS_DUMPTRUCKDS); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_IW); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_QMASTER); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_C0BURN); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_RENNYC); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_SPIKE); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_SHANJAQ); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_SHAMBLERNAUT); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_QUEENJAZZ); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_BDW); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_KHREATOR); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_ZUNGRY); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_YDROL); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_VOIDFORCE); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_NULLPOINTPALADIN); tbx_PrintDebug("\n");
  tbx_PrintDebug(divisor); tbx_PrintDebug("\n");

  tbx_PrintDebug(TBX_AUTHORS_URQP); tbx_PrintDebug("\n");
  tbx_PrintDebug(divisor);
  tbx_PrintDebug(TBX_CREDITS_MADDES); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_ATHOS); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_KRYTEN); tbx_PrintDebug("\n");
  tbx_PrintDebug(divisor); tbx_PrintDebug("\n");

  tbx_PrintDebug(TBX_AUTHORS_RUBICON); tbx_PrintDebug("\n");
  tbx_PrintDebug(divisor);
  tbx_PrintDebug(TBX_CREDITS_JOHNFITZ); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_ACE_DAVE); tbx_PrintDebug("\n");
  tbx_PrintDebug(divisor); tbx_PrintDebug("\n");

  tbx_PrintDebug(TBX_AUTHORS_QUOTH); tbx_PrintDebug("\n");
  tbx_PrintDebug(divisor);
  tbx_PrintDebug(TBX_CREDITS_KELL); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_NECROS); tbx_PrintDebug("\n");
  tbx_PrintDebug(divisor); tbx_PrintDebug("\n");

  tbx_PrintDebug(TBX_AUTHORS_RMQ); tbx_PrintDebug("\n");
  tbx_PrintDebug(divisor);
  tbx_PrintDebug(TBX_CREDITS_SUPA); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_GB); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_IJED); tbx_PrintDebug("\n");
  tbx_PrintDebug(divisor); tbx_PrintDebug("\n");

  tbx_PrintDebug(TBX_AUTHORS_ROGUE); tbx_PrintDebug("\n");
  tbx_PrintDebug(divisor);
  tbx_PrintDebug(TBX_CREDITS_PMACK); tbx_PrintDebug("\n");
  tbx_PrintDebug(divisor); tbx_PrintDebug("\n");

  tbx_PrintDebug(TBX_AUTHORS_HIPNOTIC); tbx_PrintDebug("\n");
  tbx_PrintDebug(divisor);
  tbx_PrintDebug(TBX_CREDITS_JIMDOSE); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_DHM); tbx_PrintDebug("\n");
  tbx_PrintDebug(divisor); tbx_PrintDebug("\n");

  tbx_PrintDebug(TBX_AUTHORS_ID); tbx_PrintDebug("\n");
  tbx_PrintDebug(divisor);
  tbx_PrintDebug(TBX_CREDITS_JOHNCARMACK); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_JOHNCASH); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_MICHAELABRASH); tbx_PrintDebug("\n");
  tbx_PrintDebug(divisor); tbx_PrintDebug("\n");

  tbx_PrintDebug(TBX_AUTHORS_OTHER); tbx_PrintDebug("\n");
  tbx_PrintDebug(divisor);
  tbx_PrintDebug(TBX_CREDITS_QUAKEWIKI); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_INSIDEQC); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_DARKGRUE); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_PREACH); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_JOSHUASKELTON); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_JLEWW); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_ZOID); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_LUNARAN); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_ZERSTRORER); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_KINN); tbx_PrintDebug("\n");
  tbx_PrintDebug(TBX_CREDITS_TONYCOLLEN);
  tbx_PrintDebug(divisor); tbx_PrintDebug("\n");
};