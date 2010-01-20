-----------------------------------
--	Author: atkb
-- 	??? (Crimson-toothed Pawberry)
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
item = trade:hasItemQty(0x49F,1); --Offering to Uggalepih
if (count == 1 and item) then
	trade:isComplete();
	loc = Zone(0x9F);
	loc:spawnMob("Crimson-toothe",-39.975,-24.499,29.037,0,player:getId());
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;