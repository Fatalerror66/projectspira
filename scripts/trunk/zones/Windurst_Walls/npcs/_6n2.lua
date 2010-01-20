-----------------------------------
--	Author: Tenjou, ReaperX
--	Door: House of the Hero
--	Involved in several S.O.B. quests (second quest finished)
--	Involved in Windurst Mission 2-1
--	Starts SMN unlock quest.
--	Starts SMN AF quests. (incomplete)
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/globals/teleports"] = nil;
require("scripts/globals/teleports");
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
require("scripts/zones/Windurst_Walls/TextIDs");

function onTrigger(player,npc)

--Mission and quest flags
onionknow = player:getVar("knowOnesOnions");
rainbow = player:getVar("iCanHearARainbow");

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:getMissionStatus(2,3) == 1) and (player:getVar("mission_status") == 4) then -- Windurst mission 2-1
  player:startEvent(Event(0x151));
elseif (onionknow == 3) then --Check status of quest "Know One's Onions."
	local event0x120 = Event(0x120);
	event0x120:setParams(0,0x1123);
	player:startEvent(event0x120);
	player:setVar("knowOnesOnions",4);
--Check status of quest "I Can Hear a Rainbow."
elseif (rainbow == 0) then
	--Check if the player can unlock the quest.
	lvl = player:getMainLvl();
	ruby = player:hasItem(0x465);
	if (lvl >= ADVANCED_JOB_LEVEL and ruby == 1) then
		--Unsure about the exact flag for getting either Joker or Ajido-Marujido.  What is certain is that you must at least know about Joker to get him.
		rings = player:getQuestStatus(2,42);
		if (rings == 2) then
			--Joker
			local event0x17f = Event(0x17f);
			event0x17f:setParams(0x465,0x465,0x465,0x465,0x465,0x465,0x465,0x465);
			player:startEvent(event0x17f);
		else
			--Ajido
			local event0x180 = Event(0x180);
			event0x180:setParams(0x465,0x465,0x465,0x465,0x465,0x465,0x465,0x465);
			player:startEvent(event0x180);
		end
		player:setVar("iCanHearARainbow",1);
		player:addQuest(2,75);
	else
		--Normal action
		player:specialMessage(HOUSEOFTHEHERO);
	end
elseif (rainbow == 1) then
	local event0x181 = Event(0x181);
	event0x181:setParams(0x465,0x465,0x465,0x465,0x465,0x465,0x465,0x465);
	player:startEvent(event0x181);
	--DEBUG ONLY
	--player:setVar("iCanHearAR-Lights",0);
else
	--Normal action
	player:specialMessage(HOUSEOFTHEHERO);
end

if (player:getMissionStatus(2,3) == 1) and (player:getVar("mission_status") == 5) and DEBUG_MODE then
	toOptistery(player)
end;
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
if (csid == 0x0151) then
	player:setVar("mission_status",5)
end;
end;