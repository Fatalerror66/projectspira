require("/scripts/globals/common");
require("/scripts/globals/settings");

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,menuchoice) 
if(csid == 0x131) then
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

--Minor dialogue changes--
player:setVar("paytah",0);
if(player:getVar("makingAmends") == 2) then
	player:setVar("makingAmends",3);
end

---Port Windurst start CS---
if (player:getVar("firstLogin") ~= -1 and OPENING_CUTSCENE_DISABLE == 1) then
	player:setPos(-120,-5.5,175);
	player:setVar("firstLogin",-1);
	player:setHomePoint();
	--print("Opening cutscene bypassed, firstLogin set to -1.");
end
if (player:getVar("firstLogin") ~= -1 and OPENING_CUTSCENE_DISABLE ~= 1) then
   cs = 0x131;
   player:setPos(-120,-5.5,175);
   player:setVar("firstLogin",-1);
   player:setHomePoint();
end

switch(prevZone) : caseof {
---------------------------------
 [0xE1]    =    function (x)
---------------------------------
---AIRSHIP COMMING FROM JEUNO---
cs = 0x2714;
player:setPos(228,-3,76);
 end,
--------------------------------- 
default =    function (x) end,}
	
return cs;
end;


---------------------------------
---   Initialize code here ...   ----------------
---------------------------------

function onInitialize(zone)
end;

