-----------------------------------
--	Author: Tenjou
-- 	OBJECTS: Library Books
-- 	Working 100%.  There are 3 targets with 3 different events.  Right now they are all in this script.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (npcid == 17752087) then
	player:startEvent(Event(0x16f));
elseif (npcid == 17752088) then
	player:startEvent(Event(0x170));
elseif (npcid == 17752089) then
	player:startEvent(Event(0x171));
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