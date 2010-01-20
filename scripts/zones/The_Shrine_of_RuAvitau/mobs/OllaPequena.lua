require("scripts/globals/settings");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
	--print(mob:getName());
end;

function OnMobDeath(mob, killer)
	--print("(ZONE)congratulations, you killed", mob:getName());
	sky = Zone(0xb2);
	sky:spawnMob("OllaMedia",mob:getXPos(),mob:getYPos(),mob:getZPos(),mob:getRot(),killer:getId());
end;