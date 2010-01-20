require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0xD5;

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
-- Labyrinth of Onzozo chest anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureChest",0);
--print("Labyrinth of Onzozo chests illusion time reset.");
end;