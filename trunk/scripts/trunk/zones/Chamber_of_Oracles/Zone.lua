require("/scripts/globals/common");
require("/scripts/globals/settings");
require("scripts/globals/rankpoints")
package.loaded["scripts/zones/Chamber_of_Oracles/TextIDs"] = nil;
require("scripts/zones/Chamber_of_Oracles/TextIDs");

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,menuchoice) 
end;

---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
if (player:getMissionStatus(2,23) == 1) and (player:getVar("mission_status") == 2) and (player:hasKeyItem(AncientVerseOfAltepa) == 0) then
	player:addKeyItem(AncientVerseOfAltepa);
	player:specialMessage(KEYITEM_OBTAINED,AncientVerseOfAltepa);
end;
cs = -1;
return cs;
end;

function onInitialize()
end; 
 
function onRegionEnter(player, regionID)
end;