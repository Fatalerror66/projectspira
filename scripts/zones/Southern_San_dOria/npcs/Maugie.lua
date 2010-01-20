-----------------------------------
--	Author: JesseJames
-- 	Maugie
-- 	Basic Text Scripted, Quest text needed
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)




-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:startEvent(Event(0x02E));
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
 	maugie = player:getVar("maugie")
	sandyQuest16 = player:getQuestStatus(0,16)
	item1 = trade:hasItemQty(532,1);
	if item1 == true then
		if sandyQuest16 == 1 and maugie == 0 then
			player:setVar("maugie",1)
			player:specialMessage(2129)
			player:showText(npc,0x855)
			trade:isComplete()
		elseif sandyQuest16 == 1 and maugie == 1 then
			player:specialMessage(2130)
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