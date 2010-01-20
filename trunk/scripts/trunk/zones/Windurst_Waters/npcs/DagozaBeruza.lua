-----------------------------------
--	Author: Tenjou
-- 	Dagoza-Beruza
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
	local event0x68 = Event(0x68);
	event0x68:setParams(nation);
	player:startEvent(event0x68);
else --Windurst player dialogue (most cases);
	if (windymission == 12) then
		--Check status of Windurst Mission 1-2--
		if (windyonetwo == 0) then
			player:startEvent(Event(0x80));
		elseif (windyonetwo == 1 or windyonetwo == 2) then
			player:startEvent(Event(0x83));
		elseif (windyonetwo == 3) then
			player:startEvent(Event(0x70));
		end
	elseif (windymission == 13) then
		--Check status of Windurst Mission 1-3--
		if (windyonethree == 0) then
			player:startEvent(Event(0x70));
		elseif (windyonethree == 1 or windyonethree == 2) then
			player:startEvent(Event(0x8a));
		elseif (windyonethree == 3) then
			--Two possible dialogues--
			local windyonethreedag = math.random(1,2);
			if (windyonethreedag == 1) then
				player:startEvent(Event(0x96));
			else
				player:startEvent(Event(0x97));
			end
		end
	else
		--Check status of Windurst mission 1-1--
		if (windyoneone == 0) then
			player:startEvent(Event(0x6c));
		elseif (windyoneone == 1 or windyoneone == 2) then
			player:startEvent(Event(0x79)); 
		elseif (windyoneone == 3) then
			player:startEvent(Event(0x80));
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