-----------------------------------
--	Author: Almendro
-- 	Dabotz's Ghost
-- 	Involved in "Scattered into Shadow" quest
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

function OnMobDeath(mob, killer)
	setGlobalVar("DabotzsGhostkilled",os.time()+ 300);
end;