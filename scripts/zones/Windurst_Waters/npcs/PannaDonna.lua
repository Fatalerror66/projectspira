-----------------------------------
--	Author: Tenjou
-- 	Panna-Donna
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
	local event0x6a = Event(0x6a);
	event0x6a:setParams(0,0,nation);
	player:startEvent(event0x6a);
else --Windurst player dialogue (most cases)
	if (windymission == 12) then
		--Check status of Windurst Mission 1-2--
		if (windyonetwo == 0) then
			player:startEvent(Event(0x7f));
		elseif (windyonetwo == 1 or windyonetwo == 2) then
			player:startEvent(Event(0x85));
		else
			player:startEvent(Event(0x71));
		end
	elseif (windymission == 13) then
		--Check status of Windurst Mission 1-3--
		if (windyonethree == 0) then
			player:startEvent(Event(0x71));
		elseif (windyonethree == 1 or windyonethree == 2) then
			player:startEvent(Event(0x89));
		elseif (windyonethree == 3) then
			player:startEvent(Event(0x98));
		end
	else
		--Check status of Windurst mission 1-1--
		if (windyoneone == 0) then
			player:startEvent(Event(0x69));
		elseif (windyoneone == 1 or windyoneone == 2) then
			player:startEvent(Event(0x7a)); 
		elseif (windyoneone == 3) then
			player:startEvent(Event(0x7f));
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