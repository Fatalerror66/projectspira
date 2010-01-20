-----------------------------------
--	Author: ChrisKAra10
-- 	Somn-Paemn
-- 	Regional Merchant INCOMPLTE
-----------------------------------
--	836 Sarutabaruta
--	837 Kolushushu
--	838 Aragoneu
--	839 Elshimo
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:showText(npc,836);
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