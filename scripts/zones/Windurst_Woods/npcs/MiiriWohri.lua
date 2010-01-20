-----------------------------------
--	Author: Tenjou
-- 	Miiri-Wohri
-- 	Changes dialogue based on mission status.
-----------------------------------
 
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

 
nation = player:getNation();


--Mission Flags--
windymission = player:getVar("windurstMissions");
windyoneone = player:getVar("theHorutotoRuinsExperiment");
windyonetwo = player:getVar("theHeartOfTheMatter");
windyonetwoa = player:getVar("theHeartOf-ApururuCS");
windyonetwoc = player:getVar("theHeartOf-CardianCS");
windyonethree = player:getVar("thePriceOfPeace");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--Standard,non-Windurst player dialogue--
if (nation ~= 2) then
	player:startEvent(Event(0x0073));
else --Windurst player dialogue (most cases)
	if (windymission == 12) then
		--Check status of Windurst Mission 1-2--
		if (windyonetwo == 0) then
			player:startEvent(Event(0x76));
		elseif (windyonetwo == 1 or windyonetwo == 2) then
			player:startEvent(Event(0x85));
		else
			player:startEvent(Event(0x76));
		end
	elseif (windymission == 13) then
		--Check status of Windurst Mission 1-3--
		if (windyonethree == 0) then
			player:startEvent(Event(0x76));
		elseif (windyonethree == 1 or windyonethree == 2) then
			player:startEvent(Event(0x97));
		elseif (windyonethree == 3) then
			player:startEvent(Event(0x9d));
		end
	else
		--Check status of Windurst mission 1-1--
		if (windyoneone == 0) then
			player:startEvent(Event(0x76));
		elseif (windyoneone == 1 or windyoneone == 2) then
			player:startEvent(Event(0x7c));
		elseif (windyoneone == 3) then
			player:startEvent(Event(0x76));
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