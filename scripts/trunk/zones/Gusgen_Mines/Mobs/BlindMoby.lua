-- Blind Moby
-- by ReaperX
-- Bastok mission "To the Forsaken Mines"

require("scripts/globals/settings");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
	--print(mob:getName());
end;

function OnMobDeath(mob, killer)
  killer:setVar("mission_status",3);
end;