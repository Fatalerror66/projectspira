-----------------------------------
--	Author: Tenjou
-- 	PORTAL: Shimmering Circle
-- 	Lifts plaers up to the sky!
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
z = player:getZPos();
if (z < 200) then
	player:startEvent(Event(0xa)); --Event 3 for the first time.
else
	player:startEvent(Event(0xb));
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
--player:sendRelease(1);
end;