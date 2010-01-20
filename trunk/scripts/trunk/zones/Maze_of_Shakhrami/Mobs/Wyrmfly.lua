require("scripts/globals/settings");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
	setGlobalVar("ShakhramiWyrmfly",1);
	--print(mob:getName());
end;

function OnMobDeath(mob, killer)

	--print("(MOB)congratulations, you killed", mob:getName());

	-- calls the parent mobkill function to inherit whatever that does.
	mob:OnMobDeath(mob, killer, 1);
	killer:setVar("eco_warrior_wind",3)
	setGlobalVar("ShakhramiWyrmfly",0);
end;