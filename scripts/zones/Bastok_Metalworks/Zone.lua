require("/scripts/globals/common");
require("/scripts/globals/settings");

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,menuchoice) 

end;

---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
---------------------------------
-- "Stardust" Quest zone in order to repeat
if(player:getVar("Stardust_tempVar") == 2)then
	player:setVar("Stardust_tempVar",0);
end
---------------------------------
player:setAnimation(0);
cs = -1;
return cs;
end;
---------------------------------
-- onInitialize
---------------------------------

function onInitialize(zone)
--print("Loading Elevators...");
registerRegion(0xed,1,-59,-54,-10,2,10,14);
registerRegion(0xed,2,-59,-54,-10,2,-10,-14);
--print("Elevators Activated!");
end;

function onRegionEnter(player, regionID)
--Elevator IDs
elevatorA = getNPCById(0x10ed035,0xed);
elevatorB = getNPCById(0x10ed038,0xed);


switch (regionID): caseof {
---------------------------------
[1] = function (x)
---------------------------------
	--print("Lifting " .. player:getName());
	elevatorA:setState(10);
	player:setPos(-50,-10,12);
end,
---------------------------------
[2] = function (x)
---------------------------------
	--print("Dropping " .. player:getName());
	elevatorB:setState(10);
	player:setPos(-60,2,-12);
end,
---------------------------------
default = function (x)
end,}
end;