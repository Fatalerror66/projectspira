require("/scripts/globals/common");
require("/scripts/globals/settings");


---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
cs = -1;

--Check weather for SMN unlock quest.
rainbow = player:getQuestStatus(2,75);
ruby = player:hasItem(0x465);
if (rainbow == 1 and ruby == 1) then
	colors = player:getVar("iCanHearAR-Lights");
	red = (tonumber(colors) % 2 >= 1);
	orange = (tonumber(colors) % 4 >= 2);
	yellow = (tonumber(colors) % 8 >= 4);
	green = (tonumber(colors) % 16 >= 8);
	blue = (tonumber(colors) % 32 >= 16);
	indigo = (tonumber(colors) % 64 >= 32);
	violet = (tonumber(colors) % 128 >= 64);
	zone = Zone(player:getZone());
 	weather = zone:getWeather();
	--print("COLORS:",colors,red,orange,yellow,green,blue,indigo,violet);
	--print("WEATHER:",zone,weather);
	smncs = 0x33;
	if (red == false and (weather == 0x04 or weather == 0x05)) then
		--Give red light
		cs = smncs;
		player:setVar("iCanHearAR-Lights",colors+1);
	elseif (orange == false and (weather == 0 or weather == 1)) then
		--Give orange light
		cs = smncs;
		player:setVar("iCanHearAR-Lights",colors+2);
	elseif (yellow == false and (weather == 0x08 or weather == 0x09)) then
		--Give yellow light
		cs = smncs;
		player:setVar("iCanHearAR-Lights",colors+4);
	elseif (green == false and (weather == 0x0a or weather == 0x0b)) then
		--Give green light
		cs = smncs;
		player:setVar("iCanHearAR-Lights",colors+8);
	elseif (blue == false and (weather == 0x06 or weather == 0x07)) then
		--Give blue light
		cs = smncs;
		player:setVar("iCanHearAR-Lights",colors+16);
	elseif (indigo == false and (weather == 0x0c or weather == 0x0d)) then
		--Give indigo light
		cs = smncs;
		player:setVar("iCanHearAR-Lights",colors+32);
	elseif (violet == false and (weather == 0x0e or weather == 0x0f)) then
		--Give violet light
		cs = smncs;
		player:setVar("iCanHearAR-Lights",colors+64);
	end
end

return cs;
end;

function onEventSelection(player,cs,result)
if (cs == smncs) then
	if (weather == 1) then weather = 0; end
	player:updateEvent(0,0,weather);
end
end;
 
---------------------------------
---   Initialize code here ...   ----------------
---------------------------------

function onInitialize()
setGlobalVar("Sandy_7_1_LastClear",os.time()-QM_RESET_TIME);
setGlobalVar("Sandy_7_1_Fight",0);   
end;


function onRegionEnter(player, regionID)
end;
 
 
---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,menuchoice) 
end;