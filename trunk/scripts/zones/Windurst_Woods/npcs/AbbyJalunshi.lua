-----------------------------------
--	Author: Tenjou
-- 	Abby Jalunshi
--	Explains Mog Houses to players.  Event parameters unknown right now.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local event0x31e = Event(0x31e);
event0x31e:setParams(0,0,0,0,0,0,0,0);
player:startEvent(event0x31e);
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