-----------------------------------
--	Author: ReaperX
-- 	The Garden of Ru'Hmet
--  portals in the 5 towers
--  all the events I suspected of being the menu+animation caused a crash so
--  I implemented the ports as instant ports for now.

-- warp distortions on 2nd floor already worked

-- missing: central elevator
-----------------------------------

require("/scripts/globals/common");
require("/scripts/globals/settings");

---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
cs = -1;
return cs;
end;


function onInitialize()

--registerRegion(zoneID, regionID, west, east, high, low , south, north ); 

registerRegion(0x23, 1,  -505, -502, -3, -2 , 698, 702 ); -- floor 1 Hume tower up to floor 2
registerRegion(0x23, 2,  -102, -97, -3, -2 , 541, 545 );  -- floor 1 Elvaan tower up to floor 2
registerRegion(0x23, 3,  -178, -174, -3, -2 , 97, 103 );  -- floor 1 Galka tower up to floor 2
registerRegion(0x23, 4,  -498, -494, -3, -2 , 97, 103 );  -- floor 1 Taru tower up to floor 2
registerRegion(0x23, 5,  -742, -737, -3, -2 , 374, 378 ); -- floor 1 Mithra tower up to floor 2

-------------- map 2 down porters (displacement vector from map 1 to map 2 is 0,0,-800) --
registerRegion(0x23, 6,  -505, -502, -3, -2 , -102, -98 );  -- floor 2 Hume tower down to floor 1
registerRegion(0x23, 7,  -102, -97, -3, -2 , -259, -255 );  -- floor 2 Elvaan tower down to floor 1
registerRegion(0x23, 8,  -178, -174, -3, -2 , -703, -697 ); -- floor 2 Galka tower down to floor 1
registerRegion(0x23, 9,  -498, -494, -3, -2 , -703, -697 ); -- floor 2 Taru tower down to floor 1
registerRegion(0x23, 10, -742, -737, -3, -2 , -426, -422 ); -- floor 2 Mithra tower down to floor 1
  
-------------- map 2 up porters (north-south or east-west distance of up and down porters on floor 2 is 168) --
registerRegion(0x23, 11, -337, -334, -3, -2 , -102, -98 );  -- floor 2 Hume tower up to floor 3
registerRegion(0x23, 12, -102,  -97, -3, -2 , -427, -423 ); -- floor 2 Elvaan tower up to floor 3
registerRegion(0x23, 13, -346, -342, -3, -2 , -703, -697 ); -- floor 2 Galka tower up to floor 3
registerRegion(0x23, 14, -666, -662, -3, -2 , -703, -697 ); -- floor 2 Taru tower up to floor 3
registerRegion(0x23, 15, -742, -737, -3, -2 , -258, -254 ); -- floor 2 Mithra tower up to floor 3

------------- map 3 down porters ----------------------------
registerRegion(0x23, 16, 501, 504, -3, -2 , 697,702 ); -- floor 3 Hume tower down to floor 2
registerRegion(0x23, 17, 737, 743, -3, -2 , 375,378 ); -- floor 3 Elvaan tower down to floor 2
registerRegion(0x23, 18, 494, 498, -3, -2 , 97, 103 ); -- floor 3 Galka tower down to floor 2
registerRegion(0x23, 19, 175, 178, -3, -2 , 97, 103 ); -- floor 3 Taru tower down to floor 2
registerRegion(0x23, 20,  97, 102, -3, -2 , 541,545 ); -- floor 3 Mithra tower down to floor 2

------------- map 3 up porters ----------------------------
registerRegion(0x23, 21, 335, 337,  -3, -2 , 697, 703); -- floor 3 Hume tower up to floor 4
registerRegion(0x23, 22, 737, 742,  -3, -2 , 542, 545); -- floor 3 Elvaan tower up to floor 4
registerRegion(0x23, 23, 662, 665,  -3, -2 ,  97, 102); -- floor 3 Galka tower up to floor 4
registerRegion(0x23, 24, 341, 345,  -3, -2 ,  97, 102); -- floor 3 Taru tower up to floor 4
registerRegion(0x23, 25,  97, 102,  -3, -2 , 375, 378); -- floor 3 Mithra tower up to floor 4

------------- map 4 down porters  
registerRegion(0x23, 26, 334,  337, -3, -2,  -97, -103 ); -- floor 4 Hume tower down to floor 3
registerRegion(0x23, 27, 738,  743, -3, -2, -258, -254 ); -- floor 4 Elvaan tower down to floor 3
registerRegion(0x23, 28, 662,  665, -3, -2, -703, -698 ); -- floor 4 Galka tower down to floor 3
registerRegion(0x23, 29, 342,  344, -3, -2, -703, -698 ); -- floor 4 Taru tower down to floor 3
registerRegion(0x23, 30,  97,  102, -3, -2, -425, -422 ); -- floor 4 Mithra tower down to floor 3

--print("Garden of Ru'Hmet Teleporters Initialized.");

end

function onRegionEnter(player, regionID)

switch (regionID): caseof {
---------------------------------
[1] = function (x)  -- Portal F1 -> F2 Hume tower 
---------------------------------
  player:setPos(-497,-2,-100,0); 
end,

---------------------------------
[2] = function (x)  -- Portal F1 -> F2 Elvaan tower 
---------------------------------
  player:setPos(-100, -2, -262 ,64); 
end,

---------------------------------
[3] = function (x)  -- Portal F1 -> F2 Galka tower 
---------------------------------
  player:setPos(-183,-2, -700, 128); 
end,

---------------------------------
[4] = function (x)  -- Portal F1 -> F2 Taru tower 
---------------------------------
  player:setPos(-502,-2, -700, 128); 
end,

---------------------------------
[5] = function (x)  -- Portal F1 -> F2 Mithra tower 
---------------------------------
  player:setPos(-740,-2, -417, 192); 
end,


---------------------------------
[6] = function (x)  -- Portal F2 -> F1 Hume tower 
---------------------------------
  player:setPos(-497,-2, 700,0); 
end,

---------------------------------
[7] = function (x)  -- Portal F2 -> F1 Elvaan tower 
---------------------------------
  player:setPos(-100,-2, 537,64); 
end,

---------------------------------
[8] = function (x)  -- Portal F2 -> F1 Galka tower 
---------------------------------
  player:setPos(-182, -2, 100,128); 
end,

---------------------------------
[9] = function (x)  -- Portal F2 -> F1 Taru tower 
---------------------------------
  player:setPos(-503, -2, 100,128); 
end,

---------------------------------
[10] = function (x)  -- Portal F2 -> F1 Mithra tower 
---------------------------------
  player:setPos(-740, -2, 380 ,192); 
end,

---------------------------------
[11] = function (x) -- Portal F2 -> F3 Hume tower 
---------------------------------
  player:setPos(498, -2 , 700, 128); 
end,

---------------------------------
[12] = function (x) -- Portal F2 -> F3 Elvaan tower 
---------------------------------
  player:setPos(740, -2, 382, 192); 
end,


---------------------------------
[13] = function (x) -- Portal F2 -> F3 Galka tower 
---------------------------------
  player:setPos(502, -2 , 100, 0); 
end,

---------------------------------
[14] = function (x) -- Portal F2 -> F3 Taru tower 
---------------------------------
  player:setPos(182, -2, 100, 0); 
end,

---------------------------------
[15] = function (x) -- Portal F2 -> F3 Mithra tower 
---------------------------------
  player:setPos(100, -2, 538, 64); 
end,

---------------------------------
[16] = function (x) -- Portal F3 -> F2 Hume tower 
---------------------------------
  player:setPos(-343, -2 , -100,128); 
end,

---------------------------------
[17] = function (x) -- Portal F3 -> F2 Elvaan tower 
---------------------------------
  player:setPos(-100, -2 , -417,192); 
end,

---------------------------------
[18] = function (x) -- Portal F3 -> F2 Galka tower 
---------------------------------
  player:setPos(-338, -2 , -700, 0); 
end,

---------------------------------
[19] = function (x) -- Portal F3 -> F2 Taru tower 
---------------------------------
  player:setPos(-657, -2 , -700, 0); 
end,

---------------------------------
[20] = function (x) -- Portal F3 -> F2 Mithra tower 
---------------------------------
  player:setPos(-740, -2 , -262, 64); 
end,

---------------------------------
[21] = function (x) -- Portal F3 -> F4 Hume tower 
---------------------------------
  player:setPos(343, -2 , -100,128); 
end,

---------------------------------
[22] = function (x) -- Portal F3 -> F4 Elvaan tower 
---------------------------------
  player:setPos(740, -2, -261, 64); 
end,

---------------------------------
[23] = function (x) -- Portal F3 -> F4 Galka tower 
---------------------------------
  player:setPos( 656, -2, -700 ,128); 
end,

---------------------------------
[24] = function (x) -- Portal F3 -> F4 Taru tower 
---------------------------------
  player:setPos( 338, -2, -700, 128); 
end,

---------------------------------
[25] = function (x) -- Portal F3 -> F4 Mithra tower 
---------------------------------
  player:setPos( 100, -2, -414, 192); 
end,

---------------------------------
[26] = function (x) -- Portal F4 -> F3 Hume tower 
---------------------------------
  player:setPos(340, -3, 700, 128); 
end,

---------------------------------
[27] = function (x) -- Portal F4 -> F3 Elvaan tower 
---------------------------------
  player:setPos(740, -2, 537, 64); 
end,

---------------------------------
[28] = function (x) -- Portal F4 -> F3 Galka tower 
---------------------------------
  player:setPos(656, -2 , 100, 128); 
end,

---------------------------------
[29] = function (x) -- Portal F4 -> F3 Taru tower 
---------------------------------
  player:setPos(337, -2 , 100, 128); 
end,

---------------------------------
[30] = function (x) -- Portal F4 -> F3 Mithra tower 
---------------------------------
  player:setPos(100, -2 , 382, 192); 
end,
default = function (x)
--print("default");
end,}

end;
 
 
---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,option)
--print("CSID------------:",csid);
--print("OPTION----------:",option);
end;