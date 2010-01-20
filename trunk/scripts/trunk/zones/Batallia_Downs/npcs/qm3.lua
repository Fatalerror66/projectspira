-----------------------------------
-- ??? @ J-11 Batallia (near Stone Monument) (for Sandy Mission 9-1 "Breaking Barriers")
-- Author: ReaperX
-- 
-- pops NMs Suparna and Suparna Fledgling. Pop positions verified from
-- http://www.youtube.com/watch?v=UeBIpQ4wXJs
-----------------------------------

require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Batallia_Downs/TextIDs"] = nil;
require("scripts/zones/Batallia_Downs/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

mission_status = player:getVar("mission_status");
mobsup = getGlobalVar("Sandy_9_1_Fight");                           -- how many mobs are still up
timesincelastclear = os.time()-getGlobalVar("Sandy_9_1_LastClear"); -- how long ago they were last killed.

if (player:getMissionStatus(0,22) == 1) and (mission_status == 4) then
	if (timesincelastclear < QM_RESET_TIME) then
		player:startEvent(Event(0x388));
	elseif (mobsup == 0) then
		loc = Zone(0x69);
		loc:spawnMob("Suparna",217, 16, -609,128,player:getId());      -- video shows this one popped claimed
		loc:spawnMob("SuparnaFledgli",205, 14, -612,192,nil);
		player:specialMessage(1150); 	--	"You sense something lurking close by!"
		setGlobalVar("Sandy_9_1_Fight",2)
  else	
  	-- not implemented: depop the ??? until mobs die.
  end;
else
  player:specialMessage(1149); -- "Someone has buried something here."
  if (DEBUG_MODE) and (player:hasKeyItem(FigureOfLeviathan) == 1) then
 		player:setPos(0, -2, 8, 192, 0xE9);	-- to Great Hall
 end
end;
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x388) then
	player:addKeyItem(FigureOfLeviathan);
	player:specialMessage(KEYITEM_OBTAINED,FigureOfLeviathan);
	player:setVar("mission_status",6);
end;
end;