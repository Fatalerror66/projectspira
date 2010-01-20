-----------------------------------
--	Author: Tenjou
--	DOOR: Departures Exit
--	Now works with Honorio!
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local airpass = player:hasKeyItem(8);
local gil = player:getCurrGil();
if (airpass == 0) then
	local event0xb7 = Event(0xb7);
	event0xb7:setParams(0,8);
	player:startEvent(event0xb7);
elseif (airpass == 1 and gil >= 200) then
	local event0x800b5 = Event(0x800b5);
	event0x800b5:setParams(0,0x08,0,0,0,0,0,200);
	player:startEvent(event0x800b5);
elseif (airpass == 1 and gil < 200) then
	local event0xb8 = Event(0xb8);
	event0xb8:setParams(0,0x08,0,0,0,0,0,200);
	player:startEvent(event0xb8);
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
--print("OPTION:",option);
if (csid == 0xb5 and option == nil) then
	player:removeGil(200);
end
end;