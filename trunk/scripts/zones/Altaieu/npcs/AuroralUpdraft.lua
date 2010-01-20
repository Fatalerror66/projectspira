-----------------------------------
--	Author: ReaperX
-- 	Auroral Updraft
-- 	Teleport player to the palace entrance, or back to Sealion's Den.
-----------------------------------

-- Events: 
-- 0x96 return to the Sealion's Den
-- 0x9A - 0x9E return to palace entrance

-- Problem: I could find no combination of event or update parameters that would 
-- make 0x9A teleport the player and then play the reappearing animation. So I'm
-- porting the player via zonepos and then playing the reappearing animation 0x33.

-- Small bug (?): player remains event-locked after porting back to palace entrance,
-- needs to press ESC.

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
X  = player:getXPos();
Z  = player:getZPos();
if (X > -54) and (X < -24) and (Z > -650) and (Z < -614) then
	player:startEvent(Event(0x96));
else
	player:startEvent(Event(0x9A));
end;
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x96) and (option == 1) then
	player:setPos(610, 132, 774, 180, 0x20);	-- to Sealion's Den
elseif (csid == 0x9A) and (option == 1) then
	player:setPos(-25, 0, -615, 200);	-- to Palace Entrance
	player:startEvent(Event(0x33));
end;
end;

