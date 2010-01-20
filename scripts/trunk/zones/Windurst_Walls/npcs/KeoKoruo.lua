-----------------------------------
--	Author: Tenjou
-- 	Keo-Koruo
-- 	Changes dialogue based on Windurst Mission status.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)


--filter variables--
 
nation = player:getNation();
race = player:getRace();
job = player:getMainJob();
money = player:getCurrGil();

--Mission Flags--
windymission = player:getVar("windurstMissions");
windyoneone = player:getVar("theHorutotoRuinsExperiment");
windyonetwo = player:getVar("theHeartOfTheMatter");
windyonethree = player:getVar("thePriceOfPeace");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (windymission == 12) then
	--Check status of Windurst Mission 1-2--
	if (windyonetwo == 0) then
		player:startEvent(Event(0x69));
	elseif (windyonetwo == 1 or windyonetwo == 2) then
		player:startEvent(Event(0x72));
	else
		player:startEvent(Event(0x58));
	end
elseif (windymission == 13) then
	--Check status of Windurst Mission 1-3--
	if (windyonethree == 0) then
		player:startEvent(Event(0x58));
	elseif (windyonethree == 1 or windyonethree == 2) then
		player:startEvent(Event(0x6b));
	elseif (windyonethree == 3) then
		player:startEvent(Event(0x76));
	end
else
	--Check status of Windurst mission 1-1--
	if (windyoneone == 0) then
		player:startEvent(Event(0x58));
	elseif (windyoneone == 1 or windyoneone == 2) then
		player:startEvent(Event(0x64)); 
	elseif (windyoneone == 3) then
		player:startEvent(Event(0x69));
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