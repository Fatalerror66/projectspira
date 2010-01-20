-----------------------------------
--	Author: ReaperX
-- 	??? (Gotoh Zha the Redolent)
-- 	spawns the Zeni NM Gotoh Zha the Redolent when player trades a Sheep Botfly

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
pop_item = trade:hasItemQty(2575,1); -- bagged sheep botfly

if (pop_item) then
	trade:isComplete();
	woodlands = Zone(0x33);
	woodlands:spawnMob("GotohZhatheRed",-341,-32,679,0,player:getId());
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