-----------------------------------
--	Author: Arcanedemon, ReaperX, Tenjou
-- 	Pherimociel
-- 	Basic Chat Text + CoP Mission 1.2 "Below the Arks"---------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
cop_status = player:getMissionStatus(6,2);
if (cop_status == 1) then 
	arks = player:getVar("belowTheArks");
	if (arks == 0) then
		--Start Promathia Mission "Below the Arks"
		event = Event(0x0018)
		player:setVar("belowTheArks",1);
	elseif (arks == 1) then
		event = Event(0x0019)
	end
else
  event = Event(0x009B)
end;

player:startEvent(event);
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