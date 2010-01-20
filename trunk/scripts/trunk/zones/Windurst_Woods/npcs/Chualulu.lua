-----------------------------------
--	Author: Tenjou
-- 	VCS ASSOCIATE: Chualulu
-- 	Provides information about Chocobo Racing,and recruits adventurers for the CRA Windurst team.  Not implemented in pXI yet.
-----------------------------------
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local event0x324 = Event(0x324);
event0x324:setParams(2);
player:startEvent(event0x324);
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