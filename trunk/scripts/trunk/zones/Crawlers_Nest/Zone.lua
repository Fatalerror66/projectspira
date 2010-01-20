require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0xC5;

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
-- Crawlers' Nest Baileys coffer/chest anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureCoffer",0);
setGlobalVar("["..ZONE_ID.."]TreasureChest",0);
--print("Crawler's Nest coffers/chests illusion time reset.");
end;