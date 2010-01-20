-----------------------------------
--	Author: ReaperX
-- 	Magicite
-- 	Magicite Mission
--  didn't test this script since the Magicite wasn't targetable
-----------------------------------
require("scripts/globals/rankpoints");
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
mission_status = player:getVar("mission_status");
if (player:getRank() == 4) and (mission_status >= 3) and (player:hasKeyItem(MagiciteOrastone) == 0) then
  event = Event(0x2c);
  if (mission_status < 5) then
    event:setParams(1); -- 1: play Lion part of the CS (this is first magicite)
  else
    event:setParams(0); -- 0: don't play Lion part of the CS 
  end;
  player:startEvent(event);
else
  player:specialMessage(689) -- "The Magicite glows ominously"
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
if (csid == 0x2c) then
  player:addKeyItem(MagiciteOrastone);
  player:specialMessage(23,MagiciteOrastone);  
  player:setVar("mission_status",5);   -- indicates player has picked up at least one magicite and seen  Lion CS
end
end;