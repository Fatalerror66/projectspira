require("/scripts/globals/common");
require("/scripts/globals/settings");
require("scripts/globals/rankpoints");

---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
cs = -1;

musketeers_status = player:getMissionStatus(1,10); 
mission_status =  player:getVar("mission_status");
--mission_status = 23; -- activate this to finish the mission for now

if ( musketeers_status == 1) then    
	if (mission_status < 23) then                               -- mission_status will have to be incremented every time a copper quadav is killed
		cs = 0x0A;                                                -- and starts at mission_status = 3 for no coppers killed. So 23 indicates that 20 
	else																												-- have been killed.
		cs = 0x0B;
		add_rank_points_for_mission(player);
		player:completeMission(1,10);
		player:setVar("mission_status",0);
	end
end;

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
	smncs = -1; --Need a new NPC capture; should be 0x0d.
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

if (player:hasKeyItem(StarSeeker) == 1) and ((player:getVar("mission_status") == 2) or (player:getVar("mission_status") == 3)) then
	cs = 0xF; -- talking doll
end;

return cs;
end;

-- doll event: parameter 6 controls the direction
 -- 0: north
 -- 1: northeast
 -- 2: east
 -- 3: southeast
 -- 4: south
 -- 5: southwest
 -- 6: west
 -- 7: northwest

function onEventSelection(player,cs,result)
if (cs == smncs) then
	if (weather == 1) then weather = 0; end
	player:updateEvent(0,0,weather);
elseif (cs == 0xF) then
	if (player:getVar("mission_status") == 2) then
		player:updateEvent(0,0,0,0,0,2);
  else
		player:updateEvent(0,0,0,0,0,0);
  end;
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