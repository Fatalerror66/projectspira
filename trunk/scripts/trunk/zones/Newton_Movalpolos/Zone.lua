require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0x0C;

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
-- Newton Movalpolos coffer anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureCoffer",0);
--print("Newton Movalpolos coffers illusion time reset.");
end;