-- Gordov's Ghost
-- by ReaperX
-- Pops in Bastok mission 8-2 "Enter the Talekeeper"

require("scripts/globals/settings");
require("scripts/globals/rankpoints");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
	--print(mob:getName());
end;

function OnMobDeath(mob, killer)
  mobsup = getGlobalVar("Bastok_8_2_Fight");
  setGlobalVar("Bastok_8_2_Fight",mobsup - 1);
  if (mobsup == 1) then
    setGlobalVar("Bastok_8_2_LastClear",os.time())
  end;
end;