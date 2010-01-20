-----------------------------------
--	Author: Tenjou
-- 	Pechiru-Mashiru
-- 	Involved in quest "Hat in Hand."
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local hat = player:getVar("hatInHand");
local pechirumashiru = player:getVar("hatInHand-PechiruMashiruCS");
if (hat == 1 and pechirumashiru == 0) then
	--NEEDS A PACKET 2A
	player:startEvent(Event(0x36));
	player:setVar("hatInHand-PechiruMashiruCS",1);
else
	player:startEvent(Event(0x1a5));
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