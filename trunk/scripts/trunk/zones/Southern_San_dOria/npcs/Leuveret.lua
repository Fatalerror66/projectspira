-----------------------------------
--	Author: JesseJames
-- 	Leuveret
-- 	Basic Text Scripted
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)




-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:startEvent(Event(0x26D));
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
 	leuveret = player:getVar("leuveret")
	sandyQuest16 = player:getQuestStatus(0,16)
	item1 = trade:hasItemQty(532,1);
	if item1 == true then
		if sandyQuest16 == 1 and leuveret == 0 then
			player:setVar("leuveret",1)
			player:specialMessage(2129)
			player:showText(npc,2137)
			trade:isComplete()
		elseif sandyQuest16 == 1 and leuveret == 1 then
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