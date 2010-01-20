require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0xC3;

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
-- The Eldieme Necropolis coffer anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureCoffer",0);
setGlobalVar("["..ZONE_ID.."]TreasureChest",0);
--print("The Eldieme Necropolis coffers illusion time reset.");
end;