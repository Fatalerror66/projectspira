require("/scripts/globals/common");
require("/scripts/globals/settings");

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,menuchoice) 
if(csid == 0x1) then
	player:setVar("firstLogin",-1);
	--print("Firstlogin now set to -1");
elseif (csid == 0xB0) then
  player:completeMission(1,21);
  player:addGil(GIL_RATE*80000)
  player:specialMessage(21,GIL_RATE*80000); 
  player:setVar("mission_status",0);
  player:rankUp()
end;
end;

---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
player:setAnimation(0);
cs = -1;

if (player:getVar("mission_status") == 6) and (player:getMissionStatus(1,21) == 1) then
  cs = 0xB0; -- final CS for Bastok 8.2 "Enter the Talekeeper"
end

if (player:getVar("firstLogin") ~= -1 and OPENING_CUTSCENE_DISABLE == 1) then
	player:setPos(-45,0,26,213);
	player:setVar("firstLogin",-1);
	player:setHomePoint();
	--print("Opening cutscene bypassed, firstLogin set to -1.");
end
if (player:getVar("firstLogin") ~= -1 and OPENING_CUTSCENE_DISABLE ~= 1) then
	cs = 0x1;
	player:setPos(-45,-0,26,213);
	player:setVar("firstLogin",-1);
	player:setHomePoint();
end
---------------------------------
-- "The Siren's Tear" repeat reset
if(player:getVar("TheSirensTearRepeat") == 4)then
	player:setVar("TheSirensTearRepeat",0);
end
---------------------------------
---------------------------------
-- "Mom The Adventurer?" repeat reset
if(player:getVar("MomTheAdventurer_tempVar") == 3)then
	player:setVar("MomTheAdventurer_tempVar",0);
end
---------------------------------
---------------------------------
-- "Groceries" repeat reset
if(player:getVar("Groceries_tempVar") == 4)then
	player:setVar("Groceries_tempVar",0);
end
---------------------------------
return cs;
end;
---------------------------------
-- onInitialize
---------------------------------

function onInitialize(zone)
--Chocobo Pricing
setGlobalVar("chocoboRentPrice-Bastok",CHOCOBO_PRICE_BASTOK);
setGlobalVar("chocoboRentTime-Bastok",os.time());
setGlobalVar("chocoboFreeRent-Bastok",0);
--print("Bastok Mines chocobo stables reset.");
end;