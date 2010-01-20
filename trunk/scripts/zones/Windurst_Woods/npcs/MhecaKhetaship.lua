-----------------------------------
--	Author: Tenjou
-- 	Mheca Khetashipah
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
local amigo = player:getVar("mihgosAmigo");
if (amigo == 1) then
	player:startEvent(Event(0x53));
else
	player:startEvent(Event(0x4f));
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