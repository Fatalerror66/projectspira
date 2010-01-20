-----------------------------------
--	Author: ReaperX
-- 	Magicite
-- 	Magicite Mission

-----------------------------------
require("scripts/globals/rankpoints");

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
mission_status = player:getVar("mission_status");
if (player:getRank() == 4) and (mission_status >= 3) and (player:hasKeyItem(MagiciteOptistone) == 0) then
  event = Event(0x0);
  if (mission_status < 5) then
    --print("setting params for lion");
    event:setParams(1,1,1,1,1,1,1,1); -- 1: play Lion part of the CS (this is first magicite)
  else
    event:setParams(0); -- 0: don't play Lion part of the CS 
  end;
  player:startEvent(event);  
else
  player:specialMessage(854) -- "The Magicite glows ominously"
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
if (csid == 0) then
  player:addKeyItem(MagiciteOptistone);              
  player:specialMessage(23,MagiciteOptistone);
  player:setVar("mission_status",5);   -- indicates player has picked up at least one magicite and seen Lion CS
end
end;