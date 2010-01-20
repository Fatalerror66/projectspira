-----------------------------------
--	Author: Aurelias
-- 	???
-- 	Spawns Matron Crawler for quest 'Cargo', 35% chance of spawning
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
berry = trade:hasItemQty(0x11B2,1);
count = trade:getItemCount();
if(cargo == 1 and berry) then
spawn = math.random(1,20);
if(spawn <= 7) then
	loc = Zone(0xC5);
	loc:spawnMob("MatronCrawler",-137.534,-32.736,25.087,112,player:getId());
	player:removeItem(0x11B2)
else
	player:specialMessage(830);
	player:removeItem(0x11B2)
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