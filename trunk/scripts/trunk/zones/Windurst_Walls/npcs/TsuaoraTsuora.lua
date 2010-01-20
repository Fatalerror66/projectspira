-----------------------------------
--	Author: Tenjou
-- 	Tsuaora-Tsuora
-- 	Changes dialogue during quest "The Postman Always K.O.s Twice"
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local mail = player:getVar("thePostmanAlwaysKOsTwice");
local postal = math.random();
if (mail == 0) then
	player:startEvent(Event(0x2a));
elseif (mail == 1) then
	player:startEvent(Event(0x32));
else
	if (postal >= .5) then
		player:startEvent(Event(0x2a));
	else
		player:startEvent(Event(0x32));
	end
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