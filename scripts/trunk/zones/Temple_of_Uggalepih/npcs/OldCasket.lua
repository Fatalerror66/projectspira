-----------------------------------
--	Author: Aurelias
-- 	Obtaining 'Paintbrush of Souls'
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
soul = player:getVar("paintbrush_of_souls")

if(soul == 1) then
	casket = Event(0x0040);
	casket:setParams(0x111);
	player:startEvent(casket);

	elseif(soul == 2) then
	player:specialMessage(880);
else
	player:specialMessage(881);
	end
end;
 


 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);

soul = player:getVar("paintbrush_of_souls")

if(option == 1 and soul == 1) then
	player:setVar("paintbrush_of_souls",2)
	player:specialMessage(23,0x110); --Show Message
	player:addKeyItem(0x110); -- Adding 'Paintbrush of Souls'
	player:removeKeyItem(0x111); --Removing 'Old Rusty Key'
	else
	end
end;
 
 
 
 
