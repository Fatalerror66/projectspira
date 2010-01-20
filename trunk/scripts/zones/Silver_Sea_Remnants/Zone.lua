-----------------------------------
--	Author: ReaperX
-- 	Silver Sea Remnants 
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
cs = -1;
return cs;
end;

-- events : (not a complete list)
-- 0x1  : warp out (time limit up)
-- 0x32 : teleport animation -> fade black
-- 0x33 : teleport animation -> unfade 
-- 0x64 : locks client
-- 0x65 : locks client
-- 0x3  : nothing
-- 0xC8 : teleport menu + teleport to 2F
-- 0xC9 : teleport menu + teleport to 3F "3"
-- 0xCA : teleport menu + teleport to 3F "1"
-- 0xCB : teleport menu + teleport to 3F "4"
-- 0xCC : teleport menu + teleport to 3F "2"
-- 0xCD : teleport menu + teleport to 4F "1"
-- 0xCE : teleport menu + teleport to 4F "2"
-- 0xCF : locks client
-- 0x12c: "open the door?"

function onInitialize()

--registerRegion(zoneID, regionID, west, east, high, low , south, north ); 

registerRegion(0x4c, 1,  337,  343, -2, 0 , -303, -296 ); -- 1F -> 2F porter
registerRegion(0x4c, 2,  296,  305, -2, 0 ,  616,  624 ); -- 2F -> 3F porter "1"
registerRegion(0x4c, 3,  376,  383, -2, 0 ,  616,  624 ); -- 2F -> 3F porter "2"
registerRegion(0x4c, 4,  256,  263,  2, 4 ,  376,  383 ); -- 2F -> 3F porter "3"
registerRegion(0x4c, 5,  416,  423,  2, 4 ,  376,  383 ); -- 2F -> 3F porter "4"
registerRegion(0x4c, 6, -463, -456, -6,-4 , -303, -296 ); -- 3F -> 4F porter "1"
registerRegion(0x4c, 7, -223, -216, -6,-4 , -303, -296 ); -- 3F -> 4F porter "2"
registerRegion(0x4c, 8, -343, -336, -6,-4 ,   96,  102 ); -- 4F -> 5F porter

registerRegion(0x4c, 9, -303, -296, -2, 0 , 616, 623); -- porter back out (east)
registerRegion(0x4c,10, -383, -376, -2, 0 , 616, 623); -- porter back out (west)

--print("Silver Sea Remnants Teleporters Initialized.");

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
[2] = function (x)  -- Teleport 2F -> 3F "1" 
---------------------------------
  player:startEvent(Event(0xCA));
end,

---------------------------------
[3] = function (x)  -- Teleport 2F -> 3F "2" 
---------------------------------
  player:startEvent(Event(0xCC));
end,

---------------------------------
[4] = function (x)  -- Teleport 2F -> 3F "2" 
---------------------------------
  player:startEvent(Event(0xC9));
end,

---------------------------------
[5] = function (x)  -- Teleport 2F -> 3F "4" 
---------------------------------
  player:startEvent(Event(0xCB));
end,

---------------------------------
[6] = function (x)  -- Teleport 3F -> 4F "1" 
---------------------------------
  player:startEvent(Event(0xCD));
end,

---------------------------------
[7] = function (x)  -- Teleport 3F -> 4F "2" 
---------------------------------
  player:startEvent(Event(0xCE));
end,

---------------------------------
[8] = function (x)  -- Teleport 4F -> 5F
---------------------------------
  player:setPos(-340, -.5, 660); -- pos since I couldn't find a teleport event for this case
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
	player:setPos(580, 0, 500, 192, 0x48);	-- back out
end;
end;