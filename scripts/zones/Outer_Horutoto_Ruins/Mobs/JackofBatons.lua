-- Jack of Batons
-- by ReaperX
-- Windurst 6-1 Mission

require("scripts/globals/settings");
require("scripts/globals/rankpoints");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

function OnMobDeath(mob, player)
	mobsup = getGlobalVar("Windy_6_1_Fight");
	mobsup = mobsup - 1;
	setGlobalVar("Windy_6_1_Fight",mobsup);
	if (mobsup == 0) then
		setGlobalVar("Windy_6_1_LastClear",os.time());
	end;
end;