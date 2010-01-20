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
setGlobalVar("chocoboRentPrice-AlZahbi",CHOCOBO_PRICE_AL_ZAHBI);
setGlobalVar("chocoboRentTime-AlZahbi",os.time());
setGlobalVar("chocoboFreeRent-AlZahbi",0);
--print("Al Zahbi chocobo stables reset.");
setGlobalVar("AstralCandescence",1); -- Players control the Astral Candescence
end;

