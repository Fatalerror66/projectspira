-----------------------------------
--	Author: ReaperX
-- 	H-8 ??? for Bastok Mission 8.2 "Enter the Talekeeper"
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
if (player:getMissionStatus(1,21) == 1) and (mission_status == 2) then
  player:startEvent(Event(0x0C))
else
  player:specialMessage(1070); -- there is nothing unusual about the sand here.
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
if (csid == 0x0C) then
  player:setVar("mission_status",3);
  player:specialMessage(1074);  -- piece of wood fell off the cliff!
end
end;