--	Author: ReaperX
-- 	Teleporters


require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0x9D;


--[[ teleport events:
 
 0000 menu -> port animation -> fade darkness
 0001 menu -> port animation -> fade darkness
 0002 menu -> port animation -> fade darkness
 000A menu -> port animation -> fade darkness
 0003 menu -> ports to 7th floor "G" (F-10)
 0005 menu -> ports to 7th floor "H" (I-10)
 0007 menu -> ports to 7th floor "I" (J-7)
 0009 menu -> ports to 6th floor H-6 (teleport from J)
 0004 menu -> ports to 6th floor "G" (G-10)
 0006 menu -> ports to 6th floor "H" (J-10)
 0008 menu -> ports to 6th floor "I" (J-6)
 000B port animation -> fade darkness
 000C port animation
 000D port animation
 0010 nothing?
--]]

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
registerRegion(0x9d, 1, -36, -30, -50, -49,  83,  89 ); -- Fourth Floor G-6 porter to Lower Delkfutt's Tower
registerRegion(0x9d, 2, -49, -43, -50, -49, -50, -43 ); -- Fourth Floor G-6 porter to Lower Delkfutt's Tower "1"
registerRegion(0x9d, 3, 103, 109, -50, -49,  10,  16 ); -- Fourth Floor J-6 porter to Lower Delkfutt's Tower "2"
registerRegion(0x9d, 4,  83,  89, -82, -81, -48, -43 ); -- Sixth Floor J-10 porter to Seventh Floor "H"
registerRegion(0x9d, 5, -49, -43, -82, -81, -48, -43 ); -- Sixth Floor F-10 porter to Seventh Floor "G"
registerRegion(0x9d, 6,  84,  89, -82, -81,  83,  89 ); -- Sixth Floor J-6 porter to Seventh Floor "I"
registerRegion(0x9d, 7,-489,-483, -98, -97, -48, -43 ); -- Seventh Floor F-10 porter to Sixth Floor "G"
registerRegion(0x9d, 8,-356,-351, -98, -97, -48, -43 ); -- Seventh Floor J-10 porter to Sixth Floor "H"
registerRegion(0x9d, 9,-356,-351, -98, -97,  84,  88 ); -- Seventh Floor  J-6 porter to Sixth Floor "I"
registerRegion(0x9d,10,-415,-411, -98, -97, 104, 108 ); -- Seventh Floor  H-6 porter to Sixth Floor "J"
registerRegion(0x9d,11,-489,-484,-130,-129,  84,  88 ); -- Ninth Floor F-6 porter to Upper Delkfutt's Tower

--print("Middle Delkfutt's Tower Teleporters initialized.")
end;

function onRegionEnter(player, regionID)

if (player:getVar("porter_lock") == 0) then
  switch (regionID): caseof {
  ---------------------------------
  [1] = function (x)
  ---------------------------------
    player:setVar("porter_lock",1);
    player:startEvent(Event(0));
  end,
  
  ---------------------------------
  [2] = function (x)
  ---------------------------------
    player:setVar("porter_lock",1);
    player:startEvent(Event(1));
  end,
  
  ---------------------------------
  [3] = function (x)
  ---------------------------------
    player:setVar("porter_lock",1);
    player:startEvent(Event(2));
  end,
  
  ---------------------------------
  [4] = function (x)
  ---------------------------------
    player:setVar("porter_lock",1);
    player:startEvent(Event(5));
  end,
  
  ---------------------------------
  [5] = function (x)
  ---------------------------------
    player:setVar("porter_lock",1);
    player:startEvent(Event(3));
  end,
  
  ---------------------------------
  [6] = function (x)
  ---------------------------------
    player:setVar("porter_lock",1);
    player:startEvent(Event(7));
  end,
  
  --------------------------------
  [7] = function (x)
  ---------------------------------
    player:setVar("porter_lock",1);
    player:startEvent(Event(4));
  end,
  
  ---------------------------------
  [8] = function (x)
  ---------------------------------
    player:setVar("porter_lock",1);
    player:startEvent(Event(6));
  end,
  
  ---------------------------------
  [9] = function (x)
  ---------------------------------
    player:setVar("porter_lock",1);
    player:startEvent(Event(8));
  end,
  
  ---------------------------------
  [10] = function (x)
  ---------------------------------
    player:setVar("porter_lock",1);
    player:startEvent(Event(9));
  end,
  
  ---------------------------------
  [11] = function (x)
  ---------------------------------
    player:setVar("porter_lock",1);
    player:startEvent(Event(0xA));
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
    player:setPos(412 , -32 , 80, 100, 0xB8);
  end;
elseif (csid == 1) then
  player:setVar("porter_lock",0);
  if (option == 1) then
    player:setPos(388 , -32 , -40, 231, 0xB8);
  end;
elseif (csid == 2) then
  player:setVar("porter_lock",0);
  if (option == 1) then
    player:setPos(540 , -32 ,  20, 128, 0xB8);
  end;
elseif (csid == 0xA) then
  player:setVar("porter_lock",0);
  if (option == 1) then
    player:setPos(-355 , -144 ,  91, 64, 0x9E);
  end;
elseif (csid <= 6) and (csid >= 3) then
  player:setVar("porter_lock",0);
end;
end;


