-----------------------------------
--	Author: Tenjou
--	ELSHIMO UPLANDS REGIONAL MERCHANT: Sattsuh Ahkanpari
--	line 2614 is when Windurst controls the region
--	line 2615 is when Windurst does not control the region
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:showText(npc,2615);
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;