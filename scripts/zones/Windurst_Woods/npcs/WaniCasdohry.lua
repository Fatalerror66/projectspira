-----------------------------------
--	Author: Tenjou
-- 	Wani Casdohry
-- 	Working 100%.  Changes dialogue during quest "Mihgo's Amigo"
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
	local event0x56 = Event(0x56);
	event0x56:setParams(0,0x1f2);
	player:startEvent(event0x56);
else
	player:startEvent(Event(0x1a9));
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