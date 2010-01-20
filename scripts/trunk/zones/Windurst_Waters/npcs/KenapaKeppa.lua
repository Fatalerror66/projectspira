-----------------------------------
--	Author: Tenjou
-- 	Kenapa-Keppa
-- 	Involved in Windurst Mission 1-3,and other quests.
--	Also involved in quest "Hat in Hand."
--	Also involved in quest "Food for Thought."
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

--Quest Flags--
food = player:getVar("foodForThought");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--Check status of Windurst mission 1-3--
if (windyonethree == 1 or windyonethree == 2) then
	player:startEvent(Event(0x91));
else
	--Check status of quest "Hat in Hand"
	local hat = player:getVar("hatInHand");
	local kenapakeppa = player:getVar("hatInHand-KenapaKeppaCS");
	if (hat == 1 and kenapakeppa == 0) then
		--NEEDS A PACKET 2A
		player:startEvent(Event(0x38));
		player:setVar("hatInHand-KenapaKeppaCS",1);
	else
		--Check status of quest "Food for Thought"
		local kenapaorder = player:getVar("foodForTho-KenapaKeppaCS");
		if (food == 2) then
			if (kenapaorder == 0) then
				player:startEvent(Event(0x13e));
				player:setVar("foodForTho-KenapaKeppaCS",1);
			elseif (kenapaorder == 1) then
				player:startEvent(Event(0x13f));
				player:setVar("foodForTho-KenapaKeppaCS",2);
			elseif (kenapaorder == 2) then
				--supposedly it is this step flags the quest in the menu
				player:startEvent(Event(0x140));
				player:setVar("foodForTho-KenapaKeppaCS",3);
				player:addQuest(2,14);
			elseif (kenapaorder == 3) then
				player:startEvent(Event(0x141));
			elseif (kenapaorder == 4) then
				player:startEvent(Event(0x148));
			end
		else
			--normal text
			player:startEvent(Event(0x12e));
		end
	end
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
local kenapaorder = player:getVar("foodForTho-KenapaKeppaCS");
local kerutotoorder = player:getVar("foodForTho-KerutotoCS");
local ohbiruorder = player:getVar("foodForTho-OhbiruDohbiruCS");
count = trade:getItemCount();
--print("count: " .. count);
item1 = trade:hasItemQty(0x1139,1);
if (kenapaorder == 3 and count == 1 and item1) then
	--"Food for Thought" trade
	player:removeItem(0x1139,1);
	local event0x14a = Event(0x14a);
	event0x14a:setParams(440);
	player:startEvent(event0x14a);
	player:addGil(GIL_RATE*440);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*440);
	player:setVar("foodForTho-KenapaKeppaCS",4);
	player:addFame(2,WIN_FAME*15);
	--print("Windurst fame adjusted for",player:getName(),"by 15 (Total:",player:getFame(2),").");
	--Try to fully complete quest
	if (ohbiruorder == 4 and kerutotoorder == 4) then
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
end;