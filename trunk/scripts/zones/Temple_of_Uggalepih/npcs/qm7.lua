-----------------------------------
--	Author: atkb
-- 	??? (Death from Above)
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
item = trade:hasItemQty(0x4F3,1); --Bag of Bee Larvae
if (count == 1 and item) then
	trade:isComplete();
	loc = Zone(0x9F);
	loc:spawnMob("DeathfromAbove",54.436,1.494,-61.769,0,player:getId());
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;