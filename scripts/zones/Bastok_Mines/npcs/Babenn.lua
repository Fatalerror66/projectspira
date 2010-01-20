-----------------------------------
--	Author: Almendro
-- 	Babenn
-- 	Scripted: The Eleventh's Hour
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
TheEleventhsHour = player:getQuestStatus(1,7);
if(TheEleventhsHour == 1 and player:getVar("TheEleventhsHour") == 3)then
	player:startEvent(Event(0x2D));	
else
	-- Default chat text
	player:startEvent(Event(0x28));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid == 0x2D)then	
	player:removeKeyItem(0x18);	
	player:addItem(0x40F5); -- Small Sword
	player:specialMessage(ITEM_OBTAINED,0x40F5);
	player:setTitle(85);
	player:addFame(1,BAS_FAME*100);
	player:completeQuest(1,7);
	player:setVar("TheEleventhsHour",0);
end
end;