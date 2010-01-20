require("/scripts/globals/common");
require("/scripts/globals/settings");

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,option) 
--print("CSID:",csid);
--print("Option:",option);
if (csid == 0x55) then
	player:setPos(0,-17,135,60,0xef);
end
end;

---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
if (player:getMissionStatus(2,22) == 1) and (player:getVar("mission_status") == 2) then
	player:setVar("mission_status",3);
	cs = 0x14F;
else
	cs = -1;
end;
return cs;
end;


---------------------------------
---   Initialize code here ...   ----------------
---------------------------------

function onInitialize()
currZone = 0xf2;
--print("Initializing exit portal...");
registerRegion(currZone,1,-1,1,-1,1,-35,-33);
--print("Heaven's Tower exit portal opened!");
end;
 
 
function onRegionEnter(player, regionID)

switch (regionID): caseof {
---------------------------------
[1] = function (x)  -- Heaven's Tower exit portal
---------------------------------
	player:startEvent(Event(0x55));
end,
---------------------------------
default = function (x) end,}
end;