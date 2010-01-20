-- Quicksand Caves
-- weight sensors by ReaperX. 

require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0xD0;

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,menuchoice) 
end;

---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
player:setAnimation(0);
cs = -1;
return cs;
end;


---------------------------------
---   Initialize code here ...   ----------------
---------------------------------

function onInitialize()

registerRegion(ZONE_ID,2,-782,-777,-1,1,-462,-457);
registerRegion(ZONE_ID,3,-703,-697,-1,1,-423,-417);
registerRegion(ZONE_ID,4,-703,-697,-1,1,-383,-377);
registerRegion(ZONE_ID,5,-823,-817,-1,1,-383,-377);
registerRegion(ZONE_ID,6,-583,-577,-1,1,-422,-418);

registerRegion(ZONE_ID,7,-343,-337,-1,1, 818, 822);
registerRegion(ZONE_ID,8,-411,-406,-1,1, 797, 803);
registerRegion(ZONE_ID,9,-262,-257,-1,1, 737, 742);
registerRegion(ZONE_ID,10,-343,-337,-1,1, 657, 662);
registerRegion(ZONE_ID,11,-422,-417,-1,1, 737, 742);
registerRegion(ZONE_ID,12,-403,-397,-1,1, 669, 674);

registerRegion(ZONE_ID,13,-18,-13,-1,1, -62, -57);
registerRegion(ZONE_ID,14, 13, 18,-1,1, -183, -177);
--print("Quicksand caves weight sensors initialized!");

-- Quicksand Caves coffer anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureCoffer",0);
--print("Quicksand Caves coffers illusion time reset.");
setGlobalVar("Bastok_8_1_Fight",0); -- mission NMs are unpopped by default.
setGlobalVar("Bastok_8_1_LastClear", os.time()-QM_RESET_TIME); -- 8-1 ??? is set to spawn NMs by default.
end;

function onRegionEnter(player,regionID)
race = player:getRace();

if (race == 8) then -- Galka
	weight = 3;
elseif (race == 5) or (race == 6) then -- Taru male or female
	weight = 1;
else -- Hume/Elvaan/Mithra
	weight = 1.5;
end;
--print(regionID);
switch (regionID) : caseof {
---------------------
[2] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_2");
	w = w + weight;
	setGlobalVar("WEIGHT_SENSOR_2",w);
	if (w >= 2.5) then
		door = getNPCById(0x10d01df,0xd0);
		door:setState(15);
	end;
end,
---------------------
[3] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_3");
	w = w + weight;
	setGlobalVar("WEIGHT_SENSOR_3",w);
	if (w >= 2.5) then
		door = getNPCById(0x10d01db,0xd0);
		door:setState(15);
	end;
end,
---------------------
---------------------
[4] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_4");
	w = w + weight;
	setGlobalVar("WEIGHT_SENSOR_4",w);
	if (w >= 2.5) then
		--print("opening door 4");
		door = getNPCById(0x10d01dd,0xd0);
		door:setState(15);
	end;
end,
---------------------
[5] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_5");
	w = w + weight;
	setGlobalVar("WEIGHT_SENSOR_5",w);
	if (w >= 2.5) then
		door = getNPCById(0x10d01e1,0xd0);
		door:setState(15);
	end;
end,
---------------------
[6] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_6");
	w = w + weight;
	setGlobalVar("WEIGHT_SENSOR_6",w);
	if (w >= 2.5) then
		door = getNPCById(0x10d01d9,0xd0);
		door:setState(15);
	end;
end,
---------------------
[7] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_7");
	w = w + weight;
	setGlobalVar("WEIGHT_SENSOR_7",w);
	if (w >= 2.5) then
		door = getNPCById(0x10d01e7,0xd0);
		door:setState(15);
	end;
end,
---------------------
[8] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_8");
	w = w + weight;
	setGlobalVar("WEIGHT_SENSOR_8",w);
	if (w >= 2.5) then
		door = getNPCById(0x10d01e9,0xd0);
		door:setState(15);
	end;
end,
---------------------
[9] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_9");
	w = w + weight;
	setGlobalVar("WEIGHT_SENSOR_9",w);
	if (w >= 2.5) then
		door = getNPCById(0x10d01e3,0xd0);
		door:setState(15);
	end;
end,
---------------------
[10] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_10");
	w = w + weight;
	setGlobalVar("WEIGHT_SENSOR_10",w);
	if (w >= 2.5) then
		door = getNPCById(0x10d01e5,0xd0);
		door:setState(15);
	end;
end,
---------------------
[11] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_11");
	w = w + weight;
	setGlobalVar("WEIGHT_SENSOR_11",w);
	if (w >= 2.5) then
		door = getNPCById(0x10d01eb,0xd0);
		door:setState(15);
	end;
end,
---------------------
[12] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_12");
	w = w + weight;
	setGlobalVar("WEIGHT_SENSOR_12",w);
	if (w >= 2.5) then
		door = getNPCById(0x10d01ed,0xd0);
		door:setState(15);
	end;
end,
---------------------
[13] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_13");
	w = w + weight;
	setGlobalVar("WEIGHT_SENSOR_13",w);
	if (w >= 2.5) then
		door = getNPCById(0x10d01d5,0xd0);
		door:setState(15);
	end;
end,
---------------------
[14] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_14");
	w = w + weight;
	setGlobalVar("WEIGHT_SENSOR_14",w);
	if (w >= 2.5) then
		door = getNPCById(0x10d01d7,0xd0);
		door:setState(15);
	end;
end,
---------------------
default = function (x) end, }
end

function onRegionExit(player,regionID)
race = player:getRace();
if (race == 8) then -- Galka
	weight = 3;
elseif (race == 5) or (race == 6) then -- Taru male or female
	weight = 1;
else -- Hume/Elvaan/Mithra
	weight = 1.5;
end;
--print(regionID);

switch (regionID) : caseof {
---------------------
[2] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_2");
	w = w - weight;
	setGlobalVar("WEIGHT_SENSOR_2",w);
end,
---------------------
[3] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_3");
	w = w - weight;
	setGlobalVar("WEIGHT_SENSOR_3",w);
end,
---------------------
[4] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_4");
	w = w - weight;
	setGlobalVar("WEIGHT_SENSOR_4",w);
end,
---------------------
[5] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_5");
	w = w - weight;
	setGlobalVar("WEIGHT_SENSOR_5",w);
end,
---------------------
[6] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_6");
	w = w - weight;
	setGlobalVar("WEIGHT_SENSOR_6",w);
end,
---------------------
[7] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_7");
	w = w - weight;
	setGlobalVar("WEIGHT_SENSOR_7",w);
end,
---------------------
[8] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_8");
	w = w - weight;
	setGlobalVar("WEIGHT_SENSOR_8",w);
end,
---------------------
[9] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_9");
	w = w - weight;
	setGlobalVar("WEIGHT_SENSOR_9",w);
end,
---------------------
[10] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_10");
	w = w - weight;
	setGlobalVar("WEIGHT_SENSOR_10",w);
end,
---------------------
[11] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_11");
	w = w - weight;
	setGlobalVar("WEIGHT_SENSOR_11",w);
end,
---------------------
[12] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_12");
	w = w - weight;
	setGlobalVar("WEIGHT_SENSOR_12",w);
end,
---------------------
[13] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_13");
	w = w - weight;
	setGlobalVar("WEIGHT_SENSOR_13",w);
end,
---------------------
[14] = function (x) 
	w = getGlobalVar("WEIGHT_SENSOR_14");
	w = w - weight;
	setGlobalVar("WEIGHT_SENSOR_14",w);
end,
---------------------
default = function (x) end, }

end;
