-----------------------------------
--	Author: Tenjou
-- 	Pichichi
-- 	Involved in Star Onion Bridage quests.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local onion = player:getVar("starOnionBrigadeQuests");
local oniontruth = player:getVar("truthJusticeAndTheOnionWay");
local onionknow = player:getVar("knowOnesOnions");
if (onion == 1) then
	--Check status of quest "Know One's Onions"
	if (onionknow == 1) then
		player:startEvent(Event(0x181));
	elseif (onionknow == 2 or onionknow == 3) then
		player:startEvent(Event(0x18b));
	elseif (onionknow == 4) then
		player:startEvent(Event(0x19a));
	elseif (onionknow == 5) then
		player:startEvent(Event(0x19b));
	end
else
	--Check status of quest "Truth,Justice,and the Onion Way"
	if (oniontruth == 0 or oniontruth == 1) then
	--Before quest
		player:startEvent(Event(0x16c));
	elseif (oniontruth == 2) then
		player:startEvent(Event(0x176));
	elseif (oniontruth == 3) then
		player:startEvent(Event(0x181));
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