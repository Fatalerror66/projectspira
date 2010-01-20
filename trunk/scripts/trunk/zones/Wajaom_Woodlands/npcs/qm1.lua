-----------------------------------
--	Author: ReaperX
-- 	??? (Vulpangue)
-- 	spawns the Zeni NM Vulpangue when player trades a Hellcage Butterfly 

-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:specialMessage(2043); 
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
pop_item = trade:hasItemQty(2580,1); -- Hellcage Butterfly

if (pop_item) then
	trade:isComplete();
	woodlands = Zone(0x33);
	woodlands:spawnMob("Vulpangue",-695, -8, -124,0,player:getId());
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