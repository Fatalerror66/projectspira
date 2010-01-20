require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0x09;

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
-- Pso'Xja chest anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureChest",0);
--print("Pso'Xja chests illusion time reset.");
end;