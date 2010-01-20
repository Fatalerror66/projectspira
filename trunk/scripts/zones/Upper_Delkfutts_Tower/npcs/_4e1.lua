-----------------------------------
--	Author: ReaperX
-- 	Door at the bottom of the great spiral staircase that leads out to Lower Delkfutt's Tower.

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
player:startEvent(Event(0x2)); -- "open door?"
end; 

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x2) and (option ~= 0) then
  player:setPos(524, 16, 20, 0, 0xB8);	-- to Lower Delkfutt's Tower
end;
end;