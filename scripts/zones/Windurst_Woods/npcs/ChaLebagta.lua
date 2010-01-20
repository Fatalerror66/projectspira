-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Cha Lebagta
-- 	Working 100%.  Changes dialogue during quest "Mihgo's Amigo"
--  involved in THF AF2
-----------------------------------

Grapnel = 0x4442;

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local amigo = player:getVar("mihgosAmigo");
if (player:getVar("THF_AF2_status") == 1) then
	event = Event(0x1FB);
	event:setParams(0,Grapnel);
	player:startEvent(event);
elseif (amigo == 1) then
	local event0x55 = Event(0x55);
	event0x55:setParams(0,0x1f2);
	player:startEvent(event0x55);
elseif (amigo == 2) then
	local event0x5b = Event(0x5b);
	event0x5b:setParams(0,0x1f2);
	player:startEvent(event0x5b);
else
	player:startEvent(Event(0x4e));
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