-----------------------------------
--	Author: Tenjou
-- 	Koko Lihzeh
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
	local event0x1d7 = Event(0x1d7)
	event0x1d7:setParams(0,0x1126);
	player:startEvent(event0x1d7);
else
	player:startEvent(Event(0x1ac));
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