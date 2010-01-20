-----------------------------------
--	Author: ChrisKAra10
-- 	Hildith
-- 	MogHouse NPC info
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
		event0x1E8 = Event(0x1E8);
		event0x1E8:setParams(1,1);
		player:startEvent(event0x1E8);
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 