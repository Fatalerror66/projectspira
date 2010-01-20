-----------------------------------
--	Author: ChrisKara10
-- 	Gray Wolf
-- 	 
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:startEvent(Event(0x13));		
	-- Lost chick Quest --	
		--event0x13 = Event(0x13);
		--event0x13:setParams(1,2);
		--player:startEvent(event0x13);
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 