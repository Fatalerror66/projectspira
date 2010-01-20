-----------------------------------
--	Author: Tenjou
-- 	JEUNOAN CONSUL: Esmeralda
-- 	Working 100%.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local esmeralda = math.random();
if (esmeralda >= .5) then
	player:startEvent(Event(0x10c));
else
	player:startEvent(Event(0x10d));
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