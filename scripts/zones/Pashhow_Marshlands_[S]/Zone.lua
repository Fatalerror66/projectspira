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
setGlobalVar("chocoboRentPrice-Passhow",CHOCOBO_PRICE_PASSHOW_S);
setGlobalVar("chocoboRentTime-Passhow",os.time());
setGlobalVar("chocoboFreeRent-Passhow",0);
--print("Passhow chocobo rental reset.");
end;

