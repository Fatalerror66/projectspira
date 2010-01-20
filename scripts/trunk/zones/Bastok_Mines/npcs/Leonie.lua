-----------------------------------
--	Author: ChrisKara10
-- 	Leonie
-- 	 MogHouse NPC info
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
		event0x46 = Event(0x46);
		event0x46:setParams(1,1);
		player:startEvent(event0x46);
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 