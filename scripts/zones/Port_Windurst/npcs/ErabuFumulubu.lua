-----------------------------------
--	Author: Tenjou
--	FISHERMAN: Erabu-Fumulubu
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
local event0x271c = Event(0x271c);
event0x271c:setParams(0);
player:startEvent(event0x271c);
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