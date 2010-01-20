require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0xC0;

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,menuchoice) 
end;

---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
cs = -1;
return cs;
end;


---------------------------------
---   Initialize code here ...   ----------------
---------------------------------

function onInitialize()
registerRegion(ZONE_ID,1,-262,-258,-1,1,-32,-28);
--print("Initializing Red Zone...");
registerRegion(ZONE_ID,2,-266,-262,-1,1,-26,-22);
--print("Initializing White Zone...");
registerRegion(ZONE_ID,3,-258,-254,-1,1,-26,-22);
--print("Initializing Black Zone...");
--print("Three Mage Gate activated!");

-- Horutoto Ruins chest anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureChest",0);
--print("Horutoto Ruins chests illusion time reset.");
end;
 
 
function onRegionEnter(player, regionID)
job = player:getMainJob();
redgate = getNPCById(0x10c00c1,0xc0);
whitegate = getNPCById(0x10c00c2,0xc0);
blackgate = getNPCById(0x10c00c3,0xc0);
portal = getNPCById(0x10c00c4,0xc0);
door = getNPCById(0x10c00c3,0xc0);

switch (regionID): caseof {
---------------------------------
[1] = function (x)  -- THREE MAGE GATE: Red Zone --
---------------------------------
	if (job == 5) then
		--print("Red Mage activating Red Zone...");
		redgate:setState(10);
	else
		--print("Other player on Red Zone.");
	end
end,
---------------------------------
[2] = function (x)  -- THREE MAGE GATE: White Zone --
---------------------------------
	if (job == 3) then
		--print("White Mage activating White Zone...");
		whitegate:setState(10);
	else
		--print("Other player on White Zone.");
	end
end,
---------------------------------
[3] = function (x)  -- THREE MAGE GATE: Black Zone --
---------------------------------
	if (job == 4) then
		--print("Black Mage activating Black Zone...");
		blackgate:setState(10);
	else
		--print("Other player on Black Zone.");
	end
end,
default = function (x)
end,}

--print(redgate:getState(),whitegate:getState(),blackgate:getState());
if (redgate:getState() == 8 and whitegate:getState() == 8 and blackgate:getState() == 8) then
--ACTIVATE PORTAL--
portal:setState(15);
--print("Portal Activated!");
else
end

if (portal:getState() == 8) then
--OPEN DOOR--
door:setState(15);
--print("Door Opened.");
else
end 

end;