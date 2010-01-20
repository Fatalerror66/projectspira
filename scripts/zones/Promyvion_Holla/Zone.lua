-----------------------------------
--	Author: ReaperX
-- 	Promyvion-Holla
--  all teleporters are active for now
--  to do: activate porters up only when MRs are killed, spawn only one MR per level
--  can't return to Hall of Transference for now (setPos causes a lua error)
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
registerRegion(0x10,  0,  78,  82, -2, 0,  78 ,  82 ); -- exit Promyvion - Holla (J-7)
registerRegion(0x10,  1, -42, -38, -1, 0, 198 , 202 ); -- Level 1 MR spawn point (I-6)
registerRegion(0x10,  2,  -2,   2, -1, 0, -42 , -38 ); -- Level 2 MR spawn point (I-9)
registerRegion(0x10,  3,-162,-157, -1, 0,-202 ,-198 ); -- Level 2 MR spawn point (G-11)
registerRegion(0x10,  4,-282,-278, -1, 0, -42 , -38 ); -- Level 2 MR spawn point (F-9)
registerRegion(0x10,  5,-240,-237, -1, 0,  38 ,  41 ); -- Level 2 MR spawn point (F-8)
registerRegion(0x10,  6,-122,-118, -1, 0,  -2 ,   2 ); -- Level 2 porter down to Level 1 (H-8)
registerRegion(0x10,  7,-162,-158, -1, 0, 118 , 122 ); -- Level 3 west porter down to Level 2 (G-7)
registerRegion(0x10,  8,-362,-358, -1, 0, 118 , 122 ); -- Level 3 MR spawn point D/E-7
registerRegion(0x10,  9,-362,-358, -1, 0, 237 , 242 ); -- Level 3 MR spawn point D/E-5
registerRegion(0x10, 10,-282,-278, -1, 0, 277 , 282 ); -- Level 3 MR spawn point E/F-5
registerRegion(0x10, 11, 158, 162, -1, 0, 238 , 242 ); -- Level 3 east Porter down to Level 2 (K-5)
registerRegion(0x10, 12, 278, 282, -1, 0, 197 , 202 ); -- Level 3 MR spawn point M-6
registerRegion(0x10, 13,  38,  42, -1, 0, 318 , 322 ); -- Level 3 MR spawn point J-4
registerRegion(0x10, 14, 158, 162, -1, 0, 358 , 362 ); -- Level 3 MR spawn point K-4
registerRegion(0x10, 15, 118, 121, -1, 0,-322 ,-318 ); -- Level 4 Porter down to Level 3 (K-12)
--print("Promyvion-Holla Teleporters Initialized.");
end

--[[                     Teleport Events  
unknown: difference between teleport events leading to the same destination, if any.

0x1E up to level 4 entry point
0x1F up to level 4 entry point
0x20 up to level 4 entry point

0x21 up to level 3 east entry point 
0x22 up to level 3 west entry point
0x23 up to level 3 west entry point
0x24 up to level 3 east entry point

0x25 up to level 2 entry point

0x26 up to level 4 entry point
0x27 up to level 4 entry point
0x28 up to level 4 entry point

0x29 return to level 1 entry point
0x2A return to level 2 entry point
0x2B return to level 3 entry point (east)
0x2C return to level 3 entry point (west)
0x2D return to level 2 entry point
0x2E leave Promyvion
0x2F teleport animation -> fade to black
0x30 teleport animation
0x31 TARGET NPC IS NULL crash
0x32 
0x33
0x34
--]]

function onRegionEnter(player, regionID)

switch (regionID): caseof {

---------------------------------
[0] = function (x)  -- 
---------------------------------
  player:startEvent(Event(0x2E));
end,

---------------------------------
[1] = function (x)  -- 
---------------------------------
  player:startEvent(Event(0x25));
end,

---------------------------------
[2] = function (x)  -- 
---------------------------------
  if (math.random()>=0.5) then
    player:startEvent(Event(0x21));  
  else
    player:startEvent(Event(0x22));  
  end
end,

---------------------------------
[3] = function (x)  -- 
---------------------------------
  if (math.random()>=0.5) then
    player:startEvent(Event(0x21));  
  else
    player:startEvent(Event(0x22));  
  end
end,

---------------------------------
[4] = function (x)  -- 
---------------------------------
  if (math.random()>=0.5) then
    player:startEvent(Event(0x21));  
  else
    player:startEvent(Event(0x22));  
  end
end,

---------------------------------
[5] = function (x)  -- 
---------------------------------
  if (math.random()>=0.5) then
    player:startEvent(Event(0x21));  
  else
    player:startEvent(Event(0x22));  
  end
end,

---------------------------------
[6] = function (x)  -- 
---------------------------------
  player:startEvent(Event(0x29));
end,

---------------------------------
[7] = function (x)  -- 
---------------------------------
  player:startEvent(Event(0x2A));
end,

---------------------------------
[8] = function (x)  -- 
---------------------------------
  player:startEvent(Event(0x1E));
end,

---------------------------------
[9] = function (x)  -- 
---------------------------------
  player:startEvent(Event(0x1E));
end,

---------------------------------
[10] = function (x)  -- 
---------------------------------
  player:startEvent(Event(0x1E));
end,


---------------------------------
[11] = function (x)  -- 
---------------------------------
  player:startEvent(Event(0x2A));
end,

---------------------------------
[12] = function (x)  -- 
---------------------------------
  player:startEvent(Event(0x1E));
end,

---------------------------------
[13] = function (x)  -- 
---------------------------------
  player:startEvent(Event(0x1E));
end,

---------------------------------
[14] = function (x)  -- 
---------------------------------
  player:startEvent(Event(0x1E));
end,

---------------------------------
[15] = function (x)  -- 
---------------------------------
  if (math.random()>=0.5) then
    player:startEvent(Event(0x2B));  
  else
    player:startEvent(Event(0x2C));  
  end
end,

default = function (x)
--print("default");
end,}

end;
  
---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x2E) then
  --player:setPos(-260,0,280, 0, 0x0E) -- back to Hall of Transference
end;
end;