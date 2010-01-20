require("/scripts/globals/common");
require("/scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/East_Sarutabaruta/TextIDs"] = nil;
require("scripts/zones/East_Sarutabaruta/TextIDs");

textIdOffset = 795

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
	smncs = 0x32;
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
end;

if(player:getMissionStatus(2,1) == 1) and (player:getVar("mission_status") == 6) and (prevZone == 0xc2) then
	--Optional CS from Windurst Mission 1-2: it is possible for players to die in the ruins and HP back to Windurst to bypass this CS--
	cs = 0x30;
	player:setPos(260,-17,-460,0xc0);
elseif (player:hasKeyItem(StarSeeker) == 1) and ((player:getVar("mission_status") == 2) or (player:getVar("mission_status") == 3)) then
	cs = 0x34; -- talking doll
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
if (cs == 0x34) then
	if (player:getVar("mission_status") == 2) then
		player:updateEvent(0,0,0,0,0,1);
  else
		player:updateEvent(0,0,0,0,0,7);
  end;
end
end;
 
---------------------------------
---  onFishCancel
---------------------------------

function onFishCancel(player,resultType,loc0x08)
	if loc0x08 == 0xc9 then -- cancel fishing before fighting starts
		--print("You give up and reel in your line")
		player:specialMessage(textIdOffset + 4)
	elseif loc0x08 == 0xc8 then -- cancel fishing after fighting starts
		--print("You give up and reset your line")
		player:specialMessage(textIdOffset + 36)
	elseif loc0x08 == 0 and resultType == 4 then
		player:specialMessage(textIdOffset + 1) -- no rod equipped
	elseif loc0x08 == 0 and resultType == 5 then
		player:specialMessage(textIdOffset + 2) -- no bait equipped
	elseif loc0x08 == 0x06 then -- cancel fishing after taking too long to reel in fish
		--print("You lost your catch")
		player:specialMessage(textIdOffset + 9)
	end
end;
---------------------------------
---  onFishBite
---------------------------------

function onFishBite(player)
	--print("Something caught the hook!")
	player:specialMessage(textIdOffset + 50) -- 806 regular fish music text
	player:specialMessage(textIdOffset + 43) -- 835 - 841 differen messages for this line

end;
---------------------------------
---  onFishFinish
---------------------------------

function onFishFinish(player,resultId,resultQty,resultType,stamina)
	if resultType == 0 then
		--print("You caught a fish!")
		player:specialMessage(textIdOffset + 14,resultId,resultQty) -- 806 regular fish music text
	elseif resultType == 6 then
		--print("You regretfully release the fish")
		player:specialMessage(textIdOffset + 10,resultId,resultQty) -- 806 regular fish music text
	end
end;

function onEventSelection(player,cs,result)
if (cs == smncs) then
	if (weather == 1) then weather = 0; end
	player:updateEvent(0,0,weather);
end
end;

 
---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,menuchoice)
if (csid == 0x30) then
  player:removeKeyItem(FirstGlowingManaOrb);
  player:removeKeyItem(SecondGlowingManaOrb);
  player:removeKeyItem(ThirdGlowingManaOrb);
  player:removeKeyItem(FourthGlowingManaOrb);
  player:removeKeyItem(FifthGlowingManaOrb);
  player:removeKeyItem(SixthGlowingManaOrb);
  player:specialMessage(KEYITEM_OBTAINED + 1,FirstGlowingManaOrb);
  player:specialMessage(KEYITEM_OBTAINED + 1,SecondGlowingManaOrb);
  player:specialMessage(KEYITEM_OBTAINED + 1,ThirdGlowingManaOrb);
  player:specialMessage(KEYITEM_OBTAINED + 1,FourthGlowingManaOrb);
  player:specialMessage(KEYITEM_OBTAINED + 1,FifthGlowingManaOrb);
  player:specialMessage(KEYITEM_OBTAINED + 1,SixthGlowingManaOrb);
  player:setVar("mission_status",7);
end
end;

---------------------------------
---   Initialize code here ...   ----------------
---------------------------------

function onInitialize(zone)
end;

