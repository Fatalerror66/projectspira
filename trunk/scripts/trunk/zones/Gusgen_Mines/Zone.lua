require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0xC4;

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
-- Gusgen mines chest anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureChest",0);
--print("Gusgen Mines chests illusion time reset.");
setGlobalVar("GusgenPudding",0);
end;