-----------------------------------
--	Author: Tenjou
-- 	Radhika
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
	if (player:getZPos() >= 39) then
		player:startEvent(Event(0x00E4));
	else
		player:startEvent(Event(0x00DF));
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