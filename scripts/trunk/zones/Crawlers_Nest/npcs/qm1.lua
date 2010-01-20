-----------------------------------
--	Author: Aurelias
-- 	???
-- 	Spawns Guardian Crawler for quest 'Cargo', 30% chance of spawning
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------


end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
--print("count: " .. count);
-----------------------------------
-- Trades go below.
-----------------------------------
cargo = player:getVar("Cargo_Selbina");
berry = trade:hasItemQty(0x110D,1);
count = trade:getItemCount();
if(cargo == 1 and berry) then
spawn = math.random(1,5);
if(spawn <= 2) then
	loc = Zone(0xC5);
	loc:spawnMob("GuardianCrawle",118.676,-32.100,-79.178,212,player:getId());
	player:removeItem(0x110D)
else
	player:specialMessage(830);
	player:removeItem(0x110D)
end
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("OPTION:",option);
end;