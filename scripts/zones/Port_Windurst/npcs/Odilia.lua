-----------------------------------
--	Author: Tenjou
-- 	Odilia
-- 	Seems to change dialogue if you talk to Paytah first.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local paytah = player:getVar("paytah");
if (paytah == 1) then
	player:startEvent(Event(0x122));
else
	player:startEvent(Event(0x121));
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