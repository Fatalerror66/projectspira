-----------------------------------
--	Author: Arcanedemon, Almendro
-- 	HomePoint
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
if (HOMEPOINT_HEAL == 1) then
	player:addHP(player:getMaxHP());
	player:addMP(player:getMaxMP());
end
player:startEvent(Event(0x5E));
end; 

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (option == 0) then	
	player:setHomePoint();
	player:specialMessage(93);
end
end;