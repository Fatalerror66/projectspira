-----------------------------------
--	Author: Tenjou, TD123
-- 	Imasuke
-- 	Basic Chat // Reference to Hook, Line, and Sinker // The Antique Collector Quest
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local x
if (player:getQuestStatus(3,25) == 1) then
  player:startEvent(Event(0x000E));    -- The Antique Collector Quest, repeats instructions
else
 if (player:getQuestStatus(3,71)~=1) then
 x = 1
 else
 x = math.random(1,2)
 end
 if (x == 1) then
  if (player:getFameLevel(3)>=3) and (player:getQuestStatus(3,25) == 0) then
    player:startEvent(Event(0x000D));    -- The Antique Collector Quest 
  elseif (player:getQuestStatus(3,25) == 2) then
    player:startEvent(Event(0x000F));    
  else
    player:startEvent(Event(0x000C));
  end
 else
   player:startEvent(Event(0x272D));    -- Reference to Hook, Line, and Sinker
 end
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
if (trade:getItemCount() == 1) and (trade:hasItemQty(16631,1)) and (player:getQuestStatus(3,25) == 1) then -- Kaiser Sword
  trade:isComplete();  
  player:startEvent(Event(0x0010))
end
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x000D and option == 1) then
  player:addQuest(3,25); -- Antique Collector
elseif (csid == 0x0010) then
  player:completeQuest(3,25)
  player:addKeyItem(0x19A);             -- Map of Delkfutt's Tower
  player:specialMessage(305,0x19A);  
end
end;