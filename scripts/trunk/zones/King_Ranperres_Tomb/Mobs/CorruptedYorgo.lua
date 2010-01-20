-- Corrupted Yorgos
-- by ReaperX
-- San d'Oria 6-2 mission

require("scripts/globals/settings");
require("scripts/globals/rankpoints");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

function OnMobDeath(mob, player)
  mobsup = getGlobalVar("Sandy_6_2_Fight");
  setGlobalVar("Sandy_6_2_Fight",mobsup - 1);
  if (mobsup == 1) then
    setGlobalVar("Sandy_6_2_LastClear",os.time());
  end;
end;