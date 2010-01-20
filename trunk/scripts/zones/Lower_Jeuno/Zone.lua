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

--0x46 (Tending Aged Wounds, CoP CS)

player:setAnimation(0);
cs = -1;
return cs;
end;


---------------------------------
---   Initialize code here ...   ----------------
---------------------------------

function onInitialize(currZone)
--Chocobo Pricing
setGlobalVar("chocoboRentPrice-LowerJeuno",CHOCOBO_PRICE_LOWER_JEUNO);
setGlobalVar("chocoboRentTime-LowerJeuno",os.time());
setGlobalVar("chocoboFreeRent-LowerJeuno",0);
--print("Lower Jeuno chocobo stables reset.");
end;

