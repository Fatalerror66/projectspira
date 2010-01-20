-----------------------------------
--	Author: JesseJames/Mana
-- 	Adaunel
-- 	NPC Adventurer's Assistant Text Scripted
--  Edited 7/5/09 - Mana
--  Added relation to Flyer's for Regine Quest
--  NPC 100% completed on 7/6/09 by Mana
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
	player:startEvent(Event(0x290));
end; 
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
 	adaunel = player:getVar("adaunel")
	sandyQuest16 = player:getQuestStatus(0,16)
	item1 = trade:hasItemQty(532,1);
	if item1 == true then
		if sandyQuest16 == 1 and adaunel == 0 then
			player:setVar("adaunel",1)
			player:specialMessage(2129)
			player:showText(npc,0x857)
			trade:isComplete()
		elseif sandyQuest16 == 1 and adaunel == 1 then
			player:specialMessage(2130)
		end
	end 

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