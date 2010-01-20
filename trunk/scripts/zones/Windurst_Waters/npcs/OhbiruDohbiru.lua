-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Ohbiru-Dobhiru
-- 	Involved in Windurst Mission 1-3,and the quest "Food for Thought."
--  CoP mission 3-3B1, "Comedy of Errors, Act I"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)


--Mission Flags--
windyonethree = player:getVar("thePriceOfPeace");
windyonethreef = player:getVar("thePriceOf-LeppeHoppeCS");
cop_status = player:getMissionStatus(6,19);
comedy_of_errors_status = player:getVar("ComedyofErrors");
--print("Cop status = ",cop_status);

--Quest Flags--
food = player:getVar("foodForThought");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--Check status of Windurst mission 1-3--
if (windyonethree == 1 or windyonethree == 2) then
	if (windyonethreef ~= 1) then
		player:startEvent(Event(0x8f));
	else
		player:startEvent(Event(0x90));
	end
elseif (cop_status == 1) and (comedy_of_errors_status == 0) then
    player:startEvent(Event(0x0368));
elseif (cop_status == 1) and (comedy_of_errors_status == 1) then
    player:startEvent(Event(0x036D));
else
	--Check status of quest "Food for Thought"
	if (food == 0) then
		player:startEvent(Event(0x134));
		player:setVar("foodForThought",1);
	elseif (food == 2) then
		local ohbiruorder = player:getVar("foodForTho-OhbiruDohbiruCS");
		if (ohbiruorder == 1) then
			player:startEvent(Event(0x144));
		else
			local event0x13c = Event(0x13c)
			event0x13c:setParams(0,0x118d,0x1138,0x270);
			player:startEvent(event0x13c);
			player:setVar("foodForTho-OhbiruDohbiruCS",1);
			player:addQuest(2,14);
		end
	else
		--normal text
		player:startEvent(Event(0x12d));
	end
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
local food = player:getVar("foodForThought");
local ohbiruorder = player:getVar("foodForTho-OhbiruDohbiruCS");
local kerutotoorder = player:getVar("foodForTho-KerutotoCS");
local kenapaorder = player:getVar("foodForTho-KenapaKeppaCS");
count = trade:getItemCount();
--print("count: " .. count);
item1 = trade:hasItemQty(0x1138,1);
item2 = trade:hasItemQty(0x270,1);
item3 = trade:hasItemQty(0x118d,1);
if (ohbiruorder == 1 and count == 3 and item1 and item2 and item3) then
	--Proper trade for quest "Food for Thought"
	player:removeItem(0x1138,1);
	player:removeItem(0x270,1);
	player:removeItem(0x118d,1);
	local event0x142 = Event(0x142);
	event0x142:setParams(440);
	player:startEvent(event0x142);
	player:addGil(GIL_RATE*440);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*440);
	player:setVar("foodForTho-OhbiruDohbiruCS",4);
	player:addFame(2,WIN_FAME*15);
	--print("Windurst fame adjusted for",player:getName(),"by 15 (Total:",player:getFame(2),").");
	--Try to fully complete quest
	if (kenapaorder == 4 and kerutotoorder == 4) then
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
if (csid == 0x0368) then
  player:setVar("ComedyofErrors",1)  -- time to talk to Yoran-Oran
end
end;