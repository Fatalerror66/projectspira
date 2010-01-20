require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0x7C;

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
-- Ghelsba & Yughott Grotto chest anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureChest",0);
--print("Ghelsba & Yughott Grotto chests illusion time reset.");
end;