-----------------------------------
--	Author: Tenjou
-- 	CONFLICT DIRECTOR: Mhabi Molkot
-- 	She gives rank 3 and above Windurstians a Ballista license.  She gives rank 3 and above adventurers from other nations permission to get their license.  Will also,if asked,give you a Ballista Earring.  Right now none of this works.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:startEvent(Event(0x19a));
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