-----------------------------------
-- Area: Port San d'Oria
-- NPC: Auvare
-- 
-- By: Mana
-----------------------------------
-- OnTrade Action
-----------------------------------
function onTrade(player,npc,trade)
 	auvare = player:getVar("auvare")
	sandyQuest16 = player:getQuestStatus(0,16)
	item1 = trade:hasItemQty(532,1);
	if item1 == true then
		if sandyQuest16 == 1 and auvare == 0 then
			player:setVar("auvare",1)
			player:specialMessage(665)
			player:showText(npc,979)
			trade:isComplete()
		elseif sandyQuest16 == 1 and auvare == 1 then
			player:specialMessage(664)
		end
	end 
end;
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
	player:startEvent(Event(0x256))
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