require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0x1C;

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
-- Sacrarium anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureChest",0);
--print("Sacrarium chests illusion time reset.");
end;