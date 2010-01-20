-----------------------------------
--	Author: Tenjou
-- 	Chyuk-Kochak
-- 	Involved in quest "Making Headlines"
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local news = player:getVar("makingHeadlines");
if (news == 1 or news == 2 or new == 3) then
	player:startEvent(Event(0x29b));
elseif (news == 4) then
	player:startEvent(Event(0x2a3));
elseif (news == 5) then
	player:startEvent(Event(0x2a0));
else
	--normal text
	player:startEvent(Event(0x298));
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