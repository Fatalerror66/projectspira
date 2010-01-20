-----------------------------------
--	Author: Aurelias
-- 	???
-- 	Spawns Olla pots
-----------------------------------

-- Includes
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	npcname = npc:getName();
	npcid = npc:getId();
	player:specialMessage(893);
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
	count = trade:getItemCount();
	water = trade:hasItemQty(0x4AB,1);
	timer = getGlobalVar("OllaPotsKilled");
	if(timer < os.time() and count == 1 and water == true) then
	trade:isComplete();
	player:specialMessage(896);
	sky = Zone(0xb2);
	sky:spawnMob("OllaPequena",848.673,0,92.596,237,player:getId());
	end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;