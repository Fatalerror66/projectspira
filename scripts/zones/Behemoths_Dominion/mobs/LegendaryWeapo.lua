-----------------------------------
--	Author: Trin
-- 	Legendary Weapon
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
	
	if (getGlobalVar("LightningHeadstoneActive") == 0) then
	
		setGlobalVar("LightningHeadstoneActive", 1);
	
	elseif (getGlobalVar("LightningHeadstoneActive") == 1) then
	
		setGlobalVar("LightningHeadstoneActive", os.time()+ 900);
	end
end;