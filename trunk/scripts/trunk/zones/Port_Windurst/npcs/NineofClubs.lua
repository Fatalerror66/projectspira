-----------------------------------
--	Author: Tenjou
-- 	Nine of Clubs
-- 	Involved in the first three Windurst missions,and should give dialogue at each step.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)


nation = player:getNation();
player:getVar("windurstMissions");
windyoneone = player:getVar("theHorutotoRuinsExperiment");
windyonetwo = player:getVar("theHeartOfTheMatter");
windyonethree = player:getVar("thePriceOfPeace");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--Standard,non-Windurst player dialogue--
if (nation ~= 2) then
	player:startEvent(Event(0x4a));
else --Windurst player dialogue (most cases)
	if (windymission == 12) then
		--Check status of Windurst Mission 1-2--
		if (windyonetwo == 0) then
			player:startEvent(Event(0x66));
		elseif (windyonetwo == 1 or windyonetwo == 2) then
			player:startEvent(Event(0x6a));
		else
			player:startEvent(Event(0x56));
		end
	elseif (windymission == 13) then
		--Check status of Windurst Mission 1-3--
		if (windyonethree == 0) then
			player:startEvent(Event(0x56));
		elseif (windyonethree == 1 or windyonethree == 2) then
			player:startEvent(Event(0x71));
		elseif (windyonethree == 3) then
			player:startEvent(Event(0x75));
		end
	else
		--Check status of Windurst mission 1-1--
		if (windyoneone == 0) then
			player:startEvent(Event(0x4a));
		elseif (windyoneone == 1 or windyoneone == 2) then
			player:startEvent(Event(0x56)); 
		elseif (windyoneone == 3) then
			player:startEvent(Event(0x66));
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