-----------------------------------
--	Author: ChrisKAra10
-- 	NPC: Offa
-- 	involved in the Quest "Smoke on the Mountain" and "A Proper Burial"(which is not script yet)
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
SmokeontheMountain = player:getQuestStatus(1,15);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if SmokeontheMountain == 1 then
	player:startEvent(Event(0xDE));
else
	player:startEvent(Event(0x7C));
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
end;