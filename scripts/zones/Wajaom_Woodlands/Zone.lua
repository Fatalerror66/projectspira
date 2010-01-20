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
setGlobalVar("chocoboRentPrice-Wajaom",CHOCOBO_PRICE_WAJAOM);
setGlobalVar("chocoboRentTime-Wajaom",os.time());
setGlobalVar("chocoboFreeRent-Wajaom",0);
--print("Wajaom chocobo rental reset.");
end;

