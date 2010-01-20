-----------------------------------
--	Author: Arcanedemon
-- 	Signposts
-- 	Basic Chat Text
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)


SignPostX = math.abs(math.ceil(npc:getXPos()));
SignPostZ = math.abs(math.ceil(npc:getZPos()));
PlayerX = math.abs(math.ceil(player:getXPos()));
PlayerZ = math.abs(math.ceil(player:getZPos()));
PSX = math.abs(PlayerX - SignPostX);
PSZ = math.abs(PlayerZ - SignPostZ);

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
 if (SignPostX == 441) then
	if (PSX <= 2 and PSZ <= 2) then
		player:startEvent(Event(0x0003));
	else
		player:startEvent(Event(0x0004));
	end
 elseif (SignPostX == 258) then
	if (PSX <= 2 and PSZ <= 2) then
		player:startEvent(Event(0x0005));
	else
		player:startEvent(Event(0x0006));
	end
 elseif (SignPostX == 659) then
	if (PSX <= 2 and PSZ <= 2) then
		player:startEvent(Event(0x0007));
	else
		player:startEvent(Event(0x0008));
	end
 elseif (SignPostX == 466) then
	if (PSX <= 2 and PSZ <= 2) then
		player:startEvent(Event(0x0009));
	else
		player:startEvent(Event(0x000A));
	end
 elseif (SignPostX == 539) then
	if (PSX <= 2 and PSZ <= 2) then
		player:startEvent(Event(0x000B));
	else
		player:startEvent(Event(0x000C));
	end
 elseif (SignPostX == 280) then
	if (PSX <= 2 and PSZ <= 2) then
		player:startEvent(Event(0x000D));
	else
		player:startEvent(Event(0x000E));
	end
 elseif (SignPostX == 297) then
	if (PSX <= 2 and PSZ <= 2) then
		player:startEvent(Event(0x000F));
	else
		player:startEvent(Event(0x0010));
	end
 else
	if (PSX <= 2 and PSZ <= 2) then
		player:startEvent(Event(0x0011));
	else
		player:startEvent(Event(0x0012));
	end
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