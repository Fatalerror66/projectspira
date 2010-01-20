-----------------------------------
--	Author: atkb
-- 	Tillecoe
-- 	Description,especially related to what needs to be done,what can and can't be done,what has and hasn't been done,etc.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:startEvent(Event(0x0049));
-- player:startEvent(Event(0x0046)); -- If you have the Ballista License
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