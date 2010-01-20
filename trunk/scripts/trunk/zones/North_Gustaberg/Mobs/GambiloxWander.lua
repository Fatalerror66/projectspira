-- Gambilox Wanderling
-- by ReaperX
-- NM for THF AF2
-- problem: only killer gets credit for killing NM. Unfixable for now.

require("scripts/globals/settings");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

function OnMobDeath(mob, player)
	player:setVar("THF_AF2_GAMBLING",6);
end;