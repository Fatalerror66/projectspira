require("scripts/globals/common");
require("scripts/globals/settings");
require("scripts/globals/rankpoints");

ZONE_ID = 0xA9;

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,menuchoice) 
end;

---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
cs = -1;
return cs;
end;


---------------------------------
---   Initialize code here ...   ----------------
---------------------------------

function onInitialize()
-- Toraimarai Canal coffer anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureCoffer",0);
--print("Toraimarai Canal coffers illusion time reset.");
setGlobalVar("HingeOilsUp",0);
end;

