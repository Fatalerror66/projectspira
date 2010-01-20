-- Added the map4 teleporters from memory.. I think they always take you to room in map 2 that 
-- corresponds to the same direction (NE,NW,SE,SW). 
-- bug: there's a LUA error: cannot open: Invalid argument after each port. I can't figure out
-- what's causing that, but the ports work anyway.-ReaperX

require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0xA1;
---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------


---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
cs = -1;
return cs;
end;


---------------------------------
-- onInitialize
---------------------------------

function onInitialize(zone)
-- Castle Zvahl Baileys coffer/chest anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureCoffer",0);
setGlobalVar("["..ZONE_ID.."]TreasureChest",0);
--print("Castle Zvahl coffers/chests illusion time reset.");

--registerRegion(zoneID, regionID, west, east, high, low , south, north ); 

registerRegion(0xa1, 1, -90, -85, 17, 18 , 45, 51 );  -- map 4 NW porter 
registerRegion(0xa1, 2, -90, -85, 17, 18 ,-10, -5 );  -- map 4 SW porter 
registerRegion(0xa1, 3, -34, -30, 17, 18 ,-10, -5 );  -- map 4 SE porter 
registerRegion(0xa1, 4, -34, -30, 17, 18 , 45, 51 );  -- map 4 NE porter 

--print("Castle Zvahl Baileys Teleporters Initialized.");
end;

function onRegionEnter(player, regionID)

switch (regionID): caseof {

---------------------------------
[1] = function (x)  -- 
---------------------------------
  player:startEvent(Event(0x0003)); -- ports player to NW room of map 3
end,

---------------------------------
[2] = function (x)  -- 
---------------------------------
  player:startEvent(Event(0x0002)); -- ports player to SW room of map 3
end,

---------------------------------
[3] = function (x)  -- 
---------------------------------
  player:startEvent(Event(0x0001)); -- ports player to SE room of map 3
end,

---------------------------------
[4] = function (x)  -- 
---------------------------------
  player:startEvent(Event(0x0000)); -- ports player to NE room of map 3
end,

default = function (x)
--print("default");
end,}

end;

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,option)
--print("CSID",csid);
--print("OPTION",option);
end;