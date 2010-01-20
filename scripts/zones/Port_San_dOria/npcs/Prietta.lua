-----------------------------------
-- Area: Port San d'Oria
-- NPC: Prietta
-- 
-- By: Mana
-----------------------------------
-- OnTrade Action
-----------------------------------
function onTrade(player,npc,trade)
 	prietta = player:getVar("prietta")
	sandyQuest16 = player:getQuestStatus(0,16)
	item1 = trade:hasItemQty(532,1);
	if item1 == true then
		if sandyQuest16 == 1 and prietta == 0 then
			player:setVar("prietta",1)
			player:specialMessage(665)
			player:showText(npc,972)
			trade:isComplete()
		elseif sandyQuest16 == 1 and prietta == 1 then
			player:specialMessage(664)
		end
	end 
end;
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
	player:startEvent(Event(0x254))
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