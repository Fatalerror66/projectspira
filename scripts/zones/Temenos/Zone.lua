-----------------------------------
--	Author: ReaperX
-- 	Temenos portals
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

--registerRegion(zoneID, regionID, west, east, high, low , south, north ); 

registerRegion(0x25, 1, 337, 342,  71,  72 ,-186,-182 );  -- Temenos West 1F->2F
registerRegion(0x25, 2, 217, 222, -83, -82 ,-186,-182 );  -- Temenos West 2F->3F
registerRegion(0x25, 3,  17,  22,  71,  72 ,-185,-182 );  -- Temenos West 3F->4F
registerRegion(0x25, 4,-103, -98, -83, -82 ,-185,-182 );  -- Temenos West 4F->5F
registerRegion(0x25, 5,-303,-298,  77,  78 ,-185,-182 );  -- Temenos West 5F->6F
registerRegion(0x25, 6,-422,-417, -83, -82 ,-185,-182 );  -- Temenos West 6F->7F

registerRegion(0x25, 7, 337, 342,  -3,  -2 ,  95,  98 );  -- Temenos East 1F->2F
registerRegion(0x25, 8, 217, 222,-163,-162 ,  95,  98 );  -- Temenos East 2F->3F
registerRegion(0x25, 9,  17,  22,  -3,  -2 ,  95,  98 );  -- Temenos East 3F->4F
registerRegion(0x25,10,-103, -98,-163,-162 ,  95,  98 );  -- Temenos East 4F->5F
registerRegion(0x25,11,-303,-298,  -3,  -2 ,  95,  98 );  -- Temenos East 5F->6F
registerRegion(0x25,12,-422,-417,-163,-162 ,  95,  98 );  -- Temenos East 6F->7F

registerRegion(0x25,13, 337, 342,  71,  72 , 374, 378 );  -- Temenos North 1F->2F
registerRegion(0x25,14, 217, 222, -83, -82 , 374, 378 );  -- Temenos North 2F->3F
registerRegion(0x25,15,  17,  22,  71,  72 , 374, 378 );  -- Temenos North 3F->4F
registerRegion(0x25,16,-103, -98, -83, -82 , 374, 378 );  -- Temenos North 4F->5F
registerRegion(0x25,17,-303,-298,  77,  78 , 374, 378 );  -- Temenos North 5F->6F
registerRegion(0x25,18,-422,-417, -83, -82 , 374, 378 );  -- Temenos North 6F->7F

--print("Temenos Teleporters Initialized.");
end

--[[ Temenos teleporter Events 
0x64 : to Northern Tower 2nd floor
0x65 : to Northern Tower 3rd floor
0x66 : to Northern Tower 4th floor
0x67 : to Northern Tower 5th floor
0x68 : to Northern Tower 6th floor
0x69 : to Northern Tower 7th floor
0x6A : out to staging area

0x6B : to Eastern Tower 2nd floor
0x6C : to Eastern Tower 3rd floor
0x6D : to Eastern Tower 4th floor
0x6E : to Eastern Tower 5th floor
0x6F : to Eastern Tower 6th floor
0x70 : to Eastern Tower 7th floor
0x71 : out to staging area

0x72 : to Western Tower 2nd floor
0x73 : to Western Tower 3rd floor
0x74 : to Western Tower 4th floor
0x75 : to Western Tower 5th floor
0x76 : to Western Tower 6th floor
0x77 : to Western Tower 7th floor
0x78 : out to staging area

0x7D00 : enter which part of Temenos?
0x7D02 : exit Limbus (time out/final chest)
0x7D03 : exit Limbus menu? (yes->Teleport back out)
--]]

function onRegionEnter(player, regionID)
switch (regionID): caseof {
---------------------------------
[1] = function (x)  -- Temenos West 1F->2F
---------------------------------
  player:startEvent(Event(0x72));
end,

---------------------------------
[2] = function (x)  -- Temenos West 2F->3F
---------------------------------
  player:startEvent(Event(0x73));
end,

---------------------------------
[3] = function (x)  -- Temenos West 3F->4F
---------------------------------
  player:startEvent(Event(0x74));
end,

---------------------------------
[4] = function (x)  -- Temenos West 4F->5F
---------------------------------
  player:startEvent(Event(0x75));
end,

---------------------------------
[5] = function (x)  -- Temenos West 5F->6F
---------------------------------
  player:startEvent(Event(0x76));
end,

---------------------------------
[6] = function (x)  -- Temenos West 6F->7F
---------------------------------
  player:startEvent(Event(0x77));
end,

---------------------------------
[7] = function (x)  -- Temenos East 1F->2F
---------------------------------
  player:startEvent(Event(0x6B));
end,

---------------------------------
[8] = function (x)  -- Temenos East 2F->3F
---------------------------------
  player:startEvent(Event(0x6C));
end,

---------------------------------
[9] = function (x)  -- Temenos East 3F->4F
---------------------------------
  player:startEvent(Event(0x6D));
end,

---------------------------------
[10] = function (x)  -- Temenos East 4F->5F
---------------------------------
  player:startEvent(Event(0x6E));
end,

---------------------------------
[11] = function (x)  -- Temenos East 5F->6F
---------------------------------
  player:startEvent(Event(0x6F));
end,

---------------------------------
[12] = function (x)  -- Temenos East 6F->7F
---------------------------------
  player:startEvent(Event(0x70));
end,


---------------------------------
[13] = function (x)  -- Temenos North 1F->2F
---------------------------------
  player:startEvent(Event(0x64));
end,

---------------------------------
[14] = function (x)  -- Temenos North 2F->3F
---------------------------------
  player:startEvent(Event(0x65));
end,

---------------------------------
[15] = function (x)  -- Temenos North 3F->4F
---------------------------------
  player:startEvent(Event(0x66));
end,

---------------------------------
[16] = function (x)  -- Temenos North 4F->5F
---------------------------------
  player:startEvent(Event(0x67));
end,

---------------------------------
[17] = function (x)  -- Temenos North 5F->6F
---------------------------------
  player:startEvent(Event(0x68));
end,

---------------------------------
[18] = function (x)  -- Temenos North 6F->7F
---------------------------------
  player:startEvent(Event(0x69));
end,

default = function (x)
--print("default");
end,}

end;