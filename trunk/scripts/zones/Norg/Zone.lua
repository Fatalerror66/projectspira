require("/scripts/globals/common");
require("/scripts/globals/settings");

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,menuchoice)
if (csid == 1) then
  player:completeMission(3,0)
  player:currentMission(3,4);
  player:specialMessage(26,0x1A1);
  player:addKeyItem(0x1A1);
end;
end;

---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
player:setAnimation(0);

if (player:getMissionStatus(3,0) == 1) then
  cs = 1; -- first CS for Zilart Missions
  player:currentMission(3,0)
else
  cs = -1;  
end;

return cs;
end;


---------------------------------
---   Initialize code here ...   ----------------
---------------------------------

function onInitialize(currZone)
--Chocobo Pricing
setGlobalVar("chocoboRentPrice-Norg",CHOCOBO_PRICE_NORG);
setGlobalVar("chocoboRentTime-Norg",os.time());
setGlobalVar("chocoboFreeRent-Norg",0);
--print("Norg chocobo stables reset.");

--Lucky Roll Variables
RunTotal = 0;		-- Default Running Total
GameDay = 0;		-- Default Game Day (in VanaDays)
GameMon = 0;		-- Default Game Month (in VanaMonths)
GameYear = 0;		-- Default Game Year (in VanaYears)
CloseGame = 0;		-- Default Status of the Game (Open/Closed)
Winner = nil;		-- Default Winner (Used to distribute bonus)
Bonus = 0;		-- Default Bonus Status (0,1,9)
BonusPrize = nil;		-- Default Bonus Prize waiting for pickup
Disallow = {};		-- Default list of disallow player
--print("Norg Lucky Roll game reset.")
end;


