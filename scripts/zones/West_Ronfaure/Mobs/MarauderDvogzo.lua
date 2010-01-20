-- Marauder Dvogzog
-- by ReaperX
-- San d'Oria 7-1 mission

require("scripts/globals/settings");
require("scripts/globals/rankpoints");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

function OnMobDeath(mob, player)
	setGlobalVar("Sandy_7_1_Fight",0);
	setGlobalVar("Sandy_7_1_LastClear",os.time());
end;