-----------------------------
-- Author: Almendro
-- Huu Xalmo the Savage(NM)
-- Involved in MNK AF3
-----------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------
function OnMobSpawn(mob)
end;

function OnMobDeath(mob,killer)
	setGlobalVar("[NM_Dead]Huu_Xalmo_the_Savage",os.time() + 600);
end;