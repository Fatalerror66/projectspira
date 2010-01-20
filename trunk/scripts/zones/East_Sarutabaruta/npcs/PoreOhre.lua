-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Pore-Ohre
-- 	Involved in Windurst Mission 1-2.
-----------------------------------

require("scripts/globals/rankpoints");
require("scripts/globals/settings");
package.loaded["scripts/zones/East_Sarutabaruta/TextIDs"] = nil;
require("scripts/zones/East_Sarutabaruta/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
mission_status = player:getVar("mission_status");
if (player:getMissionStatus(2,1) == 1) and (mission_status == 2) then
	player:startEvent(Event(0x2e));
elseif (player:getMissionStatus(2,1) == 1) and (mission_status == 3) then
	player:startEvent(Event(0x2f));
elseif (player:getMissionStatus(2,1) == 1) and (mission_status == 7) then
	player:startEvent(Event(0x31));
else
	player:startEvent(Event(0x2d));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x2e) then
	player:addKeyItem(SoutheasternStarCharm);
	player:setVar("mission_status",3);
	player:specialMessage(KEYITEM_OBTAINED,SoutheasternStarCharm);
end
end; 