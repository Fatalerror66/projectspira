require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0x8F;

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
-- Palborough Mines chest anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureChest",0);
--print("Palborough Mines chests illusion time reset.");
end;