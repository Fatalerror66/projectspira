-----------------------------------
--	Author: ReaperX
-- 	Altar of Rancor
--  trading an Unlit Lantern to this gives you a Rancor Flame. 
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
	player:specialMessage(796);
end;
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
 item = trade:hasItemQty(1138,1);
-----------------------------------
-- Trades go below.
-----------------------------------
if (count == 1 and item) then
	trade:isComplete();
	player:addItem(1139)
	player:specialMessage(20,1139);
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;