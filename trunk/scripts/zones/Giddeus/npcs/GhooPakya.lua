-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Ghoo Pakya
-- 	Part of Windurst Mission 1-3.
-----------------------------------

require("scripts/globals/rankpoints");
require("scripts/globals/settings");
package.loaded["scripts/zones/Giddeus/TextIDs"] = nil;
require("scripts/zones/Giddeus/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)


-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:hasKeyItem(DrinkOffering) == 1) then
	player:startEvent(Event(0x31));
elseif (player:getMissionStatus(2,2) == 1) and (player:getVar("mission_status") == 2) then
	player:startEvent(Event(0x32));
else
	player:startEvent(Event(0x34));
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
if (csid == 0x31) then
	player:removeKeyItem(DrinkOffering);
	player:specialMessage(KEYITEM_OBTAINED + 1,DrinkOffering);
elseif (csid == 0x32) and DEBUG_MODE then
	player:setPos(-25, -1, 152, 48, 0x91);
end
end;