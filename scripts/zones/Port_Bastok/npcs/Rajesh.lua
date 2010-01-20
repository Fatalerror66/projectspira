-----------------------------------
--	Author: Arcanedemon
-- 	Rajesh
-- 	Basic Chat Text
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
Airshippass = 0x8;
if(player:hasKeyItem(Airshippass) == 1 and player:getCurrGil() >=200) then
	player:startEvent(Event(0x8D));
else
	player:startEvent(Event(0x8E));
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
if(csid == 0x8D and option == 0 ) then
	player:removeGil(200);
end
end;