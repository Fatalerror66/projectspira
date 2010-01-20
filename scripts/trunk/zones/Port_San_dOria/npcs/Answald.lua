-----------------------------------
-- Area: Port San d'Oria
-- NPC: Answald 
-- Standard event and Quest related trade script for Flyers for Regine quest
-- By: Mana
-----------------------------------
-- OnTrade Action
-----------------------------------
function onTrade(player,npc,trade)
	answald = player:getVar("answald")
	sandyQuest16 = player:getQuestStatus(0,16)
	item1 = trade:hasItemQty(532,1);
	if item1 == true then
		if sandyQuest16 == 1 and answald == 0 then
			player:setVar("answald",1)
			player:specialMessage(665)
			player:showText(npc,948)
			trade:isComplete()
		elseif sandyQuest16 == 1 and answald == 1 then
			player:specialMessage(664)
		end
	end 
end;
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
 
function onTrigger(player,npc)
	player:startEvent(Event(0x248))
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
end;