-----------------------------------
--	Author: ReaperX
-- 	Bhaflau Remnants
--  all porters working
--  missing: 
--  * event for the final porter 4F->5F
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
-- 0xC8 : teleport menu + teleport to 2F
-- 0xC9 : teleport menu + teleport to 3F NW
-- 0xCA : teleport menu + teleport to 3F SW
-- 0xCB : teleport menu + teleport to 3F NE
-- 0xCC : teleport menu + teleport to 3F SE
-- 0xCD : teleport menu + teleport to 4F West
-- 0xCE : teleport menu + teleport to 4F East
-- 0xCF : locks client
-- 0x12c: "open the door?"

function onInitialize()

--registerRegion(zoneID, regionID, west, east, high, low , south, north ); 

registerRegion(0x4b, 1,  336,  344, -2, 0 ,-423,-417); -- 1F -> 2F porter
registerRegion(0x4b, 2,  296,  303, -2, 0 ,  56,  63); -- 2F -> 3F porter (SW)
registerRegion(0x4b, 3,  377,  383, -2, 0 ,  56,  63); -- 2F -> 3F porter (SE)
registerRegion(0x4b, 4,  416,  423,  2, 3 , 296, 303); -- 2F -> 3F porter (NE)
registerRegion(0x4b, 5,  256,  263,  2, 3 , 296, 303); -- 2F -> 3F porter (NW)
registerRegion(0x4b, 6, -464, -456, -6,-4 ,-503,-496); -- 3F -> 4F porter (West)
registerRegion(0x4b, 7, -224, -216, -6,-4 ,-503,-496); -- 3F -> 4F porter (East)
registerRegion(0x4b, 8, -343, -336, -6,-4 ,  57,  64); -- 4F -> 5F porter

registerRegion(0x4b, 9, -303, -296, -2, 0 , 376, 383); -- porter back out (east)
registerRegion(0x4b,10, -383, -376, -2, 0 , 376, 383); -- porter back out (west)

--print("Bhaflau Remnants Teleporters Initialized.");

end

function onRegionEnter(player, regionID)
--print("region entered!");
switch (regionID): caseof {
---------------------------------
[1] = function (x)  -- Teleport 1F -> 2F
---------------------------------
  player:startEvent(Event(0xC8));
end,

---------------------------------
[2] = function (x)  -- Teleport 2F -> 3F (SW)
---------------------------------
  player:startEvent(Event(0xCA));
end,

---------------------------------
[3] = function (x)  -- Teleport 2F -> 3F (SE)
---------------------------------
  player:startEvent(Event(0xCC));
end,

---------------------------------
[4] = function (x)  -- Teleport 2F -> 3F (NE)
---------------------------------
  player:startEvent(Event(0xCB));
end,

---------------------------------
[5] = function (x)  -- Teleport 2F -> 3F (NW)
---------------------------------
  player:startEvent(Event(0xC9));
end,

---------------------------------
[6] = function (x)  -- Teleport 3F -> 4F (West)
---------------------------------
  player:startEvent(Event(0xCD));
end,

---------------------------------
[7] = function (x)  -- Teleport 3F -> 4F (East)
---------------------------------
  player:startEvent(Event(0xCE));
end,

---------------------------------
[8] = function (x)  -- Teleport 4F -> 5F 
---------------------------------
  player:setPos(-339, -.5, 340, 192); -- pos since I couldn't find a teleport event for this case
end,

[9] = function (x)  -- Teleport out
---------------------------------
  player:startEvent(Event(1));
end,

[10] = function (x)  -- Teleport out
---------------------------------
  player:startEvent(Event(1));
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
  player:setPos(620, 0, -260, 64, 0x48);	-- back out
end;
end;