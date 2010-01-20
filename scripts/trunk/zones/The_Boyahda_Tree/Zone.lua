require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0x99;

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
-- Beadeaux coffer anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureCoffer",0);
--print("The Boyahda Tree coffers illusion time reset.");
end;