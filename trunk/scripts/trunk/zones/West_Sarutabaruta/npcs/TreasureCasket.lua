-----------------------------------
--	Author: Tenjou
-- 	TREASURE CASKETS
-- 	The blues can give temporary items,and the browns give items and gear!
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local event0x3ea = Event(0x3ea);
event0x3ea:setParams(5,1,0x49aa9,0xffffee2f,0xdf1f,0x6f8,0x2e624,0);
player:startEvent(event0x3ea);
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
--print("HELLO!!!!");
--print("OPTION:",option);
--print("CSID:",csid);
end;