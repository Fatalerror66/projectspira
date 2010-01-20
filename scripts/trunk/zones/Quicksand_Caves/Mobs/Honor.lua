-- Honor
-- by ReaperX
-- Sandy Mission 8-1 NM

require("scripts/globals/settings");
require("scripts/globals/rankpoints");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

function OnMobDeath(mob, player)
  mobsup = getGlobalVar("Sandy_8_1_Fight");
  setGlobalVar("Sandy_8_1_Fight",mobsup - 1);
  if (mobsup == 1) then
    setGlobalVar("Sandy_8_1_LastClear",os.time());
  end;
end;