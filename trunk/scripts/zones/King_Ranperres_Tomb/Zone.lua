require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0xBE;

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
-- King Ranperre's Tomb chest anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureChest",0);
--print("King Ranperre's Tomb chests illusion time reset.");
registerRegion(ZONE_ID, 1,  -85, -77, 8, 5 , -121, -115 ); 
setGlobalVar("Sandy_6_2_Fight",0);
setGlobalVar("Sandy_6_2_LastClear",os.time()-QM_RESET_TIME);
end;

function onRegionEnter(player, regionID)

switch (regionID): caseof {
---------------------------------
[1] = function (x)
---------------------------------
	player:startEvent(Event(0x9));
end,
default = function (x)
--print("default");
end,}
end;