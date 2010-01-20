-----------------------------------
--	Author: Tenjou
-- 	Ten of Hearts
-- 	Changes dialogue based on Windurst Mission status.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)


nation = player:getNation();
race = player:getRace();
job = player:getMainJob();
money = player:getCurrGil();

--Mission Flags--
windymission = player:getVar("windurstMissions");
windyoneone = player:getVar("theHorutotoRuinsExperiment");
windyonetwo = player:getVar("theHeartOfTheMatter");
windyonethree = player:getVar("thePriceOfPeace");
windyonethreef = player:getVar("thePriceOf-LeppeHoppeCS");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--Standard,non-Windurst player dialogue--
if (nation ~= 2) then
	local event0x72 = Event(0x72);
	event0x72:setParams(nation);
	player:startEvent(event0x72);
else --Windurst player dialogue (most cases)
	if (windymission == 12) then
		--Check status of Windurst Mission 1-2--
		if (windyonetwo == 0) then
			player:startEvent(Event(0x81));
		elseif (windyonetwo == 1 or windyonetwo == 2) then
			player:startEvent(Event(0x86));
		else
			player:startEvent(Event(0x81));
		end
	elseif (windymission == 13) then
		--Check status of Windurst Mission 1-3--
		if (windyonethree == 0) then
			player:startEvent(Event(0x81));
		elseif (windyonethree == 1 or windyonethree == 2) then
			player:startEvent(Event(0x8b));
		elseif (windyonethree == 3) then
			player:startEvent(Event(0x9a));
		end
	else
		--Check status of Windurst mission 1-1--
		if (windyoneone == 0) then
			player:startEvent(Event(0x6b));
		elseif (windyoneone == 1 or windyoneone == 2) then
			player:startEvent(Event(0x7c)); 
		elseif (windyoneone == 3) then
			player:startEvent(Event(0x81));
		end
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