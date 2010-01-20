-----------------------------------
--	Author: ReaperX
-- 	??? (Iriz Ima)
-- 	spawns the Zeni NM Iriz Ima when player trades a Senorita Pamama

-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:specialMessage(2045); 
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
pop_item = trade:hasItemQty(2577,1); -- Senorita Pamama

if (pop_item) then
	trade:isComplete();
	woodlands = Zone(0x33);
	woodlands:spawnMob("IrizIma",256,-24,117,0,player:getId());
	-- player:showText(npc,); 
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;