-----------------------------------
--	Author: Trin
-- 	Carthi
-- 	ZM5: Headstone Pilgrimage (Fire Fragment)
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

function OnMobDeath(mob, killer)
	
	if (getGlobalVar("FireHeadstoneActive") == 0) then	
		setGlobalVar("FireHeadstoneActive", 1);	
	elseif (getGlobalVar("FireHeadstoneActive") == 1) then	
		setGlobalVar("FireHeadstoneActive",os.time()+ 900);
	end
end;