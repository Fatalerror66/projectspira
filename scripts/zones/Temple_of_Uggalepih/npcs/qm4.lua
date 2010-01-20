-----------------------------------
--	Author: ReaperX
-- 	??? (Beryl-footed Molberry)
--  default message when clicking on it "There is nothing out of the ordinary here"
--  may be wrong.
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/zones/Temple_of_Uggalepih/Zone");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	player:specialMessage(1060);
end;
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
 item = trade:hasItemQty(1266,1);

if (count == 1 and item) then
	trade:isComplete();
	loc = Zone(0x9F);
	loc:spawnMob("Beryl-footedMo",-62.7,-0.05,3.6,219,player:getId());
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;