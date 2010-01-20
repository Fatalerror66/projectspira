-----------------------------------
--	Author: ReaperX
-- 	Altar of Rancor (flame of crimson rancor)
--  trading an Unlit Lantern to this gives you a crimson rancor flame. 
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
player:specialMessage(796);
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
item = trade:hasItemQty(1138,1); --
if (count == 1 and item) then
	trade:isComplete();
	player:addItem(1139)
	player:specialMessage(20,1140);
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;