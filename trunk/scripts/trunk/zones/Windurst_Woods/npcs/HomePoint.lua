-----------------------------------
--	Author: Arcanedemon
-- 	Home Point
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
player:startEvent(Event(0x2711));
end; 

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
npc = player:getTarget();
if (option == 0) then
	
	
	
	
	player:setHomePoint();
	math.randomseed(os.time());
	Text = math.random(0,1);
	Text = math.random(0,1);
	Text = math.random(0,1);
	if (Text == 0) then
		player:showText(npc,2285);
	else
		player:showText(npc,225);
	end
end
end;