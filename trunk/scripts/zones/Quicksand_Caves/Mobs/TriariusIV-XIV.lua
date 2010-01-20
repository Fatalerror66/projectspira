-- Triarius IV-XIV 
-- by ReaperX
-- Pops in Bastok mission 8-1 "The Chains that Bind Us"

require("scripts/globals/settings");
require("scripts/globals/rankpoints");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
	--print(mob:getName());
end;

function OnMobDeath(mob, killer)
  mobsup = getGlobalVar("Bastok_8_1_Fight");
  setGlobalVar("Bastok_8_1_Fight",mobsup - 1);
  if (mobsup == 1) then
    setGlobalVar("Bastok_8_1_LastClear",os.time())
  end;
end;