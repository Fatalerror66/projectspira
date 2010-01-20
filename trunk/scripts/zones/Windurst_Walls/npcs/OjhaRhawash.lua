-----------------------------------
--	Author: Tenjou
-- 	Ojha Rhawash
-- 	Opens mog house exits when you trade a flower to her.  Something is preventing her from acting properly.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local event0x82710 = Event(0x82710);
event0x82710:setParams(0xee,0x01,0xfffffffe,0x38,0x03,0x0a,0xef,0x01);
player:startEvent(event0x82710);
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