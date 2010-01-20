-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Laa Mozi
-- 	Part of Windurst Mission 1-3.
-----------------------------------

require("scripts/globals/rankpoints");
require("scripts/globals/settings");
package.loaded["scripts/zones/Giddeus/TextIDs"] = nil;
require("scripts/zones/Giddeus/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)


-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:hasKeyItem(FoodOffering) == 1) then
	player:startEvent(Event(0x2d));
elseif (player:getMissionStatus(2,2) == 1) and (player:getVar("mission_status") == 2) then
	player:startEvent(Event(0x2e));
else
	player:startEvent(Event(0x30));
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
if (csid == 0x2d) then
	player:removeKeyItem(FoodOffering);
	player:specialMessage(KEYITEM_OBTAINED + 1,FoodOffering);
elseif (csid == 0x2e) then
	toLeepeHoppe(player)
end;
end;