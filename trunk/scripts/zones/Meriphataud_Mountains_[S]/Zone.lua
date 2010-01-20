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
setGlobalVar("chocoboRentPrice-Meriph",CHOCOBO_PRICE_MERIPH_S);
setGlobalVar("chocoboRentTime-Meriph",os.time());
setGlobalVar("chocoboFreeRent-Meriph",0);
--print("Meriph chocobo rental reset.");
end;

