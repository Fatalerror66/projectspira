-----------------------------------
--	Author: Tenjou
--	MASTER FISHERMAN: Panja-Nanja
--	He should offer advanced guild support with this copied packet.  However,he still acts as if you are not a guild member.  This,however,is not a priority.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local event0x271b = Event(0x271b);
event0x271b:setParams(0,0xfa5c,0x336ec,0x3c,1,0,0,0x1e);
player:startEvent(event0x271b);
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