-----------------------------------
--	Author: Tenjou
-- 	MISSION ARBITER: Janshura-Rashura
-- 	Gives missions to players.  Right now the first three missions are scripted.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)


nation = player:getNation();
money = player:getCurrGil();
windymission = player:getVar("windurstMissions");
windyoneone = player:getVar("theHorutotoRuinsExperiment");
windyonetwo = player:getVar("theHeartOfTheMatter");
windyonethree = player:getVar("thePriceOfPeace");

event0x4e = Event(0x4e);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--Standard,non-Windurst player dialogue--
if (nation ~= 2) then
	player:startEvent(Event(0x0047));
else --Windurst player dialogue (most cases)
	if (windymission == 12) then
		--Check status of Windurst Mission 1-2--
		if (windyonetwo == 0) then
			event0x4e:setParams(0x7ffffffd);
			player:startEvent(event0x4e);
		elseif (windyonetwo == 1 or windyonetwo == 2) then
			player:startEvent(Event(0x69));
		else
			player:startEvent(Event(0x4c));
		end
	elseif (windymission == 13) then
		--Check status of Windurst Mission 1-3--
		if (windyonethree == 0) then
			event0x4e:setParams(0x7ffffffb);
			player:startEvent(event0x4e);
		elseif (windyonethree == 1) then
			player:startEvent(Event(0x6e));
		elseif (windyonethree == 2) then
			player:startEvent(Event(0x72));
			--Complete Mission--
			player:setVar("thePriceOfPeace",3);
			player:rankUp();
			player:setCurrGil(money+1000);
			--Deactivate Windurst Mission--
			player:setVar("missionFlagged",0);
			player:completeMission(2,2);
		elseif (windyonethree == 3) then
			player:startEvent(Event(0x73));
		end
	else
		--Check status of Windurst Mission 1-1--
		if (windyoneone == 0) then
			player:startEvent(Event(0x53));
		elseif (windyoneone == 1 or windyoneone == 2) then
			player:startEvent(Event(0x59));
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
--print("CSID:" .. csid);
--print("OPTION:" .. option);
if (csid == 0x4e) then
	if (option == 1) then --Accept Windurst Mission 1-2--
		player:setVar("theHeartOfTheMatter",1);
		player:setVar("missionFlagged",1);
		player:currentMission(2,1);
	elseif (option == 2) then --Accept Windurst Mission 1-3--
		player:setVar("thePriceOfPeace",1);
		player:setVar("missionFlagged",1);
		player:currentMission(2,2);
	end
elseif (csid == 0x53) then
	if (option == 1) then
		--Accept Windurst Mission 1-1--
		player:setVar("theHorutotoRuinsExperiment",1);
		player:setVar("missionFlagged",1);
		player:currentMission(2,0);
		player:setTitle(112);
	else
		player:setVar("theHorutotoRuinsExperiment",0);
	end
end
end; 