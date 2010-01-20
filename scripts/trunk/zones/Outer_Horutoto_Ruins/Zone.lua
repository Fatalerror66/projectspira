require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0xC2;

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
-- Horutoto Ruins chest anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureChest",0);
--print("Horutoto Ruins chests illusion time reset.");
setGlobalVar("Windy_6_1_Fight",0);
setGlobalVar("Windy_8_2_Fight",0);
setGlobalVar("Windy_6_1_LastClear",os.time()-QM_RESET_TIME);
setGlobalVar("Windy_8_2_LastClear",os.time()-QM_RESET_TIME);
end;
 
 
function onRegionEnter(player, regionID)
end;