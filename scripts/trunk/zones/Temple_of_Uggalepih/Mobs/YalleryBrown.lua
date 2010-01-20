-----------------------------------
--	Author: Almendro
-- 	Yallery Brown
-- 	Involved in "Axe The Competition" quest
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

function OnMobDeath(mob, killer)
	setGlobalVar("YalleryBrownkilled",os.time()+ 300); -- 5 minutes ??? duration for everyone to get kill credit
end;