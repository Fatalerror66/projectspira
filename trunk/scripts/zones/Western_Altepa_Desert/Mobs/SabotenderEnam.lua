-- Sabotender Enamorado. 
-- by ReaperX
-- Sandy 6-1 mission

require("scripts/globals/settings");
require("scripts/globals/rankpoints");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

function OnMobDeath(mob, player)
  setGlobalVar("Sandy_6_1_Fight",0);
  setGlobalVar("Sandy_6_1_LastClear",os.time());
end;