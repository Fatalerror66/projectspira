-----------------------------------
--	Author: Arcanedemon
-- 	Ravorara
-- 	Basic Chat Text
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

OutoftheDephts_temp = player:getVar("OutoftheDephtsprogress");     --Use to record progress of quest
AQuestionofFaith_temp = player:getVar("AQuestionofFaithprogress"); --Use to record progress of quest
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(OutoftheDephts_temp == 1)then
player:startEvent(Event(0x0136));  -- Correct Cutscene needs to be here
else
player:startEvent(Event(0x0136));  -- Default Chat Text
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
if (csid == 0x0136) then
player:setVar("OutoftheDephtsprogress",2);
else 
player:startEvent(Event(0x0136)); -- Correct Cutscene needs to be here
end
end;