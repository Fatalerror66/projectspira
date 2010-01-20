-----------------------------------
--	Author: Aurelias
-- 	???
-- 	Spawns Drone Crawler for quest 'Cargo', 50% chance of spawning
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
  berry = trade:hasItemQty(0x11B1,1);
  count = trade:getItemCount();
    gil = trade:getGil();
success = 0.5;
-----------------------------------
-- Trades go below.
-----------------------------------
if(berry and count == 1 and gil == 0) then
	if(getVanaHour() >= 19 and getVanaHour() < 6)then
		success = success + 0.25;
	end
	math.randomseed();
	math.randomseed();
	math.randomseed();
	diceroll = math.random();
	if(diceroll <= success) then
		loc = Zone(0xC5);
		loc:spawnMob("DroneCrawler",0.278,-0.041,279.421,239,player:getId());
	else
		player:specialMessage(830); -- Nothing happens
	end
	trade:isComplete();
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;