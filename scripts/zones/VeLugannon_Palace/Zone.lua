require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0xB1;

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
-- Ve'Lugannon Palace coffer anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureCoffer",0);
--print("Ve'Lugannon Palace coffers illusion time reset.");
end;