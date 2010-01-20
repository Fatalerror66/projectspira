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
player:setAnimation(0);
return cs;
end;


---------------------------------
---   Initialize code here ...   ----------------
---------------------------------

function onInitialize(currZone)
--Chocobo Pricing
setGlobalVar("chocoboRentPrice-Bastok-S",CHOCOBO_PRICE_BASTOK_S);
setGlobalVar("chocoboRentTime-Bastok-S",os.time());
setGlobalVar("chocoboFreeRent-Bastok-S",0);
--print("Bastok-S chocobo rental reset.");
end;

