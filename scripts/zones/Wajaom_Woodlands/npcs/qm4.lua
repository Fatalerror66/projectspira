-----------------------------------
--	Author: ReaperX
-- 	??? (Tinnin)
-- 	spawns the Zeni NM Tinnin when player trades a jug of Monkey Wine

-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:specialMessage(2041); 
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
pop_item = trade:hasItemQty(2573,1); -- jug of Monkey Wine

if (pop_item) then
	trade:isComplete();
	woodlands = Zone(0x33);
	woodlands:spawnMob("Tinnin",274,0,-692,0,player:getId());
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