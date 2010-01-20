require("scripts/globals/settings");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
	--print(mob:getName());
	setGlobalVar("CaedarvaMireMoshdahn",1);
end;

function OnMobDeath(mob, killer)
	--print("(ZONE)congratulations, you killed", mob:getName());
	setGlobalVar("CaedarvaMireMoshdahn",2);
end;