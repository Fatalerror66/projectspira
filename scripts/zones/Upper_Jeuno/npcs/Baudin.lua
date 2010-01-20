-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	Baudin
-- 	Basic Chat Text, Magicite Mission Quest "Crest of Davoi"
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
mission_status = player:getVar("mission_status");
if (player:getRank() == 4) and (mission_status >= 3) and (player:getQuestStatus(3,0) == 0) then
  player:startEvent(Event(0xAE))    -- Crest of Davoi Quest
elseif (player:getQuestStatus(3,0) == 1) then
  player:startEvent(Event(0xAF))    -- Crest of Davoi Quest, repeats instructions
else
  player:startEvent(Event(0xAD));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
if (trade:getItemCount() == 1) and (trade:hasItemQty(4377,1)) and (player:getQuestStatus(3,0) == 1) then -- coeurl meat
  trade:isComplete();  
  player:startEvent(Event(0xAB))
end
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0xAE) then
  player:addQuest(3, 0); -- Crest of Davoi
elseif (csid == 0xAB) then
  player:completeQuest(3,0)
  player:addKeyItem(0x15);             -- Coruscant rosary
  player:specialMessage(182,0x15);  
end
end;