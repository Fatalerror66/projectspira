-----------------------------------
--	Author: Almendro
-- 	Swirling Vortex
-- 	Teleports you to Lufaise Meadows (K-8) if you have finished the chapter 2 of CoP
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(player:getMissionStatus(6,19) == 2) then
	player:startEvent(Event(0xC));
else
	player:specialMessage(1296); -- An empty light swirls about the cave, eating away at the surroundings...
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
if(option == 1) then
	LufaiseMeadows = 0x18;
	player:setPos(458.8,7.9,-1.2,75,LufaiseMeadows);
end
end;