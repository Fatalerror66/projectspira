-----------------------------------
--	Author: ReaperX
-- 	??? (Verdelet)
-- 	spawns the Zeni NM Verdelet when player trades a Mint Drop
--  unknown: text when you click on ??? (and when Verdelet spawns?)
--  I seem to recall that the ??? message was "A sickly sweet fragrance pervades the air..."
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:specialMessage(1614); 
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
pop_item = trade:hasItemQty(2599,1); -- Mint Drop

if (count == 1 and pop_item) then
	--Spawn Tyger
	trade:isComplete();
	mire = Zone(0x4f);
	mire:spawnMob("Verdelet",417,-20,-75,0,player:getId());
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