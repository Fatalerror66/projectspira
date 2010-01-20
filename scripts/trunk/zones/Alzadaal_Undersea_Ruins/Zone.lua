-----------------------------------
--	Author: ReaperX
-- 	Alzadaal Undersea Ruins
-----------------------------------

require("/scripts/globals/common");
require("/scripts/globals/settings");

---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
cs = -1;
return cs;
end;


function onInitialize()
--------------------------------------------------
---  Map Numbers and letters refer to http://wiki.ffxiclopedia.org/wiki/Alzadaal_Undersea_Ruins
---------------------------------------------------

--registerRegion(zoneID, regionID, west, east, high, low , south, north ); 

  registerRegion(0x48, 1, -323, -329, -2, 0 , 483, 489 );  -- map 1 SE porter
  registerRegion(0x48, 2, -477, -471,  -2, 0 , 631, 636 ); -- map 1 NW porter
  registerRegion(0x48, 3, 110, 116, -2, 0 , -556, -551);   -- map 2 west porter (white)
  registerRegion(0x48, 4, 30, 36, -2, 0 , 750, 757);       -- map 3 west porter (blue)
  registerRegion(0x48, 5, 83, 90, -2, 0 , 750, 757);       -- map 3 east porter (white)
  registerRegion(0x48, 6, -329, -323, -2, 0, 150, 156);    -- map 4 porter (white)
  registerRegion(0x48, 7, -208, -202, -2, 0, -556, -551);  -- map 5 porter (white)
  registerRegion(0x48, 8, 323, 329, -2, 0 , 591, 598);     -- map 6 east porter (white)
  registerRegion(0x48, 9, 270, 276, -2, 0 , 591, 598);     -- map 6 west porter (blue)
  registerRegion(0x48, 10, 442, 450, -2, 0 , -557, -550);  -- map 7 porter (white)

  ------------------ Nyzul area porters ------------------
  registerRegion(0x48, 11, -63, -57, -10, -8 ,  56,  62 ); -- map 8 NW/Arrapago porter
  registerRegion(0x48, 12,  17,  23, -6, -4 ,  56,  62 );  -- map 8 NE/Silver Sea/Khim porter
  registerRegion(0x48, 13, -63, -57, -10, -8 , -23, -16 ); -- map 8 SW/Zhayolm/bird camp porter
  registerRegion(0x48, 14,  17,  23, -6, -4 , -23, -16 );  -- map 8 SE/Bhaflau Porter
  -----------------------------------------------
  
  registerRegion(0x48, 15, -556, -550, -2, 0 , -77, -71 ); -- map 9 east porter (white)
  registerRegion(0x48, 16, -609, -603, -2, 0 , -77, -71 ); -- map 9 west porter (blue)

  registerRegion(0x48, 17, 643, 649, -2, 0 , -289, -283 );  -- map 10 east porter (blue)
  registerRegion(0x48, 18, 590, 597, -2, 0 , -289, -283 );  -- map 10 west porter (white)

  registerRegion(0x48, 19, 603, 610, -2, 0, 522, 529 );     -- map 11 east porter (blue)
  registerRegion(0x48, 20, 550, 557, -2, 0, 522, 529 );     -- map 11 west porter (white)
  registerRegion(0x48, 21, -556, -550, -2, 0 , -489, -483 );-- map 12 east porter (white)
  registerRegion(0x48, 22, -610, -603, -2, 0 , -489, -483 );-- map 12 west porter (blue)
  
--print("Alzadaal Undersea Ruins Teleporters Initialized.");

end

function onRegionEnter(player, regionID)
switch (regionID): caseof {
---------------------------------
[1] = function (x)  -- Portal -- map 1 SE porter
---------------------------------
	player:startEvent(Event(0xCC)); -- Use the device? /nYes/nNo. 
end,

---------------------------------
[2] = function (x)  -- Portal -- map 1 NW porter
---------------------------------
	player:startEvent(Event(0xCD)); -- Use the device? /nYes/nNo.
end,

---------------------------------
[3] = function (x)  -- Portal -- map 2 west porter (white)
---------------------------------
	player:startEvent(Event(0xC9)); -- Use the device? /nYes/nNo.
end,

---------------------------------
[4] = function (x)  -- Portal -- map 3 west porter (blue)
---------------------------------
	player:startEvent(Event(0xCB)); -- Use the device? /nYes/nNo.
end,

---------------------------------
[5] = function (x)  -- Portal -- map 3 west porter (blue)
---------------------------------
    player:startEvent(Event(0xCA)); -- Use the device? /nYes/nNo.
end,

---------------------------------
[6] = function (x)  -- Portal -- map 4 porter (white)
---------------------------------
	player:startEvent(Event(0xCE)); -- Use the device? /nYes/nNo.
end,

---------------------------------
[7] = function (x)  -- Portal -- map 5 porter (white)
---------------------------------
	player:startEvent(Event(0xD3)); -- Use the device? /nYes/nNo.
end,

---------------------------------
[8] = function (x)  -- Portal -- map 6 east porter (white)
---------------------------------
	player:startEvent(Event(0xC8)); -- Use the device? /nYes/nNo.
end,

---------------------------------
[9] = function (x)  -- Portal -- map 6 west porter (blue)
---------------------------------
	player:startEvent(Event(0xC9)); -- Use the device? /nYes/nNo.
end,

---------------------------------
[10] = function (x)  -- Portal -- map 7 porter (white)
---------------------------------
	player:startEvent(Event(0xD5)); -- Use the device? /nYes/nNo.
end,

---------------------------------
[11] = function (x)  -- NW Nyzul porter to Arrapago Remnants
---------------------------------
	player:startEvent(Event(0xDA)); -- Use the device? /nYes/nNo.
end,

---------------------------------
[12] = function (x)  -- NE Nyzul porter to SSR
---------------------------------
	player:startEvent(Event(0xDD)); -- Use the device? /nYes/nNo.
end,

---------------------------------
[13] = function (x)  -- SW Nyzul porter to Zhayolm Remnants
---------------------------------
    player:startEvent(Event(0xDB)); -- Use the device? /nYes/nNo.
end,

---------------------------------
[14] = function (x)  -- SE Nyzul porter to Bhaflau Remnants
---------------------------------
	player:startEvent(Event(0xDC)); -- Use the device? /nYes/nNo.
end,

---------------------------------
[15] = function (x)  -- Portal -- map 9 east porter (white)
---------------------------------
    player:startEvent(Event(0xCF)); -- Use the device? /nYes/nNo.
end,

---------------------------------
[16] = function (x)  -- Portal -- map 9 west porter (blue)
---------------------------------
	player:startEvent(Event(0xD0)); -- Use the device? /nYes/nNo.
end,

---------------------------------
[17] = function (x)  -- Portal -- map 10 east porter (blue)
---------------------------------
	player:startEvent(Event(0xD6)); -- Use the device? /nYes/nNo.
end,

---------------------------------
[18] = function (x)  -- Portal -- map 10 west porter (white)
---------------------------------
	player:startEvent(Event(0xCF)); -- Use the device? /nYes/nNo.
end,

---------------------------------
[19] = function (x)  -- Portal -- map 11 east porter (blue)
---------------------------------
	player:startEvent(Event(0xCA)); -- Use the device? /nYes/nNo.
end,

---------------------------------
[20] = function (x)  -- Portal -- map 11 west porter (white)
---------------------------------
	player:startEvent(Event(0xCF)); -- Use the device? /nYes/nNo.
end,

---------------------------------
[21] = function (x)  -- Portal -- map 12 east porter (white)
---------------------------------
	player:startEvent(Event(0xCF)); -- Use the device? /nYes/nNo.
end,

---------------------------------
[22] = function (x)  -- Portal -- map 12 west porter (blue)
---------------------------------
	player:startEvent(Event(0xD2)); -- Use the device? /nYes/nNo.
end,

default = function (x)
--print("default");
end,}

end;
 
 
---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("OPTION:",option);
end;