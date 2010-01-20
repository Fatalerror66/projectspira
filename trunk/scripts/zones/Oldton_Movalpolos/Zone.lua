require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0x0B;

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
-- Oldton Movalpolos chest anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureChest",0);
--print("Oldton Movalpolos chests illusion time reset.");
end;