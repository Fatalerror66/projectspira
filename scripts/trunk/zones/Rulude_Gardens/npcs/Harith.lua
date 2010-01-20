-----------------------------------
--	Author: Arcanedemon, ReaperX, Tenjou
-- 	Harith
-- 	CoP Mission 1.2 "Below the Arks"
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
arks = player:getVar("belowTheArks");
if (arks == 1) then 
  event = Event(0x006F)
  player:startEvent(event);
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