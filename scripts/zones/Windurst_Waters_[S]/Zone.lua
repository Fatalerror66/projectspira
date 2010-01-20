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
setGlobalVar("chocoboRentPrice-Windurst-S",CHOCOBO_PRICE_WINDURST_S);
setGlobalVar("chocoboRentTime-Windurst-S",os.time());
setGlobalVar("chocoboFreeRent-Windurst-S",0);
--print("Windurst-S chocobo rental reset.");
end;

