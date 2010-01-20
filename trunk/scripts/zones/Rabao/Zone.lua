require("/scripts/globals/common");
require("/scripts/globals/settings");

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

function onInitialize(currZone)
--Chocobo Pricing
setGlobalVar("chocoboRentPrice-Rabao",CHOCOBO_PRICE_RABAO);
setGlobalVar("chocoboRentTime-Rabao",os.time());
setGlobalVar("chocoboFreeRent-Rabao",0);
--print("Rabao chocobo stables reset.");

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
--print("Rabao Lucky Roll game reset.")
end;