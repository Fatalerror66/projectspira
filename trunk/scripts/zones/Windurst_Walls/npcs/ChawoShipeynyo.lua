-----------------------------------
--	Author: Tenjou
-- 	Chawo Shipeynyo
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
if (windymission == 13) then
	--Check status of Windurst Mission 1-3--
	if (windyonethree == 0) then
		player:startEvent(Event(0x6e));
	elseif (windyonethree == 1 or windyonethree == 2) then
		player:startEvent(Event(0x73));
	elseif (windyonethree == 3) then
		player:startEvent(Event(0x78));
	end
else
	player:startEvent(Event(0x149));
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