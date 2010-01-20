-- teleporters by ReaperX
-- I'm not sure I got the correct destinations for porters 6 and 7. Needs to be verified.

require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0xA2;

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------


---------------------------------
-- onZoneIn
---------------------------------


---------------------------------
-- onInitialize
---------------------------------

function onInitialize(zone)
-- Castle Zvahl Baileys coffer/chest anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureChest",0);
--print("Castle Zvahl chests illusion time reset.");
registerRegion(0xa2, 1, -301,-297, -50, -49 ,-22,-17 );  -- central porter on map 3
registerRegion(0xa2, 2, -275,-271, -54, -53,  3,   7 );  -- NE porter on map 3
registerRegion(0xa2, 3, -275,-271, -54, -53,-47, -42 );  -- SE porter on map 3
registerRegion(0xa2, 4, -330,-326, -54, -53,  3,   7 );  -- NW porter on map 3
registerRegion(0xa2, 5, -324,-328, -54, -53,-47, -42 );  -- SW porter on map 3
registerRegion(0xa2, 6, -528,-526, -74, -73,  84, 89 );  -- N porter on map 4
registerRegion(0xa2, 7, -528,-526, -74, -73,  30, 36 );  -- S porter on map 4

end;


function onRegionEnter(player, regionID)
switch (regionID): caseof {

---------------------------------
[1] = function (x)  -- 
---------------------------------
  player:startEvent(Event(0x0000)); -- ports player to far NE corner
end,

---------------------------------
[2] = function (x)  -- 
---------------------------------
  --print("porter 2")
  player:startEvent(Event(0x0002)); -- ports player to 
end,

---------------------------------
[3] = function (x)  -- 
---------------------------------
  player:startEvent(Event(0x0001)); -- ports player to far SE corner
end,

---------------------------------
[4] = function (x)  -- 
---------------------------------
  player:startEvent(Event(0x0001)); -- ports player to far SE corner
end,

---------------------------------
[5] = function (x)  -- 
---------------------------------
  player:startEvent(Event(0x0005)); -- ports player to H-7 on map 4 (south or north part, randomly)
end,

---------------------------------
[6] = function (x)  -- 
---------------------------------
  player:startEvent(Event(0x0006)); -- ports player to position "A" on map 2
end,

---------------------------------
[7] = function (x)  -- 
---------------------------------
  player:startEvent(Event(0x0007)); -- ports player to position G-8 on map 2
end,


default = function (x)
--print("default");
end,}
end;
