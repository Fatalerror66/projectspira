-- Queen of Swords
-- by ReaperX
-- Windurst 8-2 Mission

require("scripts/globals/settings");
require("scripts/globals/rankpoints");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

function OnMobDeath(mob, player)
	mobsup = getGlobalVar("Windy_8_2_Fight");
	mobsup = mobsup - 1;
	setGlobalVar("Windy_8_2_Fight",mobsup);
	if (mobsup == 0) then
		setGlobalVar("Windy_8_2_LastClear",os.time());
	end;
end;