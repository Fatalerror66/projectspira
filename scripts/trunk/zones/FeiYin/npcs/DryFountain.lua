-----------------------------------
--	Author: ReaperX
-- 	Dry Fountain
-- 	for RDM AF quest
-----------------------------------

AntiqueCoin = 1093;

require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:specialMessage(846);
end; 
 

----------------------------------- 
-- onTrade Action 
----------------------------------- 
function onTrade(player,npc,trade) 

if (player:getQuestStatus(0,86) == 1) and (player:getVar("peace_for_the_spirit_status") == 1) and (trade:hasItemQty(AntiqueCoin,1)) and (trade:getItemCount() == 1) then
  trade:isComplete();
  player:startEvent(Event(0x11));
end;
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("OPTION:",option);
if (csid == 0x11) then
  player:setVar("peace_for_the_spirit_status",2);
end;
end;