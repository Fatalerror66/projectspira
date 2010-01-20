-----------------------------------
--	Author: ChrisKAra10
-- 	Loulia
-- 	MogHouse NPC information
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
		event0x1E7 = Event(0x1E7);
		event0x1E7:setParams(1,1);
		player:startEvent(event0x1E7);
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 