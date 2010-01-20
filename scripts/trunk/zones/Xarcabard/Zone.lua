-- Dynamis code by ReaperX

require("/scripts/globals/common");
require("/scripts/globals/settings");


---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
cs = -1;

------ Dynamis CS

-- 0x0D: opening Raogrimm CS for Dynamis once you reach level 65 and rank 6.
-- 0x0F: The time and destination for your foray into Dynamis will now be recorded on your {}. Destination: Dynamis-{}
-- 0x10: You will now be warped to Dynamis-{}
-- 0x11: Dynamis - The Shrouded Land (pt.1)
-- 0x12: Dynamis - The Shrouded Land (pt.1)
-- 0x15: Dynamis - The Shrouded Land (pt.2) - Southern San d'Oria
-- 0x16: Dynamis - The Shrouded Land (pt.2) - Bastok Mines
-- 0x17: Dynamis - The Shrouded Land (pt.2) - Windurst Walls
-- 0x18: Dynamis - The Shrouded Land (pt.2) - Ru'Lude Gardens
-- 0x19: Dynamis - The Shrouded Land - Beaucedine Glacier
-- 0x1A: Dynamis - The Shrouded Land (pt.2) - Xarcabard
-- 0x1B: Dynamis Interloper - Southern San d'Oria CS
-- 0x1C: Dynamis Interloper - Bastok Mines CS
-- 0x1D: Dynamis Interloper - Windurst Walls CS
-- 0x1E: Dynamis Interloper - Jeuno CS
-- 0x1F: Dynamis Interloper - Beaucedine Glacier CS
-- 0x20: Dynamis-Xarcabard Interloper CS

if (player:getRank() >= 6) and (player:getMainLvl() >= 65) and (player:getVar("Dynamis_Status") == 0) then
  player:setVar("Dynamis_Status",1);
  --print("Player can now enter Dynamis.");
  cs = 0xD; 
end

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
	smncs = 0x9;
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
end;


function onRegionEnter(player, regionID)
end;
 
 
---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,menuchoice) 
end;