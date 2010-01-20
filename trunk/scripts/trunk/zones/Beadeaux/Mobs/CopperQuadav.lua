-- Copper Quadav
-- by ReaperX
-- for Bastok mission 3-1

require("scripts/globals/settings");
require("scripts/globals/rankpoints");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

function OnMobDeath(mob, killer)	
	if (killer:getMissionStatus(1,10) == 1) then
		coppers = killer:getVar("mission_status");
		if (coppers >= 3) then
			coppers = coppers + 1;
			--print("Bastok Mission 3-1 Copper Quadav Count:",coppers-3);
			killer:setVar("mission_status",coppers);
		end
	end
end;

