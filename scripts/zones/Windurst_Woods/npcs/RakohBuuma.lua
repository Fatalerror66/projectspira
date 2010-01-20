-----------------------------------
--	Author: Tenjou
-- 	MISSION ARBITER: Rakoh Buuma
-- 	Gives missions to players.  Right now the first three missions are scripted.
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

event0x72 = Event(0x72);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--Standard,non-Windurst player dialogue--
if (nation ~= 2) then
	player:startEvent(Event(0x0069));
else --Windurst player dialogue (most cases)
	if (windymission == 12) then
		--Check status of Windurst Mission 1-2--
		if (windyonetwo == 0) then
			event0x72:setParams(0x7ffffffd);
			player:startEvent(event0x72);
		elseif (windyonetwo == 1 or windyonetwo == 2) then
			player:startEvent(Event(0x88));
		else
			player:startEvent(Event(0x70));
		end
	elseif (windymission == 13) then
		--Check status of Windurst Mission 1-3--
		if (windyonethree == 0) then
			event0x72:setParams(0x7ffffffb);
			player:startEvent(event0x72);
		elseif (windyonethree == 1) then
			player:startEvent(Event(0x96));
		elseif (windyonethree == 2) then
			player:startEvent(Event(0x9a));
			--Complete Mission,give player their rewards.--
			player:setVar("thePriceOfPeace",3);
			player:rankUp();
			player:setCurrGil(money+1000);
			--Deactivate Windurst Mission--
			player:setVar("missionFlagged",0);
			player:completeMission(2,2);
		elseif (windyonethree == 3) then
			player:startEvent(Event(0x9b));
		end
	else
		--Check status of Windurst Mission 1-1--
		if (windyoneone == 0) then
			--Teleports the player to her.--
			--player:startEvent(Event(0x78));
			player:startEvent(Event(0x79));
		elseif (windyoneone == 1 or windyoneone == 2) then
			player:startEvent(Event(0x7f));
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
switch(csid) : caseof {
---------------------------------
[0x72] = function (x)	-- Accept Windurst Missions --
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
[0x79] = function (x)	-- Accept Windurst Mission 1-1 --
---------------------------------
if (option == 1) then
	player:setVar("theHorutotoRuinsExperiment",1);
	player:setVar("missionFlagged",1);
	player:currentMission(2,0);
	player:setTitle(113);
else
	player:setVar("theHorutotoRuinsExperiment",0);
end
 end,
--------------------------------- 
  default =    function (x)
	
end,
}
end;