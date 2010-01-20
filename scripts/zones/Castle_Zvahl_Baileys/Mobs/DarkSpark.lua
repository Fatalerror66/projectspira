-- Dark Spark
-- by ReaperX
-- for AF hands quests

require("scripts/globals/settings");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

function OnMobDeath(mob, player)
	setGlobalVar("DARKSPARK_FIGHT",0);
	setGlobalVar("DARKSPARK_TOD",os.time());
end;