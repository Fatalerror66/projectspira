-----------------------------------
--	Author: Tenjou
-- 	Ohruru
-- 	Starts and ends quest "Catch it if you Can!"  Cannot implement her quest until status effects are implemented.  The events in her quest are 0xe7,0xf6,0xf8 and 0xfb.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:startEvent(Event(0xe6));
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