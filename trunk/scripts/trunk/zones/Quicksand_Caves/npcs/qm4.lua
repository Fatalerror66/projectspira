-----------------------------------
--	Author: ReaperX
-- 	H-8 ??? for Bastok Mission 8.1 "The Chains That Bind Us"
-- 	2nd CS 
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
if (player:getMissionStatus(1,20) == 1) and (mission_status == 3) then
  player:startEvent(Event(0x0A))  
else
  player:specialMessage(1110); -- there is nothing out of the ordinary here.
end;
if (player:getMissionStatus(1,20) == 1) and (mission_status == 4) and (DEBUG_MODE) then
  player:setPos(89, -20, 0, 240, 0xED);     -- to Iron Eater
end;
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
if (csid == 0x0A) then
  player:setVar("mission_status",4);
end
end;