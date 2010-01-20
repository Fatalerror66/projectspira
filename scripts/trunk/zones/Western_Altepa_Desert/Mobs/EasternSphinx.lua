-- Eastern Sphinx
-- by ReaperX
-- Bastok 6-1 mission

require("scripts/globals/settings");
require("scripts/globals/rankpoints");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

function OnMobDeath(mob, player)
  mobsup = getGlobalVar("Bastok_6_1_Fight");
  setGlobalVar("Bastok_6_1_Fight",mobsup - 1);
  if (mobsup == 1) then
    setGlobalVar("Bastok_6_1_LastClear",os.time());
  end;
end;