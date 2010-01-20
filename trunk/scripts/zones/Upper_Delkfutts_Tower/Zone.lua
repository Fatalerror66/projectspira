--	Author: ReaperX
-- 	Teleporters
----------------------------------------
-- Includes
require("/scripts/globals/common");
require("/scripts/globals/settings");
----------------------------------------

ZONE_ID = 0x9E;

-- events:
-- 0000 : menu->teleport animation -> port to Lower Delkfutt's Tower 3F G-7
-- 0001 : menu->teleport animation -> fade to black
-- 0003 : animation (runs to elevator)
-- 0004 : ports player to elevator
-- 000D : walks 
-- 0005 : teleports player to top of staircase 
-- 0007, 0008, 0009, 000A, 000B, 000C ports between different parts of the stairs down
-- 000E : teleport animation
-- 0012 : nothing?


---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------


---------------------------------
-- onZoneIn
---------------------------------
function onZoneIn(player,prevZone)
player:setVar("porter_lock",0);
cs = -1;
return cs;
end;


---------------------------------
-- onInitialize
---------------------------------

function onInitialize(zone)
-- Middle Delkfutts Tower chest anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureChest",0);
--print("Delkfutts Tower chests illusion time reset.");

registerRegion(0x9e, 1, -369, -365, -146, -145,  83,  89 ); -- Tenth Floor F-6 porter to Middle Delkfutt's Tower
registerRegion(0x9e, 2, -369, -365, -178, -177, -49, -43 ); -- Twelfth Floor F-10 porter to Stellar Fulcrum
--print("Upper Delkfutt's Tower Teleporters initialized.")
end;

function onRegionEnter(player, regionID)

if (player:getVar("porter_lock") == 0) then
  switch (regionID): caseof {
  ---------------------------------
  [1] = function (x)
  ---------------------------------
    player:setVar("porter_lock",1);
    player:startEvent(Event(1));
  end,
  
  ---------------------------------
  [2] = function (x)
  ---------------------------------
    player:setVar("porter_lock",1);
    player:startEvent(Event(1));
  end,
  
  default = function (x)
  --print("default");
  end,}
end;
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0) then
  player:setVar("porter_lock",0);
  if (option == 1) then
    player:setPos(-490 , -130 , 81, 231, 0xB8);
  end;
elseif (csid == 1) then
  player:setVar("porter_lock",0);
  if (option == 1) then
    player:setPos(-520 , 1 , -23, 192, 0xB3); -- to stellar fulcrum
  end;
end;
end;
