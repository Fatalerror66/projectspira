-- Authors: ReaperX, Tenjou and Trin

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
---------------------------------
-- Brutus quest chain dialogs reset
---------------------------------
if(player:getVar("chocoboOnTheLoose_NextQuest") == 1)then
	player:setVar("chocoboOnTheLoose_NextQuest",0);
end
---------------------------------
player:setAnimation(0);

cop_status = player:getMissionStatus(6,1);
if (cop_status == 1 and player:getVar("ritesOfLife") == 0) then
  cs = 0x2; -- CoP CS
  player:setVar("ritesOfLife", 1); --so that the CS doesnt show again if they zone out of Upper Jeuno without talking to Monberaux
else
  cs = -1;
end
return cs;
end;

---------------------------------
---   Initialize code here ...   ----------------
---------------------------------

function onInitialize(currZone)
--Chocobo Pricing
setGlobalVar("chocoboRentPrice-UpperJeuno",CHOCOBO_PRICE_UPPER_JEUNO);
setGlobalVar("chocoboRentTime-UpperJeuno",os.time());
setGlobalVar("chocoboFreeRent-UpperJeuno",0);
--print("Upper Jeuno chocobo stables reset.");
end;

