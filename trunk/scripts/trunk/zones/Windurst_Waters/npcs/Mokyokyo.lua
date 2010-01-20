-----------------------------------
--	Author: Tenjou
-- 	MISSION ARBITER: Mokyokyo
-- 	Gives Windurst Missions.  Right now rank 1 missions are implemented.
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

event0x6f = Event(0x6f);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--Standard,non-Windurst player dialogue--
if (nation ~= 2) then
	player:startEvent(Event(0x0067));
else --Windurst player dialogue (most cases)
	if (windymission == 12) then
		--Check status of Windurst Mission 1-2--
		if (windyonetwo == 0) then
			event0x6f:setParams(0x7ffffffd);
			player:startEvent(event0x6f);
		elseif (windyonetwo == 1 or windyonetwo == 2) then
			player:startEvent(Event(0x83));
		else
			player:startEvent(Event(0x67));
		end
	elseif (windymission == 13) then
		--Check status of Windurst Mission 1-3--
		if (windyonethree == 0) then
			event0x6f:setParams(0x7ffffffb);
			player:startEvent(event0x6f);
		elseif (windyonethree == 1) then
			player:startEvent(Event(0x88));
		elseif (windyonethree == 2) then
			player:startEvent(Event(0x94));
			--Complete Mission,reward player--
			player:setVar("thePriceOfPeace",3);
			player:rankUp();
			player:setCurrGil(money+1000);
			--Deactivate Windurst Mission--
			player:setVar("missionFlagged",0);
			player:completeMission(2,2);
		elseif (windyonethree == 3) then
			player:startEvent(Event(0x95));
		end
	else
		if (windyoneone == 0) then
			--Teleports the player to her.--
			--player:startEvent(Event(0x75));
			player:startEvent(Event(0x76));
		elseif (windyoneone == 1 or windyoneone == 2) then
			player:startEvent(Event(0x7b));
		elseif (windyoneone == 3) then
			player:startEvent(Event(0x7e));
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
switch(csid) : caseof {
---------------------------------
[0x6f] = function (x)	-- Accept Windurst Missions --
---------------------------------
if (option == 1) then --Accept Windurst Mission 1-2--
	player:setVar("theHeartOfTheMatter",1);
	player:setVar("missionFlagged",1);
	player:currentMission(2,1);
elseif (option == 2) then --Accept Windurst Mission 1-3--
	player:setVar("thePriceOfPeace",1);
	player:setVar("missionFlagged",1);
	player:currentMission(2,2);
else
end
 end,
---------------------------------
[0x76] = function (x)	-- Accept Windurst Mission 1-1 --
---------------------------------
if (option == 1) then
	player:setVar("theHorutotoRuinsExperiment",1);
	player:setVar("missionFlagged",1);
	player:currentMission(2,0);
	player:setTitle(111);
else
	player:setVar("theHorutotoRuinsExperiment",0);
end
 end,
--------------------------------- 
default = function (x) end,}
end;