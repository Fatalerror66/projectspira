-----------------------------------
--	Author: atkb
-- 	??? (Bomb Queen)
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Ifrits_Cauldron/Zone");

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
item1 = trade:hasItemQty(0x4A2,1); -- Bomb Queen Core
item2 = trade:hasItemQty(0x4A3,3); -- Pinch of Bomb Queen Ash
if (count == 4 and item1 and item2) then
	trade:isComplete();
	loc = Zone(0xCD);
	loc:spawnMob("BombQueen",19.948,20.007,-108.745,189,player:getId());
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;