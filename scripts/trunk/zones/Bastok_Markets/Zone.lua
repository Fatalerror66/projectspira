require("/scripts/globals/common");
require("/scripts/globals/settings");

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,menuchoice) 
if(csid == 0x0) then	
	player:setVar("firstLogin",-1);
	--print("Firstlogin now set to -1");
end;
end;

---------------------------------
-- onZoneIn
---------------------------------
function onZoneIn(player,prevZone)
player:setAnimation(0);
cs = -1;

if (player:getVar("firstLogin") ~= -1 and OPENING_CUTSCENE_DISABLE == 1) then
	player:setPos(-280,-12,-91,15);
	player:setVar("firstLogin",-1);
	player:setHomePoint();
	--print("Opening cutscene bypassed, firstLogin set to -1.");
end
if (player:getVar("firstLogin") ~= -1 and OPENING_CUTSCENE_DISABLE ~= 1) then
	cs = 0x0;
	player:setPos(-280,-12,-91,15);
	player:setVar("firstLogin",-1);
	player:setHomePoint();
end
--------------------------------
-- "Gourmet" quest repeat reset
player:setVar("GourmetJustDone",0);
--------------------------------
-- "The Cold Light of Day" quest repeat reset
if(player:getVar("TheLightColdoftheDay_tempVar") == 2)then
	player:setVar("TheLightColdoftheDay_tempVar",0);
end
--------------------------------
return cs;
end;
---------------------------------
-- onInitialize
---------------------------------

function onInitialize(zone)
setGlobalVar("aFlashInTh-CooldownTimer",os.time());
--print("Quest Timer Reset!");
end;