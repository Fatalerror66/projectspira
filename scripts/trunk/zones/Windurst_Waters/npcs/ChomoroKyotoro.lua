-----------------------------------
--	Author: Tenjou
-- 	Chomoro-Kyotoro
-- 	Working 100%.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local sow = player:getVar("reapWhatYouSow");
if (sow == 1) then
	player:startEvent(Event(0x1d8));
else
	player:startEvent(Event(0x1b0));
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