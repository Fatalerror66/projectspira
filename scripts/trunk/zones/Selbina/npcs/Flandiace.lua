-----------------------------------
--	Author: Arcanedemon
-- 	Flandiace
-- 	Basic Chat Text
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
FirstVisit = player:getVar("SelbinaFirstVisit");
if (FirstVisit == 0) then
	player:startEvent(Event(0x000C));
	player:setVar("SelbinaFirstVisit",1);
else
	player:startEvent(Event(0x000D));
end
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