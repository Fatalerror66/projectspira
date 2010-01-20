-----------------------------------
--	Author: Tenjou
-- 	Akkeke
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
	local event0x1d4 = Event(0x1d4)
	event0x1d4:setParams(0,0x26b);
	player:startEvent(event0x1d4);
else
	player:startEvent(Event(0x1ab));
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