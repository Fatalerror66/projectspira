-----------------------------------
--	Author: Tenjou
-- 	Yafa Yaa
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
		player:startEvent(Event(0x17f));
	elseif (onionknow == 2 or onionknow == 3) then
		player:startEvent(Event(0x18d));
	elseif (onionknow == 4) then
		player:startEvent(Event(0x196));
	elseif (onionknow == 5) then
		player:startEvent(Event(0x197));
	end
else
	--Check status of quest "Truth,Justice,and the Onion Way"
	if (oniontruth == 0 or oniontruth == 1) then
	--Before quest
		player:startEvent(Event(0x16d));
	elseif (oniontruth == 2) then
		player:startEvent(Event(0x178));
	elseif (oniontruth == 3) then
		player:startEvent(Event(0x17f));
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