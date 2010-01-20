-- Sandy Mission 9-2 code by ReaperX
---------------------------------
-- Includes
require("/scripts/globals/common");
require("/scripts/globals/settings");
package.loaded["/scripts/zones/FeiYin/TextIDs"] = nil;
require("/scripts/zones/FeiYin/TextIDs");
---------------------------------
-- Initialization
ZONE_ID = 0xCC;
LetterfromDalzakk = 0xBF;
---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
---------------------------------
-- onZoneIn
---------------------------------
function onZoneIn(player,prevZone)
---------------------------------
-- "The First Meeting" Quest. Zone check
if(player:getQuestStatus(1,52) == 1 and player:getVar("temp_TheFirstMeeting") == 1)then
	cs = 0x10;
---------------------------------
elseif ( (player:getMissionStatus(0,14) == 1) or (player:getMissionStatus(1,14) == 1) or (player:getMissionStatus(2,14) == 1)) and (player:getVar("mission_status") == 2) then
	player:setVar("mission_status",3); 
	cs = 1; 																		-- CS for mission 5-1 (all three nations)
elseif (player:getMissionStatus(0,23) == 1) and (player:getVar("mission_status") == 3) then
	player:setVar("mission_status",4);
	cs = 0x17;                                  -- CS for Sandy mission 9-2
elseif (player:getQuestStatus(0,86) == 1) and (player:getVar("peace_for_the_spirit_status") == 1) then
	--print("Spawning Miser Murphy");
	loc = Zone(0xCC);
	loc:spawnMob("MiserMurphy",-25,-16,77,98,nil);	
elseif player:getVar("WHM_AF3_STATUS") == 1 then
	player:setVar("WHM_AF3_STATUS",2);
	cs = 0x13;                                  -- CS for WHM AF3
else
	cs = -1;
end;

return cs;
end;

---------------------------------
-- onInitialize
---------------------------------
function onInitialize(zone)
-- Fei'Yin chest anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureChest",0);
--print("Fei'Yin chest illusion time reset.");
---------------------------------
-- "Scattered into Shadow" quest ghost kill flag
setGlobalVar("DabotzsGhostkilled",0);
---------------------------------
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid == 0x10)then
	player:addKeyItem(LetterfromDalzakk);
	player:specialMessage(KEYITEM_OBTAINED,LetterfromDalzakk);
	player:setVar("temp_TheFirstMeeting",2);
end
end;