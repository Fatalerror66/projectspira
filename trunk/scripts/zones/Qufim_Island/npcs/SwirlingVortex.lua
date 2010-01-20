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
	player:startEvent(Event(0x12C));
else
	player:specialMessage(1297); -- An empty light swirls about the cave, eating away at the surroundings...
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
	MisareauxCoast = 0x19;
	player:setPos(-111.9,-32.885,220.2,3,MisareauxCoast);
end
end;