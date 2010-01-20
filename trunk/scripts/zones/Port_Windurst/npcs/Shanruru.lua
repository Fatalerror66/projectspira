-----------------------------------
--	Author: Tenjou
-- 	Shanruru
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
	if (onionknow == 4 or onionknow == 5) then
		player:startEvent(Event(0x19c));
	else
		player:startEvent(Event(0x180));
	end
else
	--Check status of quest "Truth,Justice,and the Onion Way"
	if (oniontruth == 0 or oniontruth == 1) then
	--Before quest
		player:startEvent(Event(0x16f));
	elseif (oniontruth == 2) then
		player:startEvent(Event(0x179));
	elseif (oniontruth == 3) then
		player:startEvent(Event(0x180));
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