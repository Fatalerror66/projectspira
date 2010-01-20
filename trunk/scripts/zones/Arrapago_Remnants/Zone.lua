-----------------------------------
--	Author: ReaperX
-- 	Arrapago Remnants
--  all porters working
--  missing: 
--  * event for the final porter 6F->7F
--  * alliance warps are not supported (when one player ports up, everyone else should get ported up too.)
-----------------------------------

require("/scripts/globals/common");
require("/scripts/globals/settings");

---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
player:addStatusEffect(EFFECT_ENCUMBRANCE, 0, 0, 0, 0);  -- inability to equip armor or weapons
player:addStatusEffect(EFFECT_OBLIVISCENCE, 0, 0, 0, 0); -- inability to use support job
player:addStatusEffect(EFFECT_IMPAIRMENT, 0, 0, 0, 0);   -- inability to use job abilities
player:addStatusEffect(EFFECT_OMERTA, 0, 0, 0, 0);       -- inability to use magic
player:addStatusEffect(EFFECT_DEVILITATION, 0, 0, 0, 0); -- the severe hampering of attributes
--player:specialMessage(1003); -- incredible psionic pressure
cs = -1;
return cs;
end;

-- events : (not a complete list)
-- 0x1  : warp out (time limit up)
-- 0xC8 : teleport menu + teleport to F2 (NE)
-- 0xC9 : teleport menu + teleport to F2 (SE)
-- 0xCA : teleport menu + teleport to F2 (SW)
-- 0xCB : teleport menu + teleport to F2 (NW)
-- 0xCC : teleport menu + teleport to F3 
-- 0xCD : teleport menu + teleport to F4 (south)
-- 0xCE : teleport menu + teleport to F4 (north)
-- 0xCF : teleport menu + teleport to F5 (SW)
-- 0xD0 : teleport menu + teleport to F5 (NE)
-- 0xD1 : teleport menu + teleport to F6
-- 0x12c: "open the door?"

function onInitialize()

--registerRegion(zoneID, regionID, west, east, high, low , south, north ); 

registerRegion(0x4a, 1,  256,  263, -22, -20 ,-343,-336); -- 1F -> 2F porter "1" (NW)
registerRegion(0x4a, 2,  256,  263, -22, -20 ,-504,-496); -- 1F -> 2F porter "2" (SW)
registerRegion(0x4a, 3,  416,  424, -22, -20 ,-504,-496); -- 1F -> 2F porter "3" (SE)
registerRegion(0x4a, 4,  416,  424, -22, -20 ,-343,-336); -- 1F -> 2F porter "4" (NE)
registerRegion(0x4a, 5,  336,  343,  -6,  -4 ,  96, 103); -- 2F -> 3F porter "5"
registerRegion(0x4a, 6,  336,  343,  -6,  -4 , 496, 503); -- 3F -> 4F porter "6" (North)
registerRegion(0x4a, 7,  336,  343,  -6,  -4 , 416, 423); -- 3F -> 4F porter "7" (South)
registerRegion(0x4a, 8, -303, -296,  -2,   0 ,-463,-456); -- 4F -> 5F porter "8" (NE)
registerRegion(0x4a, 9, -383, -376,  -2,   0 ,-623,-616); -- 4F -> 5F porter "9" (SW)
registerRegion(0x4a,10, -343, -336,  -2,   0 ,-103, -96); -- 5F -> 6F porter "A" 
registerRegion(0x4a,11, -343, -336,  -2,   0 , 295, 303); -- 6F -> 7F porter "B"

registerRegion(0x4a,12, -383, -376,  -2,   0 , 576, 583); -- 7F exit porter west 
registerRegion(0x4a,13, -303, -296,  -2,   0 , 576, 583); -- 7F exit porter east


--print("Arrapago Remnants Teleporters Initialized.");

end

function onRegionEnter(player, regionID)
--print("region entered!");
switch (regionID): caseof {
---------------------------------
[1] = function (x)  -- Teleport 1F -> 2F "1" (NW)
---------------------------------
  player:startEvent(Event(0xCB));
end,

---------------------------------
[2] = function (x)  -- Teleport 1F -> 2F "2" (SW)
---------------------------------
  player:startEvent(Event(0xCA));
end,

---------------------------------
[3] = function (x)  -- Teleport 1F -> 2F "3" (SE)
---------------------------------
  player:startEvent(Event(0xC9));
end,

---------------------------------
[4] = function (x)  -- Teleport 1F -> 2F "4" (NE)
---------------------------------
  player:startEvent(Event(0xC8));
end,

---------------------------------
[5] = function (x)  -- Teleport 2F -> 3F "5"
---------------------------------
  player:startEvent(Event(0xCC));
end,

---------------------------------
[6] = function (x)  -- Teleport 2F -> 3F "6" (North)
---------------------------------
  player:startEvent(Event(0xCE));
end,

---------------------------------
[7] = function (x)  -- Teleport 2F -> 3F "7" (South)
---------------------------------
  player:startEvent(Event(0xCD));
end,

---------------------------------
[8] = function (x)  -- Teleport  4F -> 5F porter "8" (NE)
---------------------------------
  player:startEvent(Event(0xD0));
end,

---------------------------------
[9] = function (x)  -- Teleport  4F -> 5F porter "9" (SW)
---------------------------------
  player:startEvent(Event(0xCF));
end,

---------------------------------
[10] = function (x)  -- Teleport  5F -> 6F porter "A"
---------------------------------
  player:startEvent(Event(0xD1));
end,

---------------------------------
[11] = function (x)  -- Teleport 6F -> 7F porter "B"
---------------------------------
  player:setPos(-340, -.5, 620, 64); -- pos since I couldn't find a teleport event for this case
end,

[12] = function (x)  -- Teleport out
---------------------------------
  player:startEvent(Event(0x1));
end,

[13] = function (x)  -- Teleport out
---------------------------------
  player:startEvent(Event(0x1));
end,

default = function (x)
--print("default");
end,}

end;
 
 
---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x1) then 
  player:removeStatusType(EFFECT_ENCUMBRANCE);
  player:removeStatusType(EFFECT_OBLIVISCENCE);
  player:removeStatusType(EFFECT_IMPAIRMENT);
  player:removeStatusType(EFFECT_OMERTA);
  player:removeStatusType(EFFECT_DEVILITATION);
  player:setPos(-580, 0, -100, 192, 0x48);	-- back out
end;
end;