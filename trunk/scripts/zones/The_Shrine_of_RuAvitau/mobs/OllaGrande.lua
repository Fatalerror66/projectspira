require("scripts/globals/settings");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
	--print(mob:getName());
end;

function OnMobDeath(mob, killer)
	--print("(ZONE)congratulations, you killed", mob:getName());
	setGlobalVar("OllaPotsKilled",os.time()+ 900);
end;