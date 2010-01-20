-----------------------------------
--	Author: Tenjou
-- 	Bopa Greso
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
	player:startEvent(Event(0x54));
elseif (amigo == 2) then
	local event0x5a = Event(0x5a);
	event0x5a:setParams(0,0x1f2);
	player:startEvent(event0x5a);
elseif (player:getVar("THF_AF2_status") == 1) then
	player:startEvent(Event(0x1FA));
else
	player:startEvent(Event(0x4d));
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