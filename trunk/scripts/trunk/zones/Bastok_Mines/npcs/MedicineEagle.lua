-----------------------------------
--	Author: ChrisKara10, ReaperX
-- 	Medicine Eagle
-- 	Directions, Bastok Mission 6.1 "Return of the Talekeeper"
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------

mission_status =  player:getVar("mission_status");

if (player:getMissionStatus(1,16) == 1) and (mission_status == 1) then -- for 6.2 first CS
  player:startEvent(Event(0xB4));
elseif (player:getMissionStatus(1,16) == 1) and (mission_status == 2) then -- repeats information
  player:startEvent(Event(0xB5));
else
  player:startEvent(Event(0x19));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0xB4) then
  player:setVar("mission_status",2);
elseif (csid == 0xB5) and (DEBUG_MODE) then
  player:setPos(-71, 0, 60, 124, 0xAC);     -- to Drake Fang
end
end;