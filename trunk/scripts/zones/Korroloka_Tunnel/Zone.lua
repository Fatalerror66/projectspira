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

--- flag Zilart missions when above rank 6 in nation and entering a Zilart expansion area
if (player:getRank() >= 6) and (player:getMissionStatus(3,0) == 0) then
  player:currentMission(3,0)
end;

cs = -1;

return cs;
end;
