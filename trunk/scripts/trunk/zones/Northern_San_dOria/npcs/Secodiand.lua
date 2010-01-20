-- Auto-Generated Script from FFXImonV3 
-- By: Mana
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");
----------------------------------- 
-- onTrade Action 
----------------------------------- 
function onTrade(player,npc,trade) 
-- DO NOT DELETE !!! 
-- All sandy NPCs not directly related to Flyers for Regine quest must have this conditional trade script. 
-- it is just a conditional line to say the NPC refused to accept the flyer. 
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then 
		player:specialMessage(1767) 
	end 
-- Fear of the Dark
	if trade:hasItemQty(922,2) == true and player:getQuestStatus(0,78) >= 1 then
		if player:getQuestStatus(0,78) == 1 then
			player:completeQuest(0,78)
		end
		trade:isComplete()
		player:addFame(0,SAN_FAME*20)
		player:addGil(GIL_RATE*200)
		player:specialMessage(GIL_OBTAINED,GIL_RATE*200);
		player:startEvent(Event(0x12))
	end
end; 
----------------------------------- 
-- onTrigger Action 
----------------------------------- 
function onTrigger(player,npc) 
	fearOfTheDark = player:getQuestStatus(0,78)
	if fearOfTheDark == 0 then
		event = Event(19) 
	elseif fearOfTheDark == 1 then
		event = Event(17) 
	elseif fearOfTheDark == 2 then
		event = Event(19) 
		event:setParams(0,0,0,0,0,0,0,1) 
	end
	player:startEvent(event) 
end; 
-----------------------------------
--onEventSelection Action--
-----------------------------------
function onEventSelection(player,csid,option)
	--print("onEventSelection")
	--print("CSID:",csid);
	--print("RESULT:",option);
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	--print("onEventFinish")
	--print("CSID:",csid);
	--print("RESULT:",option);
	if player:getQuestStatus(0,78) == 0 then
		if csid == 19 and option == 1 then
			player:addQuest(0,78)
		end
	end
end;