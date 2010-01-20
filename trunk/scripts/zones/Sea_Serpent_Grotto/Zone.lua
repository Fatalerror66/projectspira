require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0xB0;

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------


---------------------------------
-- onZoneIn
---------------------------------
function onZoneIn(player,prevZone)
player:setVar("SahaginKeyCS-Bou",0);
player:setVar("SahaginKeyCS-Hurr",0);
end;

---------------------------------
-- onInitialize
---------------------------------

function onInitialize(zone)
-- Sea Serpent Grotto coffer/chest anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureCoffer",0);
setGlobalVar("["..ZONE_ID.."]TreasureChest",0);
--print("Sea Serpent Grotto coffers/chests illusion time reset.");

--SSG Speech offset: Begins with "Something fishy Hurr making....."
SSG_SPEECH_OFFSET = 880;
end;