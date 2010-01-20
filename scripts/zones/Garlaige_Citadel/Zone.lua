require("/scripts/globals/common");
require("/scripts/globals/settings");


ZONE_ID = 0xC8;
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
registerRegion(ZONE_ID,11,-208,-206,-1,1,224,226);
registerRegion(ZONE_ID,12,-213,-211,-1,1,224,226);
registerRegion(ZONE_ID,13,-213,-211,-1,1,212,214);
registerRegion(ZONE_ID,14,-208,-206,-1,1,212,214);
--print("Initializing Banishing Gate #1...");
registerRegion(ZONE_ID,21,-51,-49,-1,1,82,84);
registerRegion(ZONE_ID,22,-51,-49,-1,1,115,117);
registerRegion(ZONE_ID,23,-151,-149,-1,1,82,84);
registerRegion(ZONE_ID,24,-151,-149,-1,1,115,117);
--print("Initializing Banishing Gate #2...");
registerRegion(ZONE_ID,31,-190,-188,-1,1,355,357);
registerRegion(ZONE_ID,32,-190,-188,-1,1,322,324);
registerRegion(ZONE_ID,33,-130,-128,-1,1,355,357);
registerRegion(ZONE_ID,34,-130,-128,-1,1,322,324);
--print("Initializing Banishing Gate #3...");
--print("Banishing Gate Initialization success!");
-- Garlaige Citadel coffer/chest anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureCoffer",0);
setGlobalVar("["..ZONE_ID.."]TreasureChest",0);
--print("Garlaige Citadel coffers/chests illusion time reset.");

end;


function onRegionEnter(player, regionID)

--variables--
--Gate #1--
gateoneone = getNPCById(0x10c811b,0xc8)
gateonetwo = getNPCById(0x10c811d,0xc8)
gateonethree = getNPCById(0x10c811e,0xc8)
gateonefour = getNPCById(0x10c811c,0xc8)
gateone = getNPCById(0x10c811a,0xc8)
--Gate #2--
gatetwoone = getNPCById(0x10c8124,0xc8)
gatetwotwo = getNPCById(0x10c8126,0xc8)
gatetwothree = getNPCById(0x10c8125,0xc8)
gatetwofour = getNPCById(0x10c8127,0xc8)
gatetwo = getNPCById(0x10c8123,0xc8)
--Gate #3--
gatethreeone = getNPCById(0x10c812d,0xc8)
gatethreetwo = getNPCById(0x10c812f,0xc8)
gatethreethree = getNPCById(0x10c812e,0xc8)
gatethreefour = getNPCById(0x10c8130,0xc8)
gatethree = getNPCById(0x10c812c,0xc8)

switch (regionID): caseof {
---------------------------------
[11] = function (x)
---------------------------------
	gateoneone:setState(player,5);
end,
---------------------------------
[12] = function (x)
---------------------------------
	gateonetwo:setState(player,5);
end,
---------------------------------
[13] = function (x)
---------------------------------
	gateonethree:setState(player,5);
end,
---------------------------------
[14] = function (x)
---------------------------------
	gateonefour:setState(player,5);
end,
---------------------------------
[21] = function (x)
---------------------------------
	gatetwoone:setState(player,10);
end,
---------------------------------
[22] = function (x)
---------------------------------
	gatetwotwo:setState(player,10);
end,
---------------------------------
[23] = function (x)
---------------------------------
	gatetwothree:setState(player,10);
end,
---------------------------------
[24] = function (x)
---------------------------------
	gatetwofour:setState(player,10);
end,
---------------------------------
[31] = function (x)
---------------------------------
	gatethreeone:setState(player,10);
end,
---------------------------------
[32] = function (x)
---------------------------------
	gatethreetwo:setState(player,10);
end,
---------------------------------
[33] = function (x)
---------------------------------
	gatethreethree:setState(player,10);
end,
---------------------------------
[34] = function (x)
---------------------------------
	gatethreefour:setState(player,10);
end,
---------------------------------
default = function (x)
end,}

--Open Gate #1--
if (gateoneone:getState() == 8 and gateonetwo:getState() == 8 and gateonethree:getState() == 8 and gateonefour:getState() == 8) then
	--print("Banishing Gate #1 Activated!  Opening...");
	gateone:setState(player,15);
else
end

--Open Gate #2--
if (gatetwoone:getState() == 8 and gatetwotwo:getState() == 8 and gatetwothree:getState() == 8 and gatetwofour:getState() == 8) then
	--print("Banishing Gate #2 Activated!  Opening...");
	gatetwo:setState(player,45);
else
end

--Open Gate #3--
if (gatethreeone:getState() == 8 and gatethreetwo:getState() == 8 and gatethreethree:getState() == 8 and gatethreefour:getState() == 8) then
	--print("Banishing Gate #3 Activated!  Opening...");
	gatethree:setState(player,45);
else
end
end;