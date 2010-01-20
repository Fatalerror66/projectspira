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
setGlobalVar("chocoboRentPrice-PortJeuno",CHOCOBO_PRICE_PORT_JEUNO);
setGlobalVar("chocoboRentTime-PortJeuno",os.time());
setGlobalVar("chocoboFreeRent-PortJeuno",0);
--print("Port Jeuno chocobo stables reset.");
end;

