-----------------------------------
--	Author: Tenjou
--	FISHERMAN: Degong
--	He should offer guild support  However,he still acts as if you are not a guild member.  This,however,is not a priority.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local event0x271d = Event(0x271d);
event0x271d:setParams(0);
player:startEvent(event0x271d);
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