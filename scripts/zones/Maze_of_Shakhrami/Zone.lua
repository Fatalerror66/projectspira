require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0xC6;

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
-- Maze of Shakhrami chest anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureChest",0);
--print("Maze of Shakhrami chests illusion time reset.");
setGlobalVar("IchorousIreTOD",os.time())
setGlobalVar("ShakhramiWyrmfly",0);
end;