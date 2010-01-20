-----------------------------------
--	Author: Arcanedemon
-- 	Lasthenes
-- 	Basic Chat Text & pass to korroloka tunnel
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(player:getZPos() < 24 and player:getZPos() > 16 and player:getXPos() < -81 and player:getXPos() > -85)then
	player:startEvent(Event(0xB5));
else
	player:startEvent(Event(0xB4));
end
--player:startEvent(Event(0x67)); -- Only if player doesnt have Zilart Expansion installed
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