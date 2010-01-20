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
setGlobalVar("chocoboRentPrice-Sandoria-S",CHOCOBO_PRICE_SANDORIA_S);
setGlobalVar("chocoboRentTime-Sandoria-S",os.time());
setGlobalVar("chocoboFreeRent-Sandoria-S",0);
--print("San d'Oria-S chocobo rental reset.");
end;

