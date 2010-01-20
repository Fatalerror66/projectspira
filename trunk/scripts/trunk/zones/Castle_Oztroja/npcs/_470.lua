-----------------------------------
--	Author: ReaperX
-- 	Brass dor
--  
-----------------------------------

function onTrigger(player,npc)

if (player:getZPos() < -12) then
  player:specialMessage(6);
else
  npc:setState(10);
end;  
end;
