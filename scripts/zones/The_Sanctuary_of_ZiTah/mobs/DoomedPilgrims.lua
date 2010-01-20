-----------------------------------
--	Author: Trin
-- 	Doomed Pilgrims
-- 	ZM5: Headstone Pilgrimage
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

function OnMobDeath(mob, killer)
	
	setGlobalVar("LightHeadstoneActive",os.time()+ 900);
end;