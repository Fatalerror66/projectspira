require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0x91;

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
-- Giddeus chest anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureChest",0);
--print("Giddeus chests illusion time reset.");
end;