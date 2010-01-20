-----------------------------------
--	Author: Tenjou
-- 	Clais
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
local clais = player:getVar("hatInHand-ClaisCS");
if (hat == 1 and clais == 0) then
	--NEEDS A PACKET 2A
	player:startEvent(Event(0x39));
	player:setVar("hatInHand-ClaisCS",1);
else
	player:startEvent(Event(0x25a));
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