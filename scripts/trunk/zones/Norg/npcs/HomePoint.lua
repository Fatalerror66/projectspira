-----------------------------------
--	Author: Arcanedemon
-- 	HomePoint
-----------------------------------
require("scripts/globals/settings");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
if (HOMEPOINT_HEAL == 1) then
	player:addHP(player:getMaxHP());
	player:addMP(player:getMaxMP());
end
player:startEvent(Event(0x03E8));
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
npc = player:getTarget();
if (option == 0) then
	
	
	
	
	player:setHomePoint();
	player:showText(npc,2);
end
end;