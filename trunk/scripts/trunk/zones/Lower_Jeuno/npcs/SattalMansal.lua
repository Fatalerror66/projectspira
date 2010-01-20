-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	Sattal-Mansal
-- 	Basic Chat Text, Magicite Mission
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

-- events: 
-- 000B : message about Prishe being taken to Monberaux
-- 005F : Verena is missing
-- 005A : Lion was here the other day talking to Aldo
-- 005D : Verena is back.. what happened in Delkfutt's tower?
-- 005E : Verena is back in tip-top shape..
-- 0058 : the boss told me to get his equipment ready
-- 0057 : this is great! .. But I'm still kinda worried about Verena
-- 0059 : Wait so all you got from Aldo was a silver bell? (Magicite Mission CS)
-- 0060 : something about Aldo being protective of his sister
-- 005B : completion of quest "Mysteries of Beadeaux I"
-- 005C : completion of quest "Mysteries of Beadeaux II"
-- 274D : what's going on? The boss is walking around like he's seen the Gates of Paradise..


if (player:getRank() == 4) and (mission_status >= 3) and (player:getQuestStatus(3,31) == 0) and (player:getQuestStatus(3,32) == 0) then
  player:startEvent(Event(0x0059))   
elseif (player:getQuestStatus(3,31) == 1) and (player:getQuestStatus(3,32) == 1) then
  player:startEvent(Event(0x0059))    -- just repeat the same response, couldn't find a better one.
else
  player:startEvent(Event(0x000B));
end; 
end
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)

if (trade:getItemCount() == 1) and (trade:hasItemQty(495,1)) and (player:getQuestStatus(3,31) == 1) then -- quadav charm
  trade:isComplete();  
  player:startEvent(Event(0x5B))
elseif (trade:getItemCount() == 1) and (trade:hasItemQty(494,1)) and (player:getQuestStatus(3,32) == 1) then -- quadav augury shell
  trade:isComplete();
  player:startEvent(Event(0x5C))
end

end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x59) then
  player:addQuest(3, 31); -- Mysteries of Beadeaux I
  player:addQuest(3	,32); -- Mysteries of Beadeaux II
elseif (csid == 0x5B) then
  player:completeQuest(3,31)
  player:addKeyItem(0x2E);             -- Coruscant rosary
  player:specialMessage(23,0x2E);  
elseif (csid == 0x5C) then
  player:completeQuest(3,32)
  player:addKeyItem(0x2F);             -- Black matinee necklace
  player:specialMessage(23,0x2F);  
end
end;