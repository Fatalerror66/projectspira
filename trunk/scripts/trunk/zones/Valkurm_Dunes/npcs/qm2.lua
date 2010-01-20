------------------------------------------
-- ??? at hidden beach near song runes
-- WHM AF1 
-- By ReaperX
-- missing: the ??? should depop during the day time, and while the NM is up.
-- pop message and position verified from http://www.youtube.com/watch?v=6eI9Qd2z06U .
------------------------------------------

require("scripts/globals/settings");

function onTrigger(player,npc) 
if player:getVar("WHM_AF1_STATUS") == 1 then
	player:specialMessage(1426);  -- You sense a foul presence.
	loc = Zone(0x67);
	loc:spawnMob("Marchelute",-720, -8, 77,34,player:getId());
else
	player:specialMessage(1425);  -- You find nothing.
end;
end;  

----------------------------------- 
-- onTrade Action 
----------------------------------- 
function onTrade(player,npc,trade) 
end; 

function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;
