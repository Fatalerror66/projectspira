require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0x9F;

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,menuchoice) 
end;

---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
end;


---------------------------------
---   Initialize code here ...   ----------------
---------------------------------
function onInitialize()
---------------------------------
-- Temple of Uggalepih coffer anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureCoffer",0);
--print("Temple of Uggalepih coffers illusion time reset.");
---------------------------------
-- "Axe The Competition" kill mob timer
setGlobalVar("YalleryBrownkilled",0);

setGlobalVar("Sandy_8_2_Fight",0);
setGlobalVar("Sandy_8_2_LastClear",os.time()-QM_RESET_TIME);
---------------------------------
registerRegion(ZONE_ID, 1, 332, 346, -1, 1 , 332, 347 ); -- secret library J-6 map 3
end;

function onRegionEnter(player,regionID)
if (regionID == 1) and (player:getMissionStatus(2,19) == 1) and (player:getVar("mission_status") == 4) then
	player:setVar("mission_status",5);
	player:startEvent(Event(0x17));
end
end

