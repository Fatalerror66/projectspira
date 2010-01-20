-- Geyser added by ReaperX
-- teleports you up when you step on it
-- on official servers, the geyser is on a timer. This behavior
-- is not implemented right now. The geyser animation is missing.

require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0xBF;

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------


---------------------------------
-- onZoneIn
---------------------------------


---------------------------------
-- onInitialize
---------------------------------

function onInitialize(zone)
-- Dangruf Wadi Chest anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureChest",0);
--print("Dangruf Wadi chests illusion time reset.");
end;

function onInitialize()

registerRegion(0xbf, 1, -133.5, -132.7, 2, 3 , 132.6, 133.8 );  -- I-8 Geyser
registerRegion(0xbf, 2, -213.3, -212.7, 2.8, 3 , 92.7, 94 );    -- H-8 Geyser
registerRegion(0xbf, 3, -67.3, -66.5, 2.7, 3 , 523.8, 534.1 );  -- J-3 Geyser

--print("Dangruf Wadi Geysers initialized. ");
end

-- Wadi events :
-- 0x64 : menu offering teleportation to San d'Oria, Windurst, Elevator in Ghelsba, Bastok, Ronfaure forest (no idea what that's for)
-- 0x67 : unknown short-range teleport
-- 0x68 : teleport to the South Gusta zoneline of Wadi (K-10)
-- 0x0A : Geyser teleport up at I-8
-- 0x0B : Geyser teleport up at H-8 
-- 0x0C : Geyser teleport up at J-3
-- 0x78 : teleports you to F-7, pos of THF AF2 ??? (Saltlix)
-- 0x79 : teleports you to F-5, pos of THF AF2 ??? (Grasslix)
-- 0x7A : teleports you to E-12, pos of THF AF2 ??? (Eggvix)

function onRegionEnter(player, regionID)

if (player:hasKeyItem(0x3) == 1) then -- keyitem "blue acidity tester"
  player:removeKeyItem(0x3);          -- turns into 
  player:addKeyItem(0x4);             -- keyitem "red acidity tester"
end;

if (regionID == 1)  then
  player:startEvent(Event(0x0A));
elseif (regionID == 2) then
  player:startEvent(Event(0x0B));
elseif (regionID == 3) then
  player:startEvent(Event(0x0C));
end;
end;
 
   
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);

end;