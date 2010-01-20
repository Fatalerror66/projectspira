-----------------------------------
--	Author: ReaperX
-- 	Hall of Transference
--  Consists of three separate but identically looking areas, for dem, holla and mea:
--   280 -80 -68 (mea?)
--  -260 -40 -280 (dem?)
--  -260 0 280 (holla?)
-- 
-- the east/west and north south coordinates of these points form a triangle with a point in the
-- northeast, a point in the southeast, and a point in the west. That's why I assume the first is 
-- the mea hall of transference, second is dem, third is holla.

-- bug: when you first select No to "Use the device?", and then try to port, an unspecified LUA error
-- occurs.

--  see scripts/cop-mission-status.txt for a description of the values of the server variable COP_MISSION_STATUS

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
--------------------------------------------------
---  Map Numbers and letters refer to http://wiki.ffxiclopedia.org/wiki/Alzadaal_Undersea_Ruins
---------------------------------------------------

--registerRegion(zoneID, regionID, west, east, high, low , south, north ); 

registerRegion(0x000e, 1, 277, 282, -83, -82 , -80, -77 );     -- porter back to mea
registerRegion(0x000e, 2, -281, -277, -43, -42 , -277, -282 ); -- porter back to dem
registerRegion(0x000e, 3, -281, -277, -3, -2 , 277, 283 );     -- porter back to holla
  
--print("Hall of Transference Teleporters Initialized.");

end

function onRegionEnter(player, regionID)
switch (regionID): caseof {
---------------------------------
[1] = function (x)  -- Portal --
---------------------------------
	--print("port back to mea")
	player:startEvent(Event(0x00A1)); -- Use the device? /nYes/nNo. 
end,

---------------------------------
[2] = function (x)  -- Portal --
---------------------------------
	--print("port back to dem")
	player:startEvent(Event(0x00A1)); -- Use the device? /nYes/nNo. 
end,

---------------------------------
[3] = function (x)  -- Portal --
---------------------------------
	--print("port back to holla")
	player:startEvent(Event(0x00A1)); -- Use the device? /nYes/nNo. 
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

if (option == 1)  and (csid == 0x00A1) then
	x = player:getXPos()
	z = player:getZPos()
	if (x > 0) then
		player:setPos(179,35,250,64,0x75);  -- -> back to mea shattered telepoint
	elseif (z < 0) then
		player:setPos(131,20,220,128,0x6c); -- -> back to dem shattered telepoint
	else
		player:setPos(338,19, -60, 0,0x66);  -- -> back to holla shattered telepoint
	end;
end

end;