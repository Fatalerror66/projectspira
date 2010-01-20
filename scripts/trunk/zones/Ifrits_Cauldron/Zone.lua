require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0xCD;

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
-- Ifrit's Cauldron coffer anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureCoffer",0);
--print("Ifrit's Cauldron coffers illusion time reset.");
end;