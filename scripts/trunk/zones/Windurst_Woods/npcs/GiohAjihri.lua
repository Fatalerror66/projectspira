-----------------------------------
--	Author: Tenjou
-- 	Gioh Ajihri
-- 	Starts quest "Lost Chick" (not yet implemented).  Also changes dialogue during quest "Mihgo's Amigo"
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
	player:startEvent(Event(0x57));
else
	player:startEvent(Event(0x1a8));
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
player:updateEvent(0);
--player:sendRelease();
end;