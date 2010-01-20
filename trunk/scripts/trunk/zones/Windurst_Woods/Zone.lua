require("/scripts/globals/common");
require("/scripts/globals/settings");

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,menuchoice)
if(csid == 0x16f) then
	player:setVar("firstLogin",-1);
	--print("Firstlogin now set to -1");
end
end;

---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
player:setAnimation(0);
cs = -1;
---Windurst Woods start CS---
if (player:getVar("firstLogin") ~= -1 and OPENING_CUTSCENE_DISABLE == 1) then
	player:setPos(0,0,-50,0);
	player:setVar("firstLogin",-1);
	player:setHomePoint();
	--print("Opening cutscene bypassed, firstLogin set to -1.");
end
if (player:getVar("firstLogin") ~= -1 and OPENING_CUTSCENE_DISABLE ~= 1) then
  cs = 0x16f;
   player:setPos(0,0,-50,0);
   player:setVar("firstLogin",-1);
   player:setHomePoint();
end

return cs;
end;


---------------------------------
---   Initialize code here ...   ----------------
---------------------------------

function onInitialize(currZone)
--Chocobo Pricing
setGlobalVar("chocoboRentPrice-Windurst",CHOCOBO_PRICE_WINDURST);
setGlobalVar("chocoboRentTime-Windurst",os.time());
setGlobalVar("chocoboFreeRent-Windurst",0);
--print("Windurst Woods chocobo stables reset.");
end;

