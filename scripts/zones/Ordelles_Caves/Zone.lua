require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0xC1;

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
-- Ordelle's Caves chest anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureChest",0);
--print("Ordelle's Caves chests illusion time reset.");
setGlobalVar("OrdelleNecroplasm",0);
end;