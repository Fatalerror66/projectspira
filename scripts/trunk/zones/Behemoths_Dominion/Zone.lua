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

return -1;
end;


---------------------------------
---   Initialize code here ...   ----------------
---------------------------------

function onInitialize(currZone)

setGlobalVar("LightningHeadstoneActive", os.time());

end;

