-----------------------------------
--	Author: ReaperX
--  Spatial Displacement
--  Teleports Player between segments of Riverne Site #A01
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------

base = 0x101E0E5; 

require("scripts/globals/settings");

function onTrigger(player,npc)

id = npc:getId();

if (id == base) then 
	player:startEvent(Event(0x2));
elseif (id == base+1) then 
	player:startEvent(Event(0x3));
elseif (id == base+2) then 
	player:startEvent(Event(0x4));
elseif (id == base+7) then 
	player:startEvent(Event(0x7));
elseif (id == base+8) then 
	player:startEvent(Event(0x8));
elseif (id == base+9) then 
	player:startEvent(Event(0x9));
elseif (id == base+10) then 
	player:startEvent(Event(0xA));
elseif (id == base+11) then 
	player:startEvent(Event(0xB));
elseif (id == base+12) then 
	player:startEvent(Event(0xC));
elseif (id == base+13) then 
	player:startEvent(Event(0xD));
elseif (id == base+14) then 
	player:startEvent(Event(0xE));
elseif (id == base+15) then 
	player:startEvent(Event(0xF));
elseif (id == base+16) then 
	player:startEvent(Event(0x10));
elseif (id == base+18) then 
	player:startEvent(Event(0x12));
elseif (id == base+20) then 
	player:startEvent(Event(0x14));
elseif (id == base+21) then 
	player:startEvent(Event(0x15));
elseif (id == base+22) then 
	player:startEvent(Event(0x16));
elseif (id == base+23) then 
	player:startEvent(Event(0x17));
elseif (id == base+24) then 
	player:startEvent(Event(0x18));
elseif (id == base+25) then 
	player:startEvent(Event(0x19));
elseif (id == base+26) then 
	player:startEvent(Event(0x1A));
elseif (id == base+27) then 
	player:startEvent(Event(0x1b));
elseif (id == base+28) then 
	player:startEvent(Event(0x1C));
elseif (id == base+29) then 
	player:startEvent(Event(0x1d));
elseif (id == base+30) then 
	player:startEvent(Event(0x1E));
elseif (id == base+31) then 
	player:startEvent(Event(0x1F));
elseif (id == base+33) then 
	player:startEvent(Event(0x21));
elseif (id == base+34) then 
	player:startEvent(Event(0x22));
elseif (id == base+35) then 
	player:startEvent(Event(0x23));
elseif (id == base+36) then 
	player:startEvent(Event(0x24));
elseif (id == base+37) then 
	player:startEvent(Event(0x25));
elseif (id == base+38) then 
	player:startEvent(Event(0x26));
elseif (id == base+39) then 
	player:startEvent(Event(0x27));
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
if (csid == 0x23) and (option == 1) then
 --print("Teleport to Monarch Linn is not currently implemented.");
 player:setPos(-503,-8.5,-382,0,0x1E);
elseif (csid == 0xA) and (option == 1) then
 player:setPos(-539,-30,360,0,0x19); -- back to Misareaux Coast
end;
end;
