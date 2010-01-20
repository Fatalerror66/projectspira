-----------------------------------
--	Author: Tenjou
-- 	TRAVELING BARD: Burute-Sorute
-- 	INCOMPLETE: Changes available titles for players.  Not sure what the difference is between events 0x2713 and 0x2714.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
event0x2714 = Event(0x2714);
event0x2714:setParams(0,0,0,0,0,0,0,0xffffffff);
player:startEvent(event0x2714);
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