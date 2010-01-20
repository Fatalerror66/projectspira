require("/scripts/globals/common");
require("/scripts/globals/settings");

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,menuchoice) 
	player:setVar("firstLogin",-1);
	--print("Firstlogin now set to -1");
end;

---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
player:setAnimation(0);
cs = -1;
player:setPos(260,12,230);
return cs;
end;


---------------------------------
---   Initialize code here ...   ----------------
---------------------------------

function onInitialize(zone)


end;

