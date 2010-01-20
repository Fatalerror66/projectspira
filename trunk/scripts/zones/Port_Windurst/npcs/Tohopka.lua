-----------------------------------
--	Author: Tenjou
-- 	Tohopka
-- 	Involved in quest "To Catch a Falling Star."  There may be additional requirements to this quest,however it is unclear at this time.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
starfall = player:getVar("toCatchAFallingStar");
if (starfall == 2) then
--during quest
	local event0xc6 = Event(0xc6);
	event0xc6:setParams(0,0x222,0x364);
	player:startEvent(event0xc6);
elseif (starfall == 3) then
--after quest
	player:startEvent(Event(0xc9));
else
	player:startEvent(Event(0x166));
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