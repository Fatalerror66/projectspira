-----------------------------------
--	Author: Tenjou
-- 	Machitata
-- 	Involved in quest "Hat in Hand."  Also explains mog houses.
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
local machitata = player:getVar("hatInHand-MachitataCS");
if (hat == 1 and machitata == 0) then
	--NEEDS A PACKET 2A
	player:startEvent(Event(0x3a));
	player:setVar("hatInHand-MachitataCS",1);
else
	player:startEvent(Event(0x3d8));
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