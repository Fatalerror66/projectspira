require("/scripts/globals/common");
require("/scripts/globals/settings");
require("scripts/zones/Den_of_Rancor/settings");

ZONE_ID = 0xA0;

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------


---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
cs = -1;
return cs;
end;

---------------------------------
-- onInitialize
---------------------------------
function onInitialize(zone)
---------------------------------
-- Den of Rancor coffer anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureCoffer",0);
--print("Den of Rancor coffers illusion time reset.");
---------------------------------
-- Den of Rancor Lanterns reset
setGlobalVar("rancor_lantern_ne_last_lit",os.time()-LANTERNS_STAY_LIT)
setGlobalVar("rancor_lantern_nw_last_lit",os.time()-LANTERNS_STAY_LIT)
setGlobalVar("rancor_lantern_se_last_lit",os.time()-LANTERNS_STAY_LIT)
setGlobalVar("rancor_lantern_sw_last_lit",os.time()-LANTERNS_STAY_LIT)
--print("Den of Rancor Lanterns reset.");
---------------------------------
end;