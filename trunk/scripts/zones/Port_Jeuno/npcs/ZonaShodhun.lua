-----------------------------------
--	Author: Tenjou
-- 	Zona Shodhun
-- 	Incomplete - Offers shortcut out of Jeuno MH
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
event0x2727 = Event(0x2727);
event0x2727:setParams(0,0,0,0,0,0,0,0);
player:startEvent(event0x2727);
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