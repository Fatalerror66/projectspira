-----------------------------------
--	Author: Aurelias
-- 	???
-- 	Spawns Golden-Tongued Culberry
-----------------------------------

-- Includes
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	player:specialMessage(1057);
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)

	count = trade:getItemCount();
	NQ = trade:hasItemQty(0x465E,1); 
	HQ = trade:hasItemQty(0x4660,1); 
	loc = Zone(0x9);
	
if(count == 1 and NQ == true) then 
	trade:isComplete();
	player:specialMessage(1058,0x465E);
	loc:spawnMob("Golden-Tongued",-266.770,31.521,262.157,52351,player:getId());
elseif(count == 1 and HQ == true) then 
	trade:isComplete();
	player:specialMessage(1058,0x4660);
	loc:spawnMob("Golden-Tongued",-266.770,31.521,262.157,52351,player:getId());
else
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;