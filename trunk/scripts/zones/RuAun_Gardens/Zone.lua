require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0x82;

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
-- Blue portal timers (2 minutes)
-- counterclockwise
setGlobalVar("Main-to-Seiryu-BlueTeleport",0);
setGlobalVar("Seiryu-to-Genbu-BlueTeleport",0);
setGlobalVar("Genbu-to-Byakko-BlueTeleport",0);
setGlobalVar("Byakko-to-Suzaku-BlueTeleport",0);
setGlobalVar("Suzaku-to-Main-BlueTeleport",0);
-- clockwise
setGlobalVar("Main-to-Suzaku-BlueTeleport",0);
setGlobalVar("Suzaku-to-Byakko-BlueTeleport",0);
setGlobalVar("Byakko-to-Genbu-BlueTeleport",0);
setGlobalVar("Genbu-to-Seiryu-BlueTeleport",0);
setGlobalVar("Seiryu-to-Main-BlueTeleport",0);

--print("Blue portals initialized.");

registerRegion(ZONE_ID,1,-3,1,-54,-50,-583,-579);
registerRegion(ZONE_ID,2,147,151,-26,-22,-449,-445);
registerRegion(ZONE_ID,3,186,190,-43,-39,-405,-401);
registerRegion(ZONE_ID,4,272,276,-42,-38,-379,-375);
registerRegion(ZONE_ID,4,272,276,-42,-38,-379,-375);
registerRegion(ZONE_ID,5,306,310,-39,-35,-317,-313);
registerRegion(ZONE_ID,6,393,397,-39,-35,193,197);
registerRegion(ZONE_ID,7,62,66,-39,-35,434,438);
registerRegion(ZONE_ID,8,-2,2,-42,-38,464,468);
registerRegion(ZONE_ID,8,-2,2,-42,-38,464,468);
registerRegion(ZONE_ID,9,-65,-61,-39,-35,434,438);
registerRegion(ZONE_ID,10,-397,-393,-39,-35,193,197);
registerRegion(ZONE_ID,11,-445,-441,-42,-38,142,146);
registerRegion(ZONE_ID,11,-445,-441,-42,-38,142,146);
registerRegion(ZONE_ID,12,-276,-272,-42,-38,-379,-375);
registerRegion(ZONE_ID,12,-276,-272,-42,-38,-379,-375);
registerRegion(ZONE_ID,13,-191,-187,-43,-39,-405,-401);
registerRegion(ZONE_ID,14,-151,-147,-26,-22,-449,-445);
registerRegion(ZONE_ID,15,543,547,-73,-69,-19,-15);
registerRegion(ZONE_ID,16,182,186,-73,-69,511,515);
registerRegion(ZONE_ID,17,-432,-428,-73,-69,332,336);
registerRegion(ZONE_ID,18,-453,-449,-73,-69,-308,-304);
registerRegion(ZONE_ID,19,-436,-432,-39,-35,71,75);
registerRegion(ZONE_ID,20,-310,-306,-39,-35,-317,-313);
registerRegion(ZONE_ID,21,441,445,-42,-38,142,146);
registerRegion(ZONE_ID,21,441,445,-42,-38,142,146);
registerRegion(ZONE_ID,22,432,436,-39,-35,71,75);
------------------------------
-- Blue teleports
------------------------------
registerRegion(ZONE_ID,23,162.5,168.5,-30,-31,-347.5,-353.5);  -- Main-to-Seiryu-BlueTeleport
registerRegion(ZONE_ID,24,374.5,380.5,-24,-25,61.5,67.5);      -- Seiryu-to-Genbu-BlueTeleport
registerRegion(ZONE_ID,25,52.5,58.5,-24,-25,376.5,382.5);      -- Genbu-to-Byakko-BlueTeleport
registerRegion(ZONE_ID,26,-346.5,-340.5,-24,-25,166.5,172.5);  -- Byakko-to-Suzaku-BlueTeleport
registerRegion(ZONE_ID,27,-270.5,-264.5,-24,-25,-277.5,-271.5);-- Suzaku-to-Main-BlueTeleport
registerRegion(ZONE_ID,28,-170,-162,-30,-31,-354.4,-347.2);    -- Main-to-Suzaku-BlueTeleport
registerRegion(ZONE_ID,29,-381,-374.5,-24,-25,61.5,67.5);      -- Suzaku-to-Byakko-BlueTeleport
registerRegion(ZONE_ID,30,-58,-52,-24,-25,376.5,382.5);        -- Byakko-to-Genbu-BlueTeleport
registerRegion(ZONE_ID,31,340.5,346.5,-24,-25,166.5,172.5);    -- Genbu-to-Seiryu-BlueTeleport
registerRegion(ZONE_ID,32,264.5,270.5,-24,-25,-277.5,-271.5);  -- Seiryu-to-Main-BlueTeleport
------------------------------
-- Yellow teleports
------------------------------
registerRegion(ZONE_ID,33,454,456,-5,-3,-149,-147); --Seiryu
registerRegion(ZONE_ID,34,278,281,-5,-3,383,386); --Genbu
registerRegion(ZONE_ID,35,-283,-280,-5,-3,386,389); --Byakko
registerRegion(ZONE_ID,36,-456,-454,-5,-3,-149,-147); --Suzaku
------------------------------
-- Green teleports
------------------------------
registerRegion(ZONE_ID,37,-145,-142,-41,-39,-156,-153);
registerRegion(ZONE_ID,38,142,145,-41,-39,-156,-153);

-- Ru'Aun Gardens coffer anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureCoffer",0);
--print("Ru'Aun Gardens coffers illusion time reset.");

--HNM Speech Offset: Begins with "A strange insignia pointing north is carved into the wall."
SKY_SPEECH_OFFSET = 916;

-- Time of Deaths
setGlobalVar("ToD-Despot",0);

end;


function onRegionEnter(player, regionID)
switch (regionID): caseof {
---------------------------------
[1] = function (x)  -- Portal --
---------------------------------
	player:startEvent(Event(0x0000));
end,
---------------------------------
[2] = function (x)  -- Portal --
---------------------------------
	player:startEvent(Event(0x0001));
end,
---------------------------------
[3] = function (x)  -- Portal --
---------------------------------
	player:startEvent(Event(0x0002));
end,
---------------------------------
[4] = function (x)  -- Portal --
---------------------------------
	Destination = math.random(0,1);
	if (Destination == 0) then
		player:startEvent(Event(0x0004));
	else
		player:startEvent(Event(0x0005));
	end	
end,
---------------------------------
[5] = function (x)  -- Portal --
---------------------------------
	player:startEvent(Event(0x0006));
end,
---------------------------------
[6] = function (x)  -- Portal --
---------------------------------
	player:startEvent(Event(0x0009));
end,
---------------------------------
[7] = function (x)  -- Portal --
---------------------------------
	player:startEvent(Event(0x0010));
end,
---------------------------------
[8] = function (x)  -- Portal --
---------------------------------
	Destination = math.random(0,1);
	if (Destination == 0) then
		player:startEvent(Event(0x0012));
	else
		player:startEvent(Event(0x0013));
	end	
end,
---------------------------------
[9] = function (x)  -- Portal --
---------------------------------
	player:startEvent(Event(0x0014));
end,
---------------------------------
[10] = function (x)  -- Portal --
---------------------------------
	player:startEvent(Event(0x0017));
end,
---------------------------------
[11] = function (x)  -- Portal --
---------------------------------
	Destination = math.random(0,1);
	if (Destination == 0) then
		player:startEvent(Event(0x0019));
	else
		player:startEvent(Event(0x001A));
	end
end,
---------------------------------
[12] = function (x)  -- Portal --
---------------------------------
	Destination = math.random(0,1);
	if (Destination == 0) then
		player:startEvent(Event(0x0020));
	else
		player:startEvent(Event(0x0021));
	end	
end,
---------------------------------
[13] = function (x)  -- Portal --
---------------------------------
	player:startEvent(Event(0x0022));
end,
---------------------------------
[14] = function (x)  -- Portal --
---------------------------------
	player:startEvent(Event(0x0024));
end,
---------------------------------
[15] = function (x)  -- Portal --
---------------------------------
	player:startEvent(Event(0x0025));
end,
---------------------------------
[16] = function (x)  -- Portal --
---------------------------------
	player:startEvent(Event(0x0026));
end,
---------------------------------
[17] = function (x)  -- Portal --
---------------------------------
	player:startEvent(Event(0x0027));
end,
---------------------------------
[18] = function (x)  -- Portal --
---------------------------------
	player:startEvent(Event(0x0028));
end,
---------------------------------
[19] = function (x)  -- Portal --
---------------------------------
	player:startEvent(Event(0x001B));
end,
---------------------------------
[20] = function (x)  -- Portal --
---------------------------------
	player:startEvent(Event(0x001E));
end,
---------------------------------
[21] = function (x)  -- Portal --
---------------------------------
	Destination = math.random(0,1);
	if (Destination == 0) then
		player:startEvent(Event(0x000B));
	else
		player:startEvent(Event(0x000C));
	end
end,
---------------------------------
[22] = function (x)  -- Portal --
---------------------------------
	player:startEvent(Event(0x0022));
end,
----------- BLUE portals --------------
---------------------------------
[23] = function (x)  -- Portal --
---------------------------------
	if(os.time() < getGlobalVar("Main-to-Seiryu-BlueTeleport")) then
		player:startEvent(Event(0x3));
	end
end,
---------------------------------
[24] = function (x)  -- Portal --
---------------------------------
	if(os.time() < getGlobalVar("Seiryu-to-Genbu-BlueTeleport")) then
		player:startEvent(Event(0xA));
	end
end,
---------------------------------
[25] = function (x)  -- Portal --
---------------------------------
	if(os.time() < getGlobalVar("Genbu-to-Byakko-BlueTeleport")) then
		player:startEvent(Event(0x11));
	end
end,
---------------------------------
[26] = function (x)  -- Portal --
---------------------------------
	if(os.time() < getGlobalVar("Byakko-to-Suzaku-BlueTeleport")) then
		player:startEvent(Event(0x18));
	end
end,
---------------------------------
[27] = function (x)  -- Portal --
---------------------------------
	if(os.time() < getGlobalVar("Suzaku-to-Main-BlueTeleport")) then
		player:startEvent(Event(0x1F));
	end
end,
---------------------------------
[28] = function (x)  -- Portal --
---------------------------------
	if(os.time() < getGlobalVar("Main-to-Suzaku-BlueTeleport")) then
		player:startEvent(Event(0x23));
	end
end,
---------------------------------
[29] = function (x)  -- Portal --
---------------------------------
	if(os.time() < getGlobalVar("Suzaku-to-Byakko-BlueTeleport")) then
		player:startEvent(Event(0x1C));
	end
end,
---------------------------------
[30] = function (x)  -- Portal --
---------------------------------
	if(os.time() < getGlobalVar("Byakko-to-Genbu-BlueTeleport")) then
		player:startEvent(Event(0x15));
	end
end,
---------------------------------
[31] = function (x)  -- Portal --
---------------------------------
	if(os.time() < getGlobalVar("Genbu-to-Seiryu-BlueTeleport")) then
		player:startEvent(Event(0xE));
	end
end,
---------------------------------
[32] = function (x)  -- Portal --
---------------------------------
	if(os.time() < getGlobalVar("Seiryu-to-Main-BlueTeleport")) then
		player:startEvent(Event(0x7));
	end
end,
---------------------------------
[33] = function (x)  -- Seiryu's Portal --
---------------------------------
	player:startEvent(Event(0x8));
end,

---------------------------------
[34] = function (x)  -- Genbu's Portal --
---------------------------------
	player:startEvent(Event(0xf));
end,

---------------------------------
[35] = function (x)  -- Byakko's Portal --
---------------------------------
	player:startEvent(Event(0x16));
end,

---------------------------------
[36] = function (x)  -- Suzaku's Portal --
---------------------------------
	player:startEvent(Event(0x1d));
end,

---------------------------------
[37] = function (x)  
---------------------------------
	skyreg = player:getVar("skyShortcut");
	if (skyreg == 1) then
		player:startEvent(Event(0x2a));
	else
		title = player:getTitle();
		if (title == 401) then
			event0x29 = Event(0x29);
			event0x29:setParams(title);
			player:startEvent(event0x29);
		else
			event0x2b = Event(0x2b);
			event0x2b:setParams(title);
			player:startEvent(event0x2b);
		end
	end
end,

---------------------------------
[38] = function (x)  
---------------------------------
	skyreg = player:getVar("skyShortcut");
	if (skyreg == 1) then
		player:startEvent(Event(0x2a));
	else
		title = player:getTitle();
		if (title == 401) then
			event0x29 = Event(0x29);
			event0x29:setParams(title);
			player:startEvent(event0x29);
		else
			event0x2b = Event(0x2b);
			event0x2b:setParams(title);
			player:startEvent(event0x2b);
		end
	end
end,

default = function (x)
end,}

end;
 
 
---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("OPTION:",option);
if (csid == 0x29 and option ~= 0) then
	player:setVar("skyShortcut",1);
end
end;