-----------------------------------
--	Author: atkb
-- 	??? (Sozu Rogberry)
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Temple_of_Uggalepih/Zone");

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
item = trade:hasItemQty(0x953,1); --Flickering Lantern
if (count == 1 and item) then
	trade:isComplete();
	loc = Zone(0x9F);
	loc:spawnMob("SozuRogberry",222.951,-8.004,259.803,0,player:getId());
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;