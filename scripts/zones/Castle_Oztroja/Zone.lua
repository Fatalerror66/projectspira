require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0x97;
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
-- Castle Oztroja coffer/chest anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureCoffer",0);
setGlobalVar("["..ZONE_ID.."]TreasureChest",0);
--print("Castle Oztroja coffers/chests illusion time reset.");
end;