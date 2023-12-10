/*
------------------------------------------------
Add flags

Returns new flagset with target flags turned on.

Example:
  Source -----Target -----+
  | 1101 0110 | 0000 1111 | -> 1101 1111
  +-----------+-----------+

sourceFlags: flagset to update
targetFlags: flag pattern to add
------------------------------------------------
*/
float(float sourceFlags, float targetFlags) tbx_AddFlags =
{
  return sourceFlags | targetFlags;
};

/*
-------------------------------------------------
Remove flags

Returns new flagset with target flags turned off.

Example:
  Source -----Target -----+
  | 1101 0110 | 0000 1111 | -> 1101 0000
  +-----------+-----------+

sourceFlags: flagset to update
targetFlags: flag pattern to remove
-------------------------------------------------
*/
float(float sourceFlags, float targetFlags) tbx_RemoveFlags =
{
  return sourceFlags - (sourceFlags & targetFlags);
};

/*
----------------------------------------------
Toggle flags

Returns new flagset with target flags toggled.

Example:
  Source -----Target -----+
  | 1101 0110 | 0000 1111 | -> 1101 1001
  +-----------+-----------+

sourceFlags: flagset to update
targetFlags: flag pattern to toggle
----------------------------------------------
*/
float(float sourceFlags, float targetFlags) tbx_ToggleFlags =
{
  local float flagIndex = 1;

  while (targetFlags > 0)
  {
    if (targetFlags & flagIndex)
    {
      if (sourceFlags & flagIndex)
        sourceFlags = sourceFlags - flagIndex;
      else
        sourceFlags = sourceFlags | flagIndex;
    }

    targetFlags = targetFlags - (targetFlags & flagIndex);
    flagIndex = flagIndex * 2;
  }

  return sourceFlags;
};
