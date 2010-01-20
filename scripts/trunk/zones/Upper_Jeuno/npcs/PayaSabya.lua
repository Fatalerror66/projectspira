-----------------------------------
--	Author: ReaperX
-- 	PayaSabya
-- 	Magicite Mission Quest "Yagudo Torch"
--  To do: missing parts of the flower story
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
if (player:getRank() == 4) and (mission_status == 3) and (player:hasKeyItem(0x14) == 0) then
  player:startEvent(Event(0x50))    
elseif ((player:getRank() == 4) and (mission_status > 3)) or (player:getRank()>4) then
  player:startEvent(Event(0x17));  -- there's more to this story (events 0x5e and 0x1d) but I don't know what conditions activate them.
else
  player:startEvent(Event(0x4F));
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
if (csid == 0x50) then
  player:setVar("mission_status",4) -- indicates player has talked to Aldo and Paya-Sabya
end
end;