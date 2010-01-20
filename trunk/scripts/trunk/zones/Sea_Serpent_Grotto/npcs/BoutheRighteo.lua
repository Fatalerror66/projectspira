-----------------------------------
--	Author: Bababooey
-- 	Bou the Righteous (-126.6, 47.6, -337.6)
-- 	Part of the Ornamented Door (Sahagin key) mini-quest
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:startEvent(Event(0x006C));
player:setVar("SahaginKeyCS-Bou",1);
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