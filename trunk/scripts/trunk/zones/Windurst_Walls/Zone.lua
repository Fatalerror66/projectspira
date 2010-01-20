require("/scripts/globals/common");
require("/scripts/globals/settings");


---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
player:setAnimation(0);
if player:getMissionStatus(2,23) == 1 and player:getVar("mission_status") == 6 then
	player:setVar("mission_status",7);
	cs = 0x1BB; -- final CS for windurst missions.
else
	cs = -1;
end;
return cs;
end;


---------------------------------
---   Initialize code here ...   ----------------
---------------------------------

function onInitialize()
currZone = 0xef;
--print("Initializing Heaven's Tower Gate...");
registerRegion(currZone,1,-2,2,-17,-16,140,142);
--print("Heaven's Tower portal opened!");
end;


function onRegionEnter(player, regionID)
switch (regionID): caseof {
---------------------------------
[1] = function (x)  -- Heaven's Tower portal
---------------------------------
	player:startEvent(Event(0x56));
end,
---------------------------------
default = function (x) end,}
end;
 
 
---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,menuchoice) 
--print("CSID:",csid);
if(csid == 0x1bb) then
	player:setVar("firstLogin",-1);
	--print("Firstlogin now set to -1");
elseif (csid == 0x56) then
	player:setPos(0,0,-30,0xc0,0xf2);
elseif (csid == 0x1BB) then
	print("rank 10 rankup!!!");
end
end;