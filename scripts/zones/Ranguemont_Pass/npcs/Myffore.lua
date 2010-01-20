-----------------------------------
--	Author: Aurelias
-- 	Myffore
-- 	Opens the door for the player
-----------------------------------

-- Includes
require("scripts/globals/settings");


-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	player:startEvent(Event(0x1));
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
if(csid == 0x1 and option == 0) then
	npc = getNPCById(17457311,0xA6)
	npc:setState(10);
else
end
end;