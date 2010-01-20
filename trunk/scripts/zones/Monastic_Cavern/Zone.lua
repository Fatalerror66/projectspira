require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0x96;

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
-- Monastic Cavern coffer anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureCoffer",0);
--print("Monastic Cavern coffers illusion time reset.");
end;