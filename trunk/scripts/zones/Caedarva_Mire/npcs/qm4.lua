-----------------------------------
--	Author: ReaperX
-- 	??? (Tyger)
-- 	spawns the Zeni NM Tyger when player trades a Singed Buffalo
--  unknown: text when you click on ??? (and when Tyger spawns?)
--  I provisionally put in "The ground is smeared with bloodstains" since it seems to fit.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:specialMessage(1617); 
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
pop_item = trade:hasItemQty(2593,1); -- Singed Buffalo

if (count == 1 and pop_item) then
	--Spawn Tyger
	trade:isComplete();
	mire = Zone(0x4f);
	mire:spawnMob("Tyger",-757,-13,630,0,player:getId());
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