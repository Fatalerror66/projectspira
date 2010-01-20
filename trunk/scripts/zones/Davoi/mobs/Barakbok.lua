-----------------------------
-- Author: Almendro
-- Barakbok(NM)
-- Involved in WAR AF1
-----------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------
function OnMobSpawn(mob)
end;

function OnMobDeath(mob,killer)
	if(os.time() <= getGlobalVar("[NM_Dead]Gavotvut"))then
		setGlobalVar("[NM_Dead]Gavotvut_and_Barakbok",os.time() + 300); -- 5 minutes to get credit of killing both
		setGlobalVar("[NM_Dead]Gavotvut",0);
		setGlobalVar("[NM_Dead]Barakbok",0);
		setGlobalVar("[NM_poped]Gavotvut_and_Barakbok",0);		
	else
		setGlobalVar("[NM_Dead]Barakbok",os.time() + 1800); -- 30 minutes to kill the other one. if not other player can pop the NMs
	end
end;