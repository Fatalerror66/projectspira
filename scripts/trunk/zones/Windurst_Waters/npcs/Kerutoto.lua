-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Kerutoto
-- 	Starts quest "Food for Thought."
--	Involved in other quests.
--  Windurst Mission 7-2
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/globals/teleports"] = nil;
require("scripts/globals/teleports");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

--Quest Flags--
food = player:getVar("foodForThought");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
mission_status = player:getVar("mission_status");

if (player:getMissionStatus(2,19) == 1) and (mission_status == 2) then
	player:startEvent(Event(0x2E0));
elseif (player:getMissionStatus(2,19) == 1) and (mission_status == 1) then
	player:startEvent(Event(0x2E1)); -- if you haven't talked to Leepe-Hoppe first
elseif (player:getMissionStatus(2,19) == 1) and (mission_status == 3) then
	player:startEvent(Event(0x2E2)); 
elseif (food == 1) then
	player:startEvent(Event(0x138));
	player:setVar("foodForThought",2);
elseif (food == 2) then
	local kerutotoorder = player:getVar("foodForTho-KerutotoCS");
	local kenapaorder = player:getVar("foodForTho-KenapaKeppaCS");
	local ohbiruorder = player:getVar("foodForTho-OhbiruDohbiruCS");
	if (kerutotoorder == 4) then
		player:startEvent(Event(0x14d));
	else
		if (kenapaorder >= 3 and ohbiruorder >= 1) then
			local event0x13b = Event(0x13b)
			event0x13b:setParams(0,0x1113);
			player:startEvent(event0x13b);
			player:setVar("foodForTho-KerutotoCS",3);
		else
			player:startEvent(Event(0x130));
		end
	end
elseif (food == 4) then
	player:startEvent(Event(0x14f));
else
	--normal text
	player:startEvent(Event(0x130));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
local kerutotoorder = player:getVar("foodForTho-KerutotoCS");
local ohbiruorder = player:getVar("foodForTho-OhbiruDohbiruCS");
local kenapaorder = player:getVar("foodForTho-KenapaKeppaCS");
count = trade:getItemCount();
--print("count: " .. count);
item1 = trade:hasItemQty(0x1113,1);
if (kerutotoorder == 3 and count == 1 and item1 == true) then
	--"Food for Thought" trade
	player:removeItem(0x1113,1);
	local event0x14c = Event(0x14c);
	event0x14c:setParams(120);
	player:startEvent(event0x14c);
	player:addGil(GIL_RATE*120);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*120);
	player:setVar("foodForTho-KerutotoCS",4);
	player:addFame(2,WIN_FAME*10);
	--print("Windurst fame adjusted for",player:getName(),"by 10 (Total:",player:getFame(2),").");
	--Try to fully complete quest
	if (ohbiruorder == 4 and kenapaorder == 4) then
		player:setVar("foodForThought",4);
		player:completeQuest(2,14);
		player:setTitle(132);
	end
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x2E0) then
	player:setVar("mission_status",3);
elseif (csid == 0x2E2) and (DEBUG_MODE) then
	toRomaaMigho(player);
end;
end;