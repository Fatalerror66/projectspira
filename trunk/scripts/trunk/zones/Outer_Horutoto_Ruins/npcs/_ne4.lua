-----------------------------------
--	Author: Tenjou
-- 	Strange Apparatus
-- 	Gives players a prize!
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
event0x40 = Event(0x41);
event0x40:setParams(0xf,0xf,0xf,0xf,0xf,0xf,0xf,0xf);
player:startEvent(event0x40);
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade
end; 
 
 -----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;