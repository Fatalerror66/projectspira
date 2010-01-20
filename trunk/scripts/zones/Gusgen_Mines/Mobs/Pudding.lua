require("scripts/globals/settings");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
	setGlobalVar("GusgenPudding",1);
	--print(mob:getName());
end;

function OnMobDeath(mob, killer)

	--print("(MOB)congratulations, you killed", mob:getName());

	-- calls the parent mobkill function to inherit whatever that does.
	mob:OnMobDeath(mob, killer, 1);
	killer:setVar("eco_warrior_bast",3)
	setGlobalVar("GusgenPudding",0);
end;