-----------------------------------
--	Author: Arcanedemon & Almendro
-- 	Dehlner
-- 	Basic Chat Text and "A Foreman's Best Friend"
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
aForemansBestFriend = player:getQuestStatus(1,9);
if(aForemansBestFriend == 1) then
	player:startEvent(Event(0x006F));
else
	player:startEvent(Event(0x002E));
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
--print("CSID:",csid);
--print("RESULT:",option);
end;