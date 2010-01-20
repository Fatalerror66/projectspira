-----------------------------------
--	Author: Almendro
-- 	Panana
-- 	Out of One's Shell involved
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
OutofOnesShell = player:getQuestStatus(1,5);
if(OutofOnesShell == 1 and player:getVar("OutofOnesShell") == 1) then
	player:startEvent(Event(0x53));
else
	player:startEvent(Event(0x2B));
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
--print("CSID:",csid);
--print("RESULT:",option);
end;