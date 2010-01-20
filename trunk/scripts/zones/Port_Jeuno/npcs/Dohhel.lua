-----------------------------------
--	Author: Tenjou
-- 	BARD: Dohhel
-- 	Incomplete - Acts as if no quests are complete.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
event0x272c = Event(0x272c);
event0x272c:setParams(0xff,0xff,0xf,0xf,0xf,0xf,10,0);
player:startEvent(event0x272c);
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