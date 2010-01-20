-----------------------------------
--	Author: ReaperX
-- 	Handle
--  opens door or trap door
--  
-----------------------------------

function onTrigger(player,npc)

x = player:getXPos();
z = player:getZPos();
if (x<21.6) and (x>18) and (z>-15.6) and (z<-12.4) then
  npc:setState(3);
  if ( math.random(2) == 1) then
    npc = getNPCById(17396148,0x97) -- Brass Door 
    npc:setState(10);               
  else
    npc = getNPCById(17396149,0x97) -- trap door
    npc:setState(3);                
    if (player:getMissionStatus(2,10) == 1) and (mission_status == 3) then
    	player:startEvent(Event(0x2B));
    end;
  end;
else
  player:specialMessage(0);
end;
end;


-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x2B) then
	player:setVar("mission_status",4);
	if (DEBUG_MODE) then
		player:setPos(2, -45, -28, 0, 0xF2);
	end;
end;
end;