-----------------------------------
--	Author: Tenjou
-- 	Sola Jaab
-- 	Changes dialogue based on mission status.
-----------------------------------
 
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

 
nation = player:getNation();
race = player:getRace();



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
	if (race ~= 7) then --different dialogue for Mithra
		player:startEvent(Event(0x6d));
	else
		player:startEvent(Event(0x6e));
	end
else --Windurst player dialogue (most cases)
	if (windymission == 12) then
		--Check status of Windurst Mission 1-2--
		if (windyonetwo == 0) then
			player:startEvent(Event(0x82));
		elseif (windyonetwo == 1 or windyonetwo == 2) then
			player:startEvent(Event(0x86));
		else
			if (race ~= 7) then --different dialogue for Mithra
				player:startEvent(Event(0x6d));
			else
				player:startEvent(Event(0x6e));
			end
		end
	elseif (windymission == 13) then
		--Check status of Windurst Mission 1-3--
		if (windyonethree == 0) then
			if (race ~= 7) then --different dialogue for Mithra
				player:startEvent(Event(0x6d));
			else
				player:startEvent(Event(0x6e));
			end
		elseif (windyonethree == 1 or windyonethree == 2) then
			player:startEvent(Event(0x99));
		elseif (windyonethree == 3) then
			player:startEvent(Event(0x9e));
		end	
	else
		--Check status of Windurst mission 1-1--
		if (windyoneone == 0) then
			if (race ~= 7) then --different dialogue for Mithra
				player:startEvent(Event(0x6d));
			else
				player:startEvent(Event(0x6e));
			end
		elseif (windyoneone == 1 or windyoneone == 2) then
			player:startEvent(Event(0x7d)); 
		elseif (windyoneone == 3) then
			player:startEvent(Event(0x82));
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