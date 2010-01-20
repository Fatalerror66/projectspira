-- Suparna
-- by ReaperX
-- Sandy Mission 9-1 NM

require("scripts/globals/settings");
require("scripts/globals/rankpoints");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

function OnMobDeath(mob, player)
  mobsup = getGlobalVar("Sandy_9_1_Fight");
  setGlobalVar("Sandy_9_1_Fight",mobsup - 1);
  if (mobsup == 1) then
    setGlobalVar("Sandy_9_1_LastClear",os.time());
  end;
end;