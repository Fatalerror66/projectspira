-----------------------------------
--	Author: Tenjou
--	Stone Circle
--	Completes the quest "I Can Hear a Rainbow."
-----------------------------------


-----------------------------------
--onTrigger Action--
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------

end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
rainbow = player:getQuestStatus(2,75);
colors = player:getVar("iCanHearAR-Lights");
count = trade:getItemCount();
ruby = trade:hasItemQty(0x465,1);
if (rainbow == 1 and ruby and colors == 0x7f and count == 1) then
	trade:isComplete();
	--Complete quest!!!
	player:startEvent(Event(0x7c));
	player:setVar("iCanHearARainbow",2);
	player:completeQuest(2,75);
	player:setTitle(190);
	--Rewards!!!  I'll put a fake one for now.
	player:unlockJob(15);
	player:addSpell(296);
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;