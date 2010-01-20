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
cs = -1;
return cs;
end;


---------------------------------
---   Initialize code here ...   ----------------
---------------------------------

function onInitialize(currZone)
--Chocobo Pricing
setGlobalVar("chocoboRentPrice-Jugner",CHOCOBO_PRICE_JUGNER_S);
setGlobalVar("chocoboRentTime-Jugner",os.time());
setGlobalVar("chocoboFreeRent-Jugner",0);
--print("Jugner chocobo rental reset.");
end;

