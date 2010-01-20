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

function onInitialize()
setGlobalVar("Bastok_9_1_Fight",0); -- mission NMs are unpopped by default.
setGlobalVar("Bastok_9_1_LastClear", os.time()-QM_RESET_TIME); -- 9-1 ??? is set to spawn NMs by default.
end;