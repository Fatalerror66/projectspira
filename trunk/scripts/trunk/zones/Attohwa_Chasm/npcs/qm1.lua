-----------------------------------
--	Author: atkb
-- 	??? (Alastor Antlion)
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Attohwa_Chasm/Zone");

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
item = trade:hasItemQty(0x721,1); --Antlion Trap
if (count == 1 and item) then
	trade:isComplete();
	loc = Zone(0x07);
	loc:spawnMob("AlastorAntlion",-402.574,3.999,-202.75,0,player:getId());
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;