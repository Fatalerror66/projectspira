-----------------------------------
--	Author: Aurelias
-- 	???
-- 	Spawns the Morion Worm
-----------------------------------

-- Includes
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	player:specialMessage(886);
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
	count = trade:getItemCount();
	IronOre = trade:hasItemQty(643,1)
	npcX = npc:getXPos();
	npcY = npc:getYPos();
	npcZ = npc:getZPos();
if(count == 1 and IronOre)then
	trade:isComplete();
	loc = Zone(0xAD);
	loc:spawnMob("MorionWorm",npcX,npcY,npcZ,34,player:getId());
else
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;