-----------------------------------
--	Author: ReaperX
-- 	Aldo
-- 	Magicite Mission
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)


mission_status = player:getVar("mission_status");

if (player:hasKeyItem(0x16) == 1) then -- keyitem "Letter to Aldo"
  player:startEvent(Event(0x0098))
elseif (player:getRank() == 4) and (mission_status == 3) then
  player:startEvent(Event(0x00B7))   -- seems like the correct event
end
end

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

if (csid == 0x0098) then
  player:removeKeyItem(0x16);          -- remove letter to Aldo
  player:addKeyItem(0x2D);             -- silver bell
  player:specialMessage(23,0x2D);  
  player:setVar("mission_status",3);
end
end;