-----------------------------------
--	Author: atkb
-- 	??? (Hakutaku)
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Den_of_Rancor/Zone");

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
item = trade:hasItemQty(0x512,1); --Hakutaku Eye Cluster
if (count == 1 and item) then
	trade:isComplete();
	loc = Zone(0xA0);
	loc:spawnMob("Hakutaku",26.024,23.037,-309.989,0,player:getId());
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;