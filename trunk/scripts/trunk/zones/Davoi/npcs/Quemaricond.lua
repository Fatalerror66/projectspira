-----------------------------------
--	Author: ReaperX
-- 	Quemaricond
-- 	Involved in Sandy Mission 3-1 "Infiltrate Davoi"
-----------------------------------

require("scripts/globals/rankpoints");
require("scripts/globals/settings");
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
require("scripts/zones/Davoi/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
if (player:getMissionStatus(0,10) == 1) and (player:getVar("mission_status") == 3) then
  player:startEvent(Event(0x75));
elseif (player:getMissionStatus(0,10) == 1) and (player:getVar("mission_status") == 4) then
  player:showText(npc,SANDY_MISSION_OFFSET + 96);
  if (DEBUG_MODE) then
 		player:setPos(-38, -3, 67, 192, 0xE9);	-- to Prince Trion's Chamber
 	end;
else
	player:showText(npc,SANDY_MISSION_OFFSET + 91);
end;
end; 

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x75) then
	player:setVar("mission_status",4);
	player:addKeyItem(RoyalKnightsDavoiReport);
	player:specialMessage(KEYITEM_OBTAINED,RoyalKnightsDavoiReport);
end;
end;
