-----------------------------
-- Author: Almendro
-- Bilopdop(NM)
-- Involved in MNK AF1
-----------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------
function OnMobSpawn(mob)
end;

function OnMobDeath(mob,killer)
	if(os.time() <= getGlobalVar("[NM_Dead]Deloknok"))then
		setGlobalVar("[NM_Dead]Bilopdop_and_Deloknok",os.time() + 300); -- 5 minutes to get credit of killing both
		setGlobalVar("[NM_Dead]Bilopdop",0);
		setGlobalVar("[NM_Dead]Deloknok",0);
		setGlobalVar("[NM_poped]Bilopdop_and_Deloknok",0);
	else
		setGlobalVar("[NM_Dead]Bilopdop",os.time() + 1800); -- 30 minutes to kill the other one. if not other player can pop the NMs
	end
end;